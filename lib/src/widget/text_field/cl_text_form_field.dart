import 'package:component_library/src/config/cl_text_form_field_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description:
class ClTextFormField extends StatefulWidget {
  final FormFieldValidator<String>? validator;

  /// 原始TextFormField参数
  final ClTextFormFieldConfig config;

  // 以下为简化TextField使用所预设场景参数

  /// 内边距高度，默认 20
  final double paddingHeight;

  final TextEditingController? controller;

  /// 建议文案
  final String? hintText;

  /// 样式
  final TextStyle? style;

  /// 背景颜色
  final Color? background;

  /// 是否显示边框
  final bool? showBorder;

  /// 边框颜色
  final Color? borderColor;

  /// 边框宽度
  final double? borderWidth;

  /// 圆角角度
  final BorderRadius? borderRadius;

  /// 仅底部边框
  final bool? onlyBottomBorder;

  /// 是否为密码输入框
  final bool isPassword;

  const ClTextFormField({
    Key? key,
    this.validator,
    this.config = const ClTextFormFieldConfig(),
    this.paddingHeight = 10,
    this.controller,
    this.hintText,
    this.style,
    this.background,
    this.showBorder,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.onlyBottomBorder,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<ClTextFormField> createState() => _ClTextFormFieldState();
}

class _ClTextFormFieldState extends State<ClTextFormField> {
  /// 密码是否可见
  bool canSeePwd = false;

  ///
  TextFormField getTextFormField(BuildContext context, ClTextFormFieldConfig config,) {
    return TextFormField(
      key: widget.key,
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
      onFieldSubmitted: config.onFieldSubmitted,
      inputFormatters: config.inputFormatters,
      cursorWidth: config.cursorWidth,
      cursorHeight: config.cursorHeight,
      cursorRadius: config.cursorRadius,
      cursorColor: config.cursorColor,
      scrollPadding: config.scrollPadding,
      keyboardAppearance: config.keyboardAppearance,
      enableInteractiveSelection: config.enableInteractiveSelection,
      scrollController: config.scrollController,
      scrollPhysics: config.scrollPhysics,
      enableIMEPersonalizedLearning: config.enableIMEPersonalizedLearning,
      buildCounter: config.buildCounter,
      autofillHints: config.autofillHints,
      restorationId: config.restorationId,
      validator: config.validator,
      autovalidateMode: config.autovalidateMode,
    );
  }

  /// 获取边框
  InputBorder getBorder() {
    if (widget.onlyBottomBorder != null && widget.onlyBottomBorder!) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? const Color(0xFFBDBDBD), width: widget.borderWidth ?? 1),
        borderRadius: widget.borderRadius ?? const BorderRadius.only(),
      );
    } else {
      return OutlineInputBorder(
        borderSide: widget.showBorder != null && !widget.showBorder! ? BorderSide.none : BorderSide(color: widget.borderColor ?? const Color(0xFFBDBDBD), width: widget.borderWidth ?? 1),
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
    ClTextFormFieldConfig config = widget.config.copyWith(
      /// 预设场景 - 控制器
      controller: widget.controller ?? widget.config.controller,

      /// 预设场景 - 文字样式
      style: widget.style ?? widget.config.style,
      //
      decoration: widget.config.decoration?.copyWith(
        /// 默认将输入框收紧，并给予一定的padding
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: widget.paddingHeight),

        /// 预设场景 - 建议文案
        hintText: widget.hintText ?? widget.config.decoration?.hintText,

        /// 预设场景 - 背景色填充
        filled: widget.background != null ? true : widget.config.decoration?.filled,
        fillColor: widget.background ?? widget.config.decoration?.fillColor,

        /// 预设场景 - 边框
        border: widget.showBorder != null || widget.onlyBottomBorder != null ? getBorder() : widget.config.decoration?.border,
        enabledBorder: widget.showBorder != null || widget.onlyBottomBorder != null ? getBorder() : widget.config.decoration?.enabledBorder,
        focusedBorder: widget.showBorder != null || widget.onlyBottomBorder != null ? getBorder() : widget.config.decoration?.focusedBorder,
      ),

      ///
      toolbarOptions: const ToolbarOptions(copy: true, cut: true, selectAll: true, paste: true),

      validator: widget.validator ?? widget.config.validator,
    );
    if (widget.isPassword) {
      /// 预设场景 - 密码输入框
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
              color: config.decoration?.suffixIconColor,
              size: height,
            ),
          ),
        ),
      );
    }
    if (config.expands) {
      //填充
      return Expanded(
        child: getTextFormField(
          context,
          config.copyWith(
            maxLines: null,
            minLines: null,
          ),
        ),
      );
    }
    return getTextFormField(context, config);
  }
}

