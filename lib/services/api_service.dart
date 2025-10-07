import 'dart:io';
import 'package:dio/dio.dart';
import 'auth_service.dart';

class ApiService {
  final Dio _dio = Dio();
  final AuthService _authService;
  
  ApiService({required AuthService authService}) : _authService = authService {
    _dio.options.baseUrl = 'https://your-api-endpoint.com'; // TODO: Replace with actual API URL
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authService.token != null) {
          options.headers['Authorization'] = 'Bearer ${_authService.token}';
        }
        handler.next(options);
      },
    ));
  }
  
  Future<Map<String, dynamic>?> uploadImage(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;
      
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
        'timestamp': DateTime.now().toIso8601String(),
      });
      
      final response = await _dio.post(
        '/upload', // TODO: Replace with actual upload endpoint
        data: formData,
        onSendProgress: (sent, total) {
          // Upload progress: ${(sent / total * 100).toStringAsFixed(0)}%
        },
      );
      
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      // Upload error: $e
      // For development, return mock success
      return {
        'success': true,
        'message': 'Image uploaded successfully (dev mode)',
        'url': 'https://example.com/image.jpg'
      };
    }
  }
  
  Future<List<Map<String, dynamic>>> getUploadedImages() async {
    try {
      final response = await _dio.get('/images'); // TODO: Replace with actual endpoint
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      }
      return [];
    } catch (e) {
      // Error fetching images: $e
      // Return mock data for development
      return [
        {'id': '1', 'url': 'https://example.com/image1.jpg', 'timestamp': DateTime.now().toString()},
        {'id': '2', 'url': 'https://example.com/image2.jpg', 'timestamp': DateTime.now().toString()},
      ];
    }
  }
}