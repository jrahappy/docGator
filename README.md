# DocGator

Receipt and expense document management Flutter application.

## Features

- **User Authentication**: Secure login with token-based authentication
- **Expense Management**: Browse and select expense lists and items
- **Document Capture**: Multiple options for adding documents
  - Camera capture
  - Gallery selection
  - File picker from device storage
- **Image Editing**: Full editing capabilities
  - Crop with multiple aspect ratios
  - Rotate (left/right)
  - Flip (horizontal/vertical)
- **Save & Upload**: Process and upload documents to API endpoints

## Getting Started

### Prerequisites

- Flutter 3.35.5 or higher
- Dart 3.9.2 or higher

### Installation

1. Clone the repository
```bash
git clone https://github.com/jrahappy/docGator.git
cd docgator
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the application
```bash
flutter run
```

### Development Credentials

For development testing:
- Username: `admin`
- Password: `password`

### Configuration

Update the API endpoints in the following service files with your backend URLs:
- `lib/services/auth_service.dart`
- `lib/services/api_service.dart`
- `lib/services/expense_service.dart`

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models
│   └── expense_model.dart
├── providers/                # State management
│   ├── auth_provider.dart
│   └── expense_provider.dart
├── screens/                  # UI screens
│   ├── login_screen.dart
│   ├── expense_list_screen.dart
│   ├── expense_items_screen.dart
│   ├── document_capture_screen.dart
│   └── image_editor_screen.dart
└── services/                 # Business logic
    ├── auth_service.dart
    ├── api_service.dart
    └── expense_service.dart
```

## Built With

- [Flutter](https://flutter.dev/) - UI framework
- [Provider](https://pub.dev/packages/provider) - State management
- [Dio](https://pub.dev/packages/dio) - HTTP client
- [Image Picker](https://pub.dev/packages/image_picker) - Camera and gallery access
- [Image Cropper](https://pub.dev/packages/image_cropper) - Image cropping
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) - Secure token storage

## License

This project is for private use only.

## Author

jrahappy