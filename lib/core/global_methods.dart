import 'package:flutter/material.dart';

/// show snack bar
void showGlobalSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
