import 'package:flutter/material.dart';
import 'package:note_app3/constant.dart';
// import 'package:note_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'this is required';
          } else {
            return null;
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          focusColor: kPrimaryColor,
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
          hintStyle: const TextStyle(color: kPrimaryColor),
          hintText: hintText,
          labelText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
