import 'package:flutter/material.dart';

/// @author: zx
/// @description: 自定义ElevatedButton
class ClElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final String? text;
  final TextStyle? textStyle;

  const ClElevatedButton({
    Key? key,
    this.width,
    this.height,
    this.background,
    this.elevation = 0,
    this.borderRadius,
    this.onTap,
    this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(background ?? Theme.of(context).primaryColor),
          elevation: MaterialStateProperty.all(elevation),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(5))),
        ),
        onPressed: onTap,
        child: Text(
          text ?? "按钮",
          style: textStyle ?? const TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

///自定义线框按钮 OutlineButton
class ClOutlineButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final String text;
  final TextStyle? textStyle;

  const ClOutlineButton({
    Key? key,
    this.width,
    this.height,
    this.background,
    this.elevation = 0,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.onTap,
    this.text ="",
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(background ?? Colors.transparent),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor ??  const Color(0xFFECECEC),
              width: borderWidth ?? 1,
            ),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(5))),
        ),
        child: Text(
          text,
          style: textStyle ?? const TextStyle(
            color:   Color(0xFF5B5B5B),
            fontSize: 14,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
