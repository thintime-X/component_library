import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

/// @author: zx
/// @description: ClTextField属性配置
class ClTextFieldConfig {
  // 以下属性看 TextField 说明
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool? showCursor;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;

  ClTextFieldConfig({
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    ToolbarOptions? toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
  }) : smartDashesType = smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert((maxLines == null) || (minLines == null) || (maxLines >= minLines),
        "minLines can't be greater than maxLines",
        ),
        /* 这个不在这里处理
        assert(
        !expands || (maxLines == null && minLines == null),
        'minLines and maxLines must be null when expands is true.',
        ),*/
        assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0),
        assert(
        !identical(textInputAction, TextInputAction.newline) || maxLines == 1 ||
            !identical(keyboardType, TextInputType.text),
        'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline TextField.',
        ),
        keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        toolbarOptions = toolbarOptions ?? (obscureText ?
        const ToolbarOptions(
          selectAll: true,
          paste: true,
        ) :
        const ToolbarOptions(
          copy: true,
          cut: true,
          selectAll: true,
          paste: true,
        ));

  ClTextFieldConfig copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? autofocus,
    String? obscuringCharacter,
    bool? obscureText,
    bool? autocorrect,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    bool? readOnly,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    int? maxLength,
    MaxLengthEnforcement? maxLengthEnforcement,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    AppPrivateCommandCallback? onAppPrivateCommand,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    ui.BoxHeightStyle? selectionHeightStyle,
    ui.BoxWidthStyle? selectionWidthStyle,
    Brightness? keyboardAppearance,
    EdgeInsets? scrollPadding,
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    DragStartBehavior? dragStartBehavior,
    GestureTapCallback? onTap,
    MouseCursor? mouseCursor,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    ScrollController? scrollController,
    Iterable<String>? autofillHints,
    Clip? clipBehavior,
    String? restorationId,
    bool? enableIMEPersonalizedLearning,
}) {
    return ClTextFieldConfig(
      readOnly: readOnly ?? this.readOnly,
      toolbarOptions: toolbarOptions ?? this.toolbarOptions,
      decoration: decoration ?? this.decoration,
      showCursor: showCursor ?? this.showCursor,
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      autofocus: autofocus ?? this.autofocus,
      enabled: enabled ?? this.enabled,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      obscureText: obscureText ?? this.obscureText,
      autocorrect: autocorrect ?? this.autocorrect,
      smartDashesType: smartDashesType ?? this.smartDashesType,
      smartQuotesType: smartQuotesType ?? this.smartQuotesType,
      enableSuggestions: enableSuggestions ?? this.enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      maxLengthEnforcement: maxLengthEnforcement ?? this.maxLengthEnforcement,
      expands: expands ?? this.expands,
      selectionControls: selectionControls ?? this.selectionControls,
      onChanged: onChanged ?? this.onChanged,
      onTap: onTap ?? this.onTap,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand ?? this.onAppPrivateCommand,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      cursorColor: cursorColor ?? this.cursorColor,
      selectionHeightStyle: selectionHeightStyle ?? this.selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle ?? this.selectionWidthStyle,
      scrollPadding: scrollPadding ?? this.scrollPadding,
      keyboardAppearance: keyboardAppearance ?? this.keyboardAppearance,
      enableInteractiveSelection: enableInteractiveSelection ?? this.enableInteractiveSelection,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      scrollController: scrollController ?? this.scrollController,
      scrollPhysics: scrollPhysics ?? this.scrollPhysics,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? this.enableIMEPersonalizedLearning,
      buildCounter: buildCounter ?? this.buildCounter,
      autofillHints: autofillHints ?? this.autofillHints,
      restorationId: restorationId ?? this.restorationId,
    );
  }
}