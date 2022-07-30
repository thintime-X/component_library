import 'package:component_library/src/config/cl_text_field_config.dart';
import 'package:flutter/material.dart';

/// @description: 自定义TextField
class ClTextField extends StatefulWidget {
  final ClTextFieldConfig config;
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final bool onlyBottomBorder;

  const ClTextField({
    Key? key,
    required this.config,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.onlyBottomBorder = false,
  }) : super(key: key);

  @override
  State<ClTextField> createState() => _ClTextFieldState();
}

class _ClTextFieldState extends State<ClTextField> {

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
      maxLines: null,//config.maxLines,
      minLines: null,//config.minLines,
      maxLengthEnforcement: config.maxLengthEnforcement,
      expands: config.expands,
      selectionControls: config.selectionControls,
      onChanged: config.onChanged,
      onTap: config.onTap,
      onEditingComplete: config.onEditingComplete,
      onSubmitted: config.onSubmitted,
      onAppPrivateCommand: config.onAppPrivateCommand,
      inputFormatters: config.inputFormatters,
      mouseCursor: config.mouseCursor, // TextField will handle the cursor
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

  @override
  Widget build(BuildContext context) {
    ClTextFieldConfig config = widget.config;

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
    if (widget.showBorder) {
      /// 显示边框
      return getTextField(context, config.copyWith(
        decoration: config.decoration?.copyWith(
          border: getBorder(),
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
        ),
      ));
    }

    return getTextField(context, config);
  }
}
