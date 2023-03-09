import 'package:flutter/material.dart';

class AltaTextFormField extends StatelessWidget {
  const AltaTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.onTap,
    this.suffixText,
    this.suffixIcon,
    this.validator,
    this.obscureText,
    this.maxLines,
    this.style,
    this.enabledBorder,
    this.onChanged,
    this.initialValue,
    this.labelText,
  });
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? hintText;
  final GestureTapCallback? onTap;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator? validator;
  final int? maxLines;
  final TextStyle? style;
  final InputBorder? enabledBorder;
  final ValueChanged<String>? onChanged;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        style: style,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        validator: (value) => validateForm(value ?? ''),
        decoration: InputDecoration(
            labelText: labelText,
            suffixText: suffixText,
            suffixIcon: suffixIcon,
            hintText: hintText,
            enabledBorder: enabledBorder,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            )),
        onTap: onTap,
        onChanged: onChanged,
      ),
    );
  }

  String? validateForm(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
