import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @author: zx
/// @description: 自定义标题栏
class ClAppBar extends StatefulWidget implements PreferredSizeWidget{
  /// 背景色
  final Color? background;
  /// 阴影大小
  final double? elevation;
  /// 阴影颜色
  final Color? shadowColor;
  /// 应用栏的 [Material] 形状及其阴影
  final ShapeBorder? shape;
  /// 标题前的组件
  final Widget? leading;
  /// 标题前的组件设为返回按钮
  final bool backLeading;
  final double? leadingWidth;
  /// 标题文本，当 [titleWidget] 不为空时无效
  final String? title;
  /// 标题居中
  final bool centerTitle;
  /// 标题文本样式，当 [titleWidget] 不为空时无效
  final TextStyle? titleStyle;
  /// 自定义标题内容，与[title]互斥
  final Widget? titleWidget;
  /// 在 [title] 小部件之后连续显示的小部件列表。
  final List<Widget>? actions;
  ///标题栏底部的组件
  final PreferredSizeWidget? bottom;
  ///标题栏高度
  final double? toolbarHeight;
  final double opacity;
  final double bottomOpacity;

  const ClAppBar({
    Key? key,
    this.background,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.leading,
    this.backLeading = true,
    this.leadingWidth,
    this.title,
    this.centerTitle = false,
    this.titleStyle,
    this.titleWidget,
    this.actions,
    this.bottom,
    this.toolbarHeight,
    this.opacity = 1.0,
    this.bottomOpacity = 1.0,
  }) : super(key: key);

  @override
  State<ClAppBar> createState() => _ClAppBarState();

  @override
  Size get preferredSize => _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
}

class _ClAppBarState extends State<ClAppBar> {
  double get leadingWidth => widget.leadingWidth ?? 30;

  @override
  Widget build(BuildContext context) {
    ///获取AppBar主题配置
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    ///获取背景色
    final Color background = widget.background ?? appBarTheme.backgroundColor ?? Theme.of(context).primaryColor;
    ///标题栏高度
    final double toolbarHeight = widget.toolbarHeight ?? appBarTheme.toolbarHeight ?? kToolbarHeight;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    /// 标题
    Widget? title = widget.titleWidget;
    title ??= Align(
      alignment: widget.centerTitle ? Alignment.center : Alignment.centerLeft,
      child: Text(
        widget.title ?? "",
        style: widget.titleStyle ?? appBarTheme.titleTextStyle ?? TextStyle(
          fontSize: 16,
          color: background.computeLuminance() < .5 ? Colors.white : Colors.black,
        ),
      ),
    );

    ///
    Widget? leading = widget.leading;
    if (widget.leading == null) {
      if ((parentRoute?.canPop ?? false) && widget.backLeading) {
        leading = BackButton(
          color: widget.titleStyle?.color ?? (background.computeLuminance() < .5 ? Colors.white : Colors.black),
        );
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: leadingWidth),
        child: leading,
      );
    }
    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    }

    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(toolbarHeight),
        child: NavigationToolbar(
          leading: leading,
          middle: title,
          trailing: actions,
        ),
      ),
    );

    if (widget.bottom != null) {
      appBar = Column(
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: toolbarHeight, minHeight: toolbarHeight),
              child: appBar,
            ),
          ),
          if (widget.bottomOpacity == 1.0)
            widget.bottom!
          else
            Opacity(
              opacity: const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(widget.bottomOpacity),
              child: widget.bottom,
            ),
        ],
      );
    }
    appBar = SafeArea(child: appBar, bottom: false,);

    return AnnotatedRegion(
      value: _systemOverlayStyleForBrightness(ThemeData.estimateBrightnessForColor(background)),
      child: Material(
        color: background,
        elevation: widget.elevation ?? appBarTheme.elevation ?? 0,
        shadowColor: widget.shadowColor,
        shape: widget.shape ?? appBarTheme.shape,
        child: appBar,
      ),
    );
  }

  ///返回状态栏图片亮度
  SystemUiOverlayStyle _systemOverlayStyleForBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout(this.toolbarHeight);

  final double toolbarHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}
