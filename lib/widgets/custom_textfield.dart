import 'package:flutter/material.dart';
import 'package:my_flutter_web_project/utills/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final InputDecoration? decoration;
  final bool enabled;
  final Color? backgroundColor;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.padding,
    this.decoration,
    this.enabled = true,
    this.backgroundColor = Colors.white,
    this.borderRadius = 8.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      height: MySize.size55,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(MySize.size15),
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          enabled: enabled,
          decoration: decoration ??
              InputDecoration(
                labelText: label,
                hintText: hint,
                border: InputBorder.none, // Removes default border
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
        ),
      ),
    );
  }
}
