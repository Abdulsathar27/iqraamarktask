import 'package:flutter/material.dart';
import 'package:iqraamarktask/services/local_storeage_services.dart';



class AuthController extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(
      const Duration(seconds: 2),
    );

    await LocalStorageService.saveLoginTime();

    isLoading = false;
    notifyListeners();

    return true;
  }
}