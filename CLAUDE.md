# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

DocGator is an expense document management Flutter application built with Flutter 3.35.5 and Dart 3.9.2. It allows users to:
1. Login with authentication
2. Select expense lists
3. Choose expense items
4. Capture/select documents (camera, gallery, file picker)
5. Edit images (crop, rotate, flip)
6. Save and upload processed documents to an API

## Essential Commands

### Development
```bash
# Install dependencies
flutter pub get

# Run the application
flutter run

# Run with specific device (list devices first)
flutter devices
flutter run -d <device_id>

# Hot reload (while app is running)
r

# Hot restart (while app is running)
R
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

### Code Quality
```bash
# Analyze code for issues
flutter analyze

# Format code
dart format .

# Check for dependency updates
flutter pub outdated
```

### Building
```bash
# Build for Android
flutter build apk
flutter build appbundle

# Build for iOS
flutter build ios

# Build for Web
flutter build web

# Build for Windows
flutter build windows

# Build for macOS
flutter build macos

# Build for Linux
flutter build linux
```

## Project Structure

The application architecture:

- **lib/main.dart**: Entry point with MultiProvider setup and routing
- **lib/screens/**: UI screens (login, expense lists, expense items, document capture, image editor)
- **lib/providers/**: State management (AuthProvider, ExpenseProvider)
- **lib/services/**: Business logic (AuthService, ApiService, ExpenseService)
- **lib/models/**: Data models (ExpenseList, ExpenseItem)
- **test/**: Widget tests
- **pubspec.yaml**: Dependencies including image_picker, image_cropper, dio, provider, flutter_secure_storage

## Key Dependencies

- **State Management**: Provider
- **HTTP/API**: Dio
- **Image Handling**: image_picker, image_cropper, image package
- **File Selection**: file_picker
- **Secure Storage**: flutter_secure_storage
- **Permissions**: permission_handler

## Development Notes

- Default login credentials for development: username: "admin", password: "password"
- API endpoints need to be configured in services (currently using mock data)
- The app uses Material Design 3 with deepPurple color scheme
- Images are processed and can be rotated, flipped, and cropped before upload
- Secure storage is used for auth token persistence