import 'package:flutter/material.dart';
import 'package:my_flutter_web_project/features/login/repository.dart';
import 'package:my_flutter_web_project/features/login/user_model.dart';

class UserController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Registration Method

  // Login Method
  Future<User?> loginUser(String email, String password) async {
    _isLoading = true;
    _errorMessage = null; // Clear previous errors
    notifyListeners();

    try {
      // Call the AuthService to handle login
      final user = await _authService.handleLoginUser(email, password);

      if (user != null) {
        // Successfully logged in, return the user object
        return user;
      } else {
        // Handle login failure
        _errorMessage = 'Login failed. Please check your credentials.';
      }
    } catch (e) {
      // Handle error during login
      _errorMessage = 'An error occurred during login: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return null; // Return null if login fails
  }

  // Logout Method (Optional)
  Future<void> logoutUser() async {
    try {
//      await _authService.logout(); // Call the logout method from AuthService
      // Handle any additional logout logic if necessary
    } catch (e) {
      _errorMessage = 'An error occurred during logout: $e';
    }
  }
}
