import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 自定义图片显示控件 可传入 本地图片和在线图片
class ClImageView extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final Color? color;
  final BorderRadius? borderRadius; //圆角
  final Widget? errorImg; //错误图片
  final BoxFit? fit; //图片填充方式
  final Function()? onTap;
  final int? memCacheWidth; //缓存宽度
  final int? memCacheHeight; //缓存高度

  const ClImageView({
    Key? key,
    this.width,
    this.height,
    required this.url,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.errorImg,
    this.fit,
    this.onTap,
    this.memCacheWidth,
    this.memCacheHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_isCorrectImg(url)) {
      return _LoadNetworkImg(
        url: url,
        width: width,
        height: height,
        borderRadius: borderRadius,
        errorImg: errorImg,
        fit: fit,
        onTap: onTap,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
      );
    } else if (url.contains("assets") || url.contains("images") ||
    url.contains("img") || url.contains("image")) {
      return _LoadLocalImg(
        url: url,
        width: width,
        height: height,
        borderRadius: borderRadius,
        fit: fit,
        color: color,
        onTap: onTap,
      );
    }else {
      return _ErrorImg(
        width: width,
        height: height,
        borderRadius: borderRadius,
        errorImg: errorImg,
      );
    }
  }

  ///判断是否是网络图片
  bool _isCorrectImg(String imgUrl) {
    if (imgUrl.length > 7 && (imgUrl.substring(0, 7) == "http://" || imgUrl.substring(0, 8) == "https://")) {
      return true;
    } else {
      return false;
    }
  }
}

///正确加载网络图片
class _LoadNetworkImg extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final BorderRadius? borderRadius; //圆角
  final Widget? errorImg; //错误图片
  final BoxFit? fit; //图片填充方式
  final Function()? onTap;
  final int? memCacheWidth; //缓存宽度
  final int? memCacheHeight; //缓存高度

  const _LoadNetworkImg({
    Key? key,
    this.width,
    this.height,
    required this.url,
    this.borderRadius = BorderRadius.zero,
    this.errorImg,
    this.fit,
    this.onTap,
    this.memCacheWidth,
    this.memCacheHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          memCacheWidth: memCacheWidth,
          memCacheHeight: memCacheHeight,
          errorWidget: (context, url, error) => errorImg ?? const _ErrorImg(),
          //暂时设为无动画
          placeholder: (context, url) => Container(
            color: const Color(0xFFECECEC),
          ),
        ),
      ),
    );
  }
}

///图片加载错误时显示
class _ErrorImg extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? errorImg; //错误图片
  final BorderRadius? borderRadius; //圆角

  const _ErrorImg({
    Key? key,
    this.width,
    this.height,
    this.errorImg,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return errorImg ??
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: const Color(0xFFECECEC), borderRadius: borderRadius),
        );
  }
}

///加载本地图片
class _LoadLocalImg extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final BorderRadius? borderRadius; //圆角
  final Function()? onTap;
  final Color? color;
  final BoxFit? fit; //图片填充方式

  const _LoadLocalImg({
    Key? key,
    this.width,
    this.height,
    required this.url,
    this.borderRadius = BorderRadius.zero,
    this.onTap,
    this.color,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          color: color,
        ),
      ),
    );
  }
}
