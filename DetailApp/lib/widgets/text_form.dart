import 'package:flutter/material.dart';

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    this.label,
    this.hint,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.controller,
  });
  final String label;
  final String hint;
  final Function onSaved;
  final Function onChanged;
  final Function validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.go,
      autofocus: true,
      controller: controller,
      textCapitalization: TextCapitalization.words,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
