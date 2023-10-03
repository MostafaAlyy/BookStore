import 'package:flutter/material.dart';

Widget defaultTextFormFelid({
  required TextEditingController controller,
  required String text,
  required Icon prefixIcon,
  required Color fillColor,
  bool? enabled,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextFormField(
      controller: controller,
      enabled: enabled ?? true,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Please enter $text";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: text,
        labelStyle: TextStyle(color: fillColor),
        prefixIcon: prefixIcon,
      ),
    ),
  );
}
