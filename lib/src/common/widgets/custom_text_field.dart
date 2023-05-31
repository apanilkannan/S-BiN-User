import 'package:flutter/material.dart';
import 'package:s_bin/gen/colors.gen.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    required this.hint,
    required this.textInputType,
  });

  final TextEditingController textController;
  final String hint;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorName.black,
      controller: textController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorName.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorName.black,
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
