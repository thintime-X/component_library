import 'package:component_library/src/config/cl_text_field_config.dart';
import 'package:flutter/material.dart';

/// @description: 自定义TextField
class ClTextField extends StatelessWidget {
  final ClTextFieldConfig config;

  const ClTextField({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
