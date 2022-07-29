import 'package:flutter/material.dart';

/// @author: zx
/// @description: 自定义分级列表
class ClExpansionTile extends StatefulWidget {
  // 以下参数看ListTile的说明
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Color? selectedColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final MouseCursor? mouseCursor;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  //以下为预先定义状态的参数
  /// 标题文本
  final String? titleText;
  /// 标题文本样式
  final TextStyle? textStyle;
  /// 初始展开状态
  final bool initiallyExpanded;
  /// 是否在开展和收起时维持children状态
  final bool maintainState;
  /// 头部背景颜色
  final Color? headerColor;
  /// 展开收起回调
  final ValueChanged<bool>? onExpansionChanged;
  /// 子列表
  final List<Widget> children;
  /// 子列表padding
  final EdgeInsetsGeometry? childrenPadding;

  const ClExpansionTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.selectedColor,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.titleText,
    this.textStyle,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.headerColor,
    this.onExpansionChanged,
    required this.children,
    this.childrenPadding,
  }) : super(key: key);

  @override
  State<ClExpansionTile> createState() => _ClExpansionTileState();
}

class _ClExpansionTileState extends State<ClExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    Widget? title = widget.title;
    if (widget.titleText != null) {
      title ??= Text(
        widget.titleText!,
        style: widget.textStyle,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: widget.leading,
          title: title,
          subtitle: widget.subtitle,
          trailing: RotationTransition(
            turns: _iconTurns,
            child: widget.trailing ?? const Icon(Icons.expand_more),
          ),
          isThreeLine: widget.isThreeLine,
          dense: widget.dense,
          visualDensity: widget.visualDensity,
          shape: widget.shape,
          selectedColor: widget.selectedColor,
          contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 15),
          enabled: widget.enabled,
          onTap: widget.onTap ?? _handleTap,
          onLongPress: widget.onLongPress,
          mouseCursor: widget.mouseCursor,
          selected: widget.selected,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          tileColor: widget.tileColor,
          selectedTileColor:widget. selectedTileColor,
          enableFeedback: widget.enableFeedback,
          horizontalTitleGap: widget.horizontalTitleGap,
          minVerticalPadding: widget.minVerticalPadding,
          minLeadingWidth: widget.minLeadingWidth,
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
