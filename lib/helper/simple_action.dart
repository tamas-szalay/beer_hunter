import 'package:flutter/widgets.dart';

class SimpleAction {
 
  final String title;
  final VoidCallback? onPressed;
  SimpleAction({
    required this.title,
    required this.onPressed,
  });

  static SimpleAction? optionalActionWith(
      {required String? title, required VoidCallback? action}) {
    if (title != null && action != null) {
      return SimpleAction(title: title, onPressed: action);
    }
    return null;
  }

  
}