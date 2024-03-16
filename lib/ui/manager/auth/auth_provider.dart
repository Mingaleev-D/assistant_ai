import 'package:assistant_ai/core/global_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isSuccess = false;
  String? _uid;
  String? _phoneNumber;
  USerModel? _uSerModel;

  bool get isLoading => _isLoading;

  bool get isSuccess => _isSuccess;

  String? get uid => _uid;

  String? get phoneNumber => _phoneNumber;

  USerModel? get uSerModel => _uSerModel;

  final FirebaseAuth _authFirebase = FirebaseAuth.instance;
  final FirebaseFirestore _dbFirebaseStore = FirebaseFirestore.instance;
  final FirebaseStorage _storageFirebase = FirebaseStorage.instance;

  /// вход с номерома телефона
  Future<void> signInWithPhoneNumber({
    required String phoneParam,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    await _authFirebase.verifyPhoneNumber(
      phoneNumber: phoneParam,
      verificationCompleted: (phoneAuthCredential) async {
        await _authFirebase
            .signInWithCredential(phoneAuthCredential)
            .then((value) async {
          _uid = value.user!.uid;
          _phoneNumber = value.user!.phoneNumber;
          _isSuccess = true;
          _isLoading = false;
          notifyListeners();
        });
      },
      verificationFailed: (error) {
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
        showGlobalSnackBar(context, error.message!);
      },
      codeSent: (verificationId, forceResendingToken) {
        _isLoading = false;
        notifyListeners();
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text('code sent')));
        /// вход с кодом
        print('Screen OTP');
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
