import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
    this.label,
    this.floatinglabel,
    this.hintText,
    this.keyboardType = TextInputType.multiline,
    this.suffixIcon,
    this.controller,
    this.obsecureText = false,
    this.readOnly = false,
    this.onChanged,
    this.enabled = true,
    this.onTap});

  final Widget? label;
  final String? floatinglabel;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obsecureText;
  final bool readOnly;
  final bool enabled;
  final Function(String)? onChanged;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Visibility(
            visible: label != null,
            child: label ??
                SizedBox()
        ),
        Container(
          color: Colors.white,
          child: TextField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obsecureText,
            readOnly: readOnly,
            onTap: onTap,
            enabled: enabled,
            onChanged: onChanged,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                labelText: floatinglabel,
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
            ),
          ),
        )
      ],
    );
  }
}
