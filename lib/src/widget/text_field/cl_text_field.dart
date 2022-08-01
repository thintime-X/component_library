import 'package:component_library/src/config/cl_text_field_config.dart';
import 'package:flutter/material.dart';

/// @description: 自定义TextField
class ClTextField extends StatefulWidget {
  /// 原始TextField参数
  final ClTextFieldConfig config;
  // 以下为简便使用配置参数
  /// 是否显示边框
  final bool showBorder;
  /// 边框颜色
  final Color? borderColor;
  /// 边框宽度
  final double? borderWidth;
  /// 圆角角度
  final BorderRadius? borderRadius;
  /// 仅底部边框
  final bool onlyBottomBorder;
  /// 是否为密码输入框
  final bool isPassword;

  const ClTextField({
    Key? key,
    required this.config,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.onlyBottomBorder = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<ClTextField> createState() => _ClTextFieldState();
}

class _ClTextFieldState extends State<ClTextField> {
  bool canSeePwd = false;

  ///
  TextField getTextField(BuildContext context, ClTextFieldConfig config,) {
    return TextField(
      readOnly: config.readOnly,
      toolbarOptions: config.toolbarOptions,
      decoration: config.decoration,
      showCursor: config.showCursor,
      controller: config.controller,
      focusNode: config.focusNode,
      keyboardType: config.keyboardType,
      textInputAction: config.textInputAction,
      textCapitalization: config.textCapitalization,
      textAlignVertical: config.textAlignVertical,
      style: config.style,
      strutStyle: config.strutStyle,
      textAlign: config.textAlign,
      textDirection: config.textDirection,
      autofocus: config.autofocus,
      enabled: config.enabled,
      obscuringCharacter: config.obscuringCharacter,
      obscureText: config.obscureText,
      autocorrect: config.autocorrect,
      smartDashesType: config.smartDashesType,
      smartQuotesType: config.smartQuotesType,
      enableSuggestions: config.enableSuggestions,
      maxLines: config.maxLines,
      minLines: config.minLines,
      maxLengthEnforcement: config.maxLengthEnforcement,
      expands: config.expands,
      selectionControls: config.selectionControls,
      onChanged: config.onChanged,
      onTap: config.onTap,
      onEditingComplete: config.onEditingComplete,
      onSubmitted: config.onSubmitted,
      onAppPrivateCommand: config.onAppPrivateCommand,
      inputFormatters: config.inputFormatters,
      mouseCursor: config.mouseCursor,
      cursorWidth: config.cursorWidth,
      cursorHeight: config.cursorHeight,
      cursorRadius: config.cursorRadius,
      cursorColor: config.cursorColor,
      selectionHeightStyle: config.selectionHeightStyle,
      selectionWidthStyle: config.selectionWidthStyle,
      scrollPadding: config.scrollPadding,
      keyboardAppearance: config.keyboardAppearance,
      enableInteractiveSelection: config.enableInteractiveSelection,
      dragStartBehavior: config.dragStartBehavior,
      scrollController: config.scrollController,
      scrollPhysics: config.scrollPhysics,
      clipBehavior: config.clipBehavior,
      enableIMEPersonalizedLearning: config.enableIMEPersonalizedLearning,
      buildCounter: config.buildCounter,
      autofillHints: config.autofillHints,
      restorationId: config.restorationId,
    );
  }

  /// 获取边框
  InputBorder getBorder() {
    if (widget.onlyBottomBorder) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? const Color(0xFFBDBDBD), width: widget.borderWidth ?? 1),
        borderRadius: widget.borderRadius ?? const BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      );
    } else {
      return OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? const Color(0xFFBDBDBD), width: widget.borderWidth ?? 1),
        borderRadius: widget.borderRadius ?? const BorderRadius.all(Radius.circular(4)),
      );
    }
  }

  changeCanSeePwd() {
    setState(() {
      canSeePwd = !canSeePwd;
    });
  }

  @override
  Widget build(BuildContext context) {
    ClTextFieldConfig config = widget.config;
    if (widget.showBorder) {
      /// 显示边框
      config = config.copyWith(
        decoration: config.decoration?.copyWith(
          border: getBorder(),
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
        ),
      );
    }
    if (widget.isPassword) {
      /// 密码输入框
      double height = config.decoration?.contentPadding?.vertical ?? 10;
      if (height == 0) height = 10;
      config = config.copyWith(
        obscureText: !canSeePwd,
        maxLines: 1,
        decoration: config.decoration?.copyWith(
          suffixIconConstraints: BoxConstraints(
            minWidth: height * 2,
            maxWidth: height * 2,
            minHeight: height,
            maxHeight: height,
          ),
          suffixIcon: GestureDetector(
            onTap: changeCanSeePwd,
            child: Icon(
              canSeePwd ? Icons.visibility : Icons.visibility_off,
              color: widget.borderColor,
              size: height,
            ),
          ),
        ),
      );
    }
    if (config.expands) {
      //填充
      return Expanded(
        child: getTextField(
          context,
          config.copyWith(
            maxLines: null,
            minLines: null,
          ),
        ),
      );
    }
    return getTextField(context, config);
  }
}
