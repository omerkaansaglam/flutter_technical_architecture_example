import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField(
      {Key? key,
      String? title,
      bool isSecure = false,
      Widget? suffixIcon,
      String? Function(String?)? validator,
      bool? filled,
      bool inputEnabled = false,
      Color? filledColor,
      TextEditingController? controller,
      void Function(String?)? onSaved})
      : super(
          key: key,
          controller: controller,
          validator: validator,
          onTap: null,
          onSaved: onSaved,
          obscureText: isSecure,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.blue,
          decoration: inputEnabled
              ? InputDecoration(
                  disabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  label: Text(title ?? ""),
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  enabled: false)
              : InputDecoration(label: Text(title ?? "")),
        );
}
