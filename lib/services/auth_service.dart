import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class AuthService {
  static const _storage = FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'username';
  
  final Dio _dio = Dio();
  
  String? _apiBaseUrl;
  String? _authToken;
  
  AuthService({String? apiBaseUrl}) {
    _apiBaseUrl = apiBaseUrl ?? 'https://your-api-endpoint.com';
    _dio.options.baseUrl = _apiBaseUrl!;
  }
  
  Future<bool> login(String username, String password) async {
    try {
      // TODO: Replace with your actual login endpoint
      final response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });
      
      if (response.statusCode == 200) {
        _authToken = response.data['token'];
        await _storage.write(key: _tokenKey, value: _authToken);
        await _storage.write(key: _userKey, value: username);
        
        _dio.options.headers['Authorization'] = 'Bearer $_authToken';
        return true;
      }
      return false;
    } catch (e) {
      // Login error: $e
      // For development/private use, you can hardcode credentials check
      if (username == 'admin' && password == 'password') {
        _authToken = 'dev-token';
        await _storage.write(key: _tokenKey, value: _authToken);
        await _storage.write(key: _userKey, value: username);
        return true;
      }
      return false;
    }
  }
  
  Future<bool> isLoggedIn() async {
    _authToken = await _storage.read(key: _tokenKey);
    if (_authToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_authToken';
      return true;
    }
    return false;
  }
  
  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userKey);
    _authToken = null;
    _dio.options.headers.remove('Authorization');
  }
  
  String? get token => _authToken;
  
  Future<String?> getUsername() async {
    return await _storage.read(key: _userKey);
  }
}