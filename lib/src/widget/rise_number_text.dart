import 'package:flutter/material.dart';

/// @author: zx
/// @description: 简易实现数字滚动效果
class RiseNumberText extends StatefulWidget {
  /// 值
  final num number;

  /// 限定的最大的值，默认 9999
  final num maxNumber;

  /// 字体风格
  final TextStyle? style;

  /// 动画时长
  final int duration;

  const RiseNumberText(this.number,{
    Key? key,
    this.maxNumber = 9999,
    this.style,
    this.duration = 1200
  }) : super(key: key);

  @override
  _RiseNumberTextState createState() => _RiseNumberTextState();
}

class _RiseNumberTextState extends State<RiseNumberText> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;
  num _fromNumber = 0;
  
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: Duration(milliseconds: widget.duration), vsync: this);
    final curve = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animation = Tween<double>(begin: 0, end: 1).animate(curve);
    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(RiseNumberText oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 数据变化时执行动画
    if (oldWidget.number != widget.number) {
      _fromNumber = oldWidget.number;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        // 数字默认从0增长。数据变化时，由之前数字为基础变化。
        num now = _fromNumber + (_animation.value * (widget.number - _fromNumber));
        return Text(
          "${(now > widget.maxNumber ? widget.maxNumber : now).toStringAsFixed(0)}${now > widget.maxNumber ? "+" : ""}",
          style: widget.style,
        );
      },
    );
  }
}
