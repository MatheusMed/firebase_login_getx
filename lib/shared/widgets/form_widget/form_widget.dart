import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;

  const FormWidget({
    Key? key,
    this.controller,
    this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
