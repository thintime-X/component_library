import 'package:flutter/material.dart';

/// @author: zx
/// @description: 自定义ListTile，预先定义多个状态
class ClListTile extends StatelessWidget {
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
  /// 尾部箭头
  final bool trailingArrow;
  /// 尾部箭头图标
  final Widget? trailingArrowIcon;
  /// 尾部文本组件
  final String? trailingText;
  /// 尾部文本样式
  final TextStyle? trailingTextStyle;
  /// 尾部开关组件
  final bool trailingSwitch;
  /// 开关的值
  final bool switchValue;
  /// 开关的回调
  final Function(bool value)? onSwitchChanged;
  /// 尾部复选框组件
  final bool trailingCheckBox;
  final double? trailingCheckBoxWidth;
  /// 复选框值
  final bool checkBoxValue;
  /// 复选框回调
  final Function(bool? value)? onCheckBoxChanged;

  const ClListTile({
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
    this.trailingArrow = false,
    this.trailingArrowIcon,
    this.trailingText,
    this.trailingTextStyle,
    this.trailingSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.trailingCheckBox = false,
    this.trailingCheckBoxWidth,
    this.checkBoxValue = false,
    this.onCheckBoxChanged,
  })  : assert(!isThreeLine || subtitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 标题
    Widget? titleView = title;
    if (titleText != null) {
      titleView ??= Text(
        titleText!,
        style: textStyle ?? const TextStyle(
          color: Colors.black,
        ),
      );
    }

    /// 尾部
    Widget? trailingView = trailing;
    if (trailingText != null) {
      /// 预定义的文本尾部
      trailingView ??= RichText(
        text: TextSpan(
          text: trailingText,
          style: trailingTextStyle ?? TextStyle(
            color: Colors.grey[700],
          ),
          children: [
            if (trailingArrow) WidgetSpan(
              child: trailingArrowIcon ?? const Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 15,
              ),
            ),
          ],
        ),
      );
    }
    if (trailingSwitch) {
      /// 预定义的开关尾部
      trailingView ??= Switch(
        value: switchValue,
        onChanged: onSwitchChanged,
      );
    }
    if (trailingCheckBox) {
      /// 预定义的尾部复选框
      trailingView ??= SizedBox(
        width: trailingCheckBoxWidth,
        child: Checkbox(
          value: checkBoxValue,
          onChanged: onCheckBoxChanged,
        ),
      );
    }
    if (trailingArrow) {
      /// 预定义的箭头尾部
      trailingView ??= trailingArrowIcon ?? const Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 15,
      );
    }

    return ListTile(
      leading: leading,
      title: titleView,
      subtitle: subtitle,
      trailing: trailingView,
      isThreeLine: isThreeLine,
      dense: dense,
      visualDensity: visualDensity,
      shape: shape,
      selectedColor: selectedColor,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap: onTap,
      onLongPress: onLongPress,
      mouseCursor: mouseCursor,
      selected: selected,
      focusColor: focusColor,
      hoverColor: hoverColor,
      focusNode: focusNode,
      autofocus: autofocus,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      enableFeedback: enableFeedback,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth,
    );
  }
}
