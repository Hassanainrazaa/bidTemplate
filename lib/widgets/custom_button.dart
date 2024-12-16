// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_flutter_web_project/utills/dimensions.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color iconColor;
  final double iconSize;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.green, // Default color is green
    this.borderColor = Colors.transparent,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    this.textStyle,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Updated to backgroundColor
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: textStyle ??
                TextStyle(color: Colors.white, fontSize: MySize.size15),
          ),
        ],
      ),
    );
  }
}
