import 'package:flutter/material.dart';

import '../../utils/index.dart';

class TextBoxCell extends StatelessWidget {
  final ValueChanged<String> onSaved;
  final TextInputType textInputType;
  final String Function(String) validator;
  final String initialValue;
  final bool obscureText;

  const TextBoxCell({
    Key key,
    this.onSaved,
    this.textInputType,
    this.validator,
    this.initialValue,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      keyboardType: textInputType,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: textPrimaryColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: textPrimaryColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
