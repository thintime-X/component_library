import 'package:flutter/material.dart';

import 'image_view.dart';

/// @author: zx
/// @description: 图片文字组件
class ClImageTextView extends StatelessWidget {
  /// 图片链接
  final String url;

  /// 文字
  final String title;

  /// 图文组件
  final Widget? imageWidget;

  /// 图片宽度
  final double? imgWidth;

  /// 图片高度
  final double? imgHeight;

  /// 图片圆角
  final BorderRadius borderRadius;

  /// 图片填充方式
  final BoxFit? fit;

  /// 文字样式
  final TextStyle? textStyle;

  /// 点击回调
  final Function()? onTap;

  /// 图片与文字间的间距
  final double? spacing;

  /// 图片与文字的排列方式
  final ImageTextMode? mode;

  const ClImageTextView({
    Key? key,
    required this.url,
    required this.title,
    this.imageWidget,
    this.imgWidth,
    this.imgHeight,
    this.borderRadius = BorderRadius.zero,
    this.fit,
    this.textStyle,
    this.onTap,
    this.spacing,
    this.mode = ImageTextMode.topImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _child(),
    );
  }

  Widget _child() {
    if (mode == ImageTextMode.leftImage) {
      return Row(
        children: [
          _image(),
          _spacing(),
          _text(),
        ],
      );
    } else if (mode == ImageTextMode.rightImage){
      return Row(
        children: [
          _text(),
          _spacing(),
          _image(),
        ],
      );
    }else if (mode == ImageTextMode.bottomImage){
      return Column(
        children: [
          _text(),
          _spacing(),
          _image(),
        ],
      );
    }else {
      return Column(
        children: [
          _image(),
          _spacing(),
          _text(),
        ],
      );
    }
  }

  Widget _image() {
    return imageWidget ?? ClImageView(
      url: url,
      width: imgWidth ?? 20,
      height: imgHeight ?? 20,
      borderRadius: borderRadius,
      onTap: onTap,
      fit: fit,
    );
  }

  Widget _text() {
    return Text(
      title,
      style: textStyle ?? const TextStyle(
        fontSize: 10,
        color: Color(0xFF808080),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _spacing() {
    if (mode == ImageTextMode.leftImage || mode == ImageTextMode.rightImage) {
      return SizedBox(
        width: spacing ?? 1,
      );
    } else {
      return SizedBox(
        height: spacing ?? 1,
      );
    }
  }
}

enum ImageTextMode {
  ///左图片右文字模式
  leftImage,
  ///右图片左文字模式
  rightImage,
  ///顶部图片底部文字模式
  topImage,
  ///底部图片顶部文字模式
  bottomImage,
}
