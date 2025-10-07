import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService;
  bool _isAuthenticated = false;
  String? _username;

  AuthProvider({required this.authService});

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;

  Future<bool> checkAuthStatus() async {
    _isAuthenticated = await authService.isLoggedIn();
    if (_isAuthenticated) {
      _username = await authService.getUsername();
    }
    notifyListeners();
    return _isAuthenticated;
  }

  Future<bool> login(String username, String password) async {
    final success = await authService.login(username, password);
    if (success) {
      _isAuthenticated = true;
      _username = username;
      notifyListeners();
    }
    return success;
  }

  Future<void> logout() async {
    await authService.logout();
    _isAuthenticated = false;
    _username = null;
    notifyListeners();
  }
}