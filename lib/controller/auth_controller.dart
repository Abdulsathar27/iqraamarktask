import 'package:flutter/material.dart';
import 'package:iqraamarktask/services/local_storeage_services.dart';


class AuthController extends ChangeNotifier {
  bool isLoading = false;

  String errorMessage = "";

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;

      errorMessage = "";

      notifyListeners();

      await Future.delayed(
        const Duration(seconds: 2),
      );

      if (email == "sathar@gmail.com" &&
          password == "123456") {
        await LocalStorageService
            .saveLoginTime();

        return true;
      } else {
        errorMessage =
            "Invalid email or password";

        return false;
      }
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}