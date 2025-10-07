import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../providers/expense_provider.dart';
import '../services/api_service.dart';
import '../providers/auth_provider.dart';

class ImageEditorScreen extends StatefulWidget {
  final File imageFile;

  const ImageEditorScreen({super.key, required this.imageFile});

  @override
  State<ImageEditorScreen> createState() => _ImageEditorScreenState();
}

class _ImageEditorScreenState extends State<ImageEditorScreen> {
  late File _currentImage;
  bool _isProcessing = false;
  bool _isSaving = false;
  int _rotationAngle = 0;
  bool _isFlippedHorizontal = false;
  bool _isFlippedVertical = false;
  late ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _currentImage = widget.imageFile;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _apiService = ApiService(authService: authProvider.authService);
  }

  Future<void> _cropImage() async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: _currentImage.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Document',
            toolbarColor: Colors.deepPurple,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
          ),
          IOSUiSettings(
            title: 'Crop Document',
            cancelButtonTitle: 'Cancel',
            doneButtonTitle: 'Done',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _currentImage = File(croppedFile.path);
        });
      }
    } catch (e) {
      _showErrorDialog('Error cropping image: $e');
    }
  }

  Future<void> _rotateImage(int degrees) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final bytes = await _currentImage.readAsBytes();
      img.Image? image = img.decodeImage(bytes);
      
      if (image != null) {
        img.Image rotated = img.copyRotate(image, angle: degrees);
        
        final tempDir = await getTemporaryDirectory();
        final tempPath = path.join(
          tempDir.path,
          'rotated_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        
        File tempFile = File(tempPath);
        await tempFile.writeAsBytes(img.encodeJpg(rotated, quality: 90));
        
        setState(() {
          _currentImage = tempFile;
          _rotationAngle = (_rotationAngle + degrees) % 360;
          _isProcessing = false;
        });
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      _showErrorDialog('Error rotating image: $e');
    }
  }

  Future<void> _flipImage({bool horizontal = true}) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final bytes = await _currentImage.readAsBytes();
      img.Image? image = img.decodeImage(bytes);
      
      if (image != null) {
        img.Image flipped;
        if (horizontal) {
          flipped = img.flipHorizontal(image);
          _isFlippedHorizontal = !_isFlippedHorizontal;
        } else {
          flipped = img.flipVertical(image);
          _isFlippedVertical = !_isFlippedVertical;
        }
        
        final tempDir = await getTemporaryDirectory();
        final tempPath = path.join(
          tempDir.path,
          'flipped_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        
        File tempFile = File(tempPath);
        await tempFile.writeAsBytes(img.encodeJpg(flipped, quality: 90));
        
        setState(() {
          _currentImage = tempFile;
          _isProcessing = false;
        });
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      _showErrorDialog('Error flipping image: $e');
    }
  }

  Future<void> _saveImage() async {
    setState(() {
      _isSaving = true;
    });

    try {
      final expenseProvider = Provider.of<ExpenseProvider>(context, listen: false);
      final selectedItem = expenseProvider.selectedItem;
      
      if (selectedItem != null) {
        // Upload image to API
        final result = await _apiService.uploadImage(_currentImage);
        
        if (result != null) {
          // Add attachment to expense
          await expenseProvider.addAttachmentToExpense(
            selectedItem.id,
            _currentImage.path,
          );
          
          if (!mounted) return;
          
          _showSuccessDialog('Document saved successfully!');
          
          // Navigate back to expense items
          Navigator.of(context).popUntil(
            ModalRoute.withName('/expense-items'),
          );
        } else {
          _showErrorDialog('Failed to upload image');
        }
      } else {
        // Save to local storage if no expense is selected
        final directory = await getApplicationDocumentsDirectory();
        final fileName = 'doc_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final savePath = path.join(directory.path, fileName);
        
        await _currentImage.copy(savePath);
        
        if (!mounted) return;
        
        _showSuccessDialog('Document saved to device!');
        Navigator.of(context).pop();
      }
    } catch (e) {
      _showErrorDialog('Error saving image: $e');
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Document'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: _isSaving ? null : _saveImage,
            icon: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.check, color: Colors.white),
            label: Text(
              _isSaving ? 'Saving...' : 'Save',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[900],
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 0.5,
                    maxScale: 4,
                    child: Center(
                      child: Image.file(
                        _currentImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                if (_isProcessing)
                  Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildEditButton(
                        icon: Icons.crop,
                        label: 'Crop',
                        onPressed: _isProcessing ? null : _cropImage,
                      ),
                      const SizedBox(width: 12),
                      _buildEditButton(
                        icon: Icons.rotate_left,
                        label: 'Rotate Left',
                        onPressed: _isProcessing ? null : () => _rotateImage(-90),
                      ),
                      const SizedBox(width: 12),
                      _buildEditButton(
                        icon: Icons.rotate_right,
                        label: 'Rotate Right',
                        onPressed: _isProcessing ? null : () => _rotateImage(90),
                      ),
                      const SizedBox(width: 12),
                      _buildEditButton(
                        icon: Icons.flip,
                        label: 'Flip H',
                        onPressed: _isProcessing ? null : () => _flipImage(horizontal: true),
                      ),
                      const SizedBox(width: 12),
                      _buildEditButton(
                        icon: Icons.flip,
                        label: 'Flip V',
                        onPressed: _isProcessing ? null : () => _flipImage(horizontal: false),
                      ),
                    ],
                  ),
                ),
                if (_rotationAngle != 0 || _isFlippedHorizontal || _isFlippedVertical) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Applied: ${_rotationAngle != 0 ? 'Rotated $_rotationAngle° ' : ''}${_isFlippedHorizontal ? 'Flipped H ' : ''}${_isFlippedVertical ? 'Flipped V' : ''}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}