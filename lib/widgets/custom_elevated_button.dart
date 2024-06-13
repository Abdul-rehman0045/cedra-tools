import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.height,
    required this.width,
    required this.onPressed,
    this.fontSize,
    this.enabled = true,
  });
  final String text;
  final Color backgroundColor;
  final double height;
  final double width;
  final onPressed;
  final double? fontSize;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4.r,
          ),
        ),
      ),
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: fontSize ?? 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
