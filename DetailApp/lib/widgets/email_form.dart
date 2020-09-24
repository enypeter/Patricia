import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    this.label,
    this.hint,
    this.onSaved,
    this.onChanged,
    this.validator,
  });
  final String label;
  final String hint;
  final Function onSaved;
  final Function onChanged;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
      ),
    );
  }
}
