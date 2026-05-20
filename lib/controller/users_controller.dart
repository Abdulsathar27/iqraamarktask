import 'package:flutter/material.dart';
import 'package:iqraamarktask/models/user_model.dart';


import '../services/api_service.dart';

class UsersController extends ChangeNotifier {
  final ApiService apiService = ApiService();

  bool isLoading = false;

  String errorMessage = "";

  List<UserModel> users = [];

  Future<void> getUsers() async {
    try {
      isLoading = true;
      errorMessage = "";

      notifyListeners();

      users = await apiService.fetchUsers();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}