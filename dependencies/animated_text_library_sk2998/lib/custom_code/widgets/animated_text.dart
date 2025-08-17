// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/schema/enums/enums.dart' as ff_enums;

import 'dart:ui' as ui show TextAlign, TextDirection;
import 'package:flutter/material.dart' as flutter show Alignment;
import 'package:animated_text_kit/animated_text_kit.dart' as atk;

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    super.key,
    this.width,
    this.height,
    this.texts,
    required this.fontSize,
    required this.color,
    required this.fontFamily,
    required this.fontWeight,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    required this.textAlign,
    required this.animationType,
    this.animationDuration,
    this.pauseDuration,
    this.typingSpeed,
    required this.repeatForever,
    required this.totalRepeatCount,
    this.displayFullTextOnTap,
    this.stopPauseOnTap,
    this.fadeInEnd,
    this.fadeOutBegin,
    this.showCursor,
    this.cursorChar,
    this.scalingFactor,
    this.transitionHeight,
    this.rotateOut,
    this.alignment,
    this.colorizeColors,
    this.colorizeHexColors,
    this.colorizeSpeed,
    required this.textDirection,
    this.wavySpeed,
    this.flickerSpeed,
    this.entryEnd,
  });

  final double? width;
  final double? height;
  final List<String>? texts;
  final double fontSize;
  final Color color;
  final String fontFamily;
  final ff_enums.FFFontWeight fontWeight;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;
  final ff_enums.FFTextAlign textAlign;
  final String animationType;
  final int? animationDuration;
  final int? pauseDuration;
  final int? typingSpeed;
  final bool repeatForever;
  final int totalRepeatCount;
  final bool? displayFullTextOnTap;
  final bool? stopPauseOnTap;
  final double? fadeInEnd;
  final double? fadeOutBegin;
  final bool? showCursor;
  final String? cursorChar;
  final double? scalingFactor;
  final double? transitionHeight;
  final bool? rotateOut;
  final ff_enums.FFAlignment? alignment;
  final List<Color>? colorizeColors;
  final List<String>? colorizeHexColors;
  final int? colorizeSpeed;
  final ff_enums.FFTextDirection textDirection;
  final int? wavySpeed;
  final int? flickerSpeed;
  final double? entryEnd;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  // Convert FontWeight enum to Flutter FontWeight
  FontWeight get _fontWeight {
    switch (widget.fontWeight) {
      case ff_enums.FFFontWeight.thin:
        return FontWeight.w100;
      case ff_enums.FFFontWeight.extraLight:
        return FontWeight.w200;
      case ff_enums.FFFontWeight.light:
        return FontWeight.w300;
      case ff_enums.FFFontWeight.normal:
        return FontWeight.w400;
      case ff_enums.FFFontWeight.medium:
        return FontWeight.w500;
      case ff_enums.FFFontWeight.semiBold:
        return FontWeight.w600;
      case ff_enums.FFFontWeight.bold:
        return FontWeight.w700;
      case ff_enums.FFFontWeight.extraBold:
        return FontWeight.w800;
      case ff_enums.FFFontWeight.black:
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  // Convert TextAlign enum to ui.TextAlign
  ui.TextAlign get _textAlign {
    switch (widget.textAlign) {
      case ff_enums.FFTextAlign.left:
        return ui.TextAlign.left;
      case ff_enums.FFTextAlign.right:
        return ui.TextAlign.right;
      case ff_enums.FFTextAlign.center:
        return ui.TextAlign.center;
      case ff_enums.FFTextAlign.justify:
        return ui.TextAlign.justify;
      case ff_enums.FFTextAlign.start:
        return ui.TextAlign.start;
      case ff_enums.FFTextAlign.end:
        return ui.TextAlign.end;
      default:
        return ui.TextAlign.center;
    }
  }

  // Convert Alignment enum to Flutter Alignment
  AlignmentGeometry get _alignment {
    switch (widget.alignment) {
      case ff_enums.FFAlignment.topLeft:
        return Alignment.topLeft;
      case ff_enums.FFAlignment.topCenter:
        return Alignment.topCenter;
      case ff_enums.FFAlignment.topRight:
        return Alignment.topRight;
      case ff_enums.FFAlignment.centerLeft:
        return Alignment.centerLeft;
      case ff_enums.FFAlignment.center:
        return Alignment.center;
      case ff_enums.FFAlignment.centerRight:
        return Alignment.centerRight;
      case ff_enums.FFAlignment.bottomLeft:
        return Alignment.bottomLeft;
      case ff_enums.FFAlignment.bottomCenter:
        return Alignment.bottomCenter;
      case ff_enums.FFAlignment.bottomRight:
        return Alignment.bottomRight;
      case null:
        return Alignment.center;
      default:
        return Alignment.center;
    }
  }

  // Convert TextDirection enum to ui.TextDirection
  ui.TextDirection get _textDirection {
    return widget.textDirection == ff_enums.FFTextDirection.ltr
        ? ui.TextDirection.ltr
        : ui.TextDirection.rtl;
  }

  TextStyle get _textStyle => TextStyle(
        fontSize: widget.fontSize,
        color: widget.color,
        fontFamily: widget.fontFamily,
        fontWeight: _fontWeight,
        letterSpacing: widget.letterSpacing ?? 0.0,
        wordSpacing: widget.wordSpacing ?? 0.0,
        height: widget.lineHeight,
      );

  Duration get _animationDuration =>
      Duration(milliseconds: widget.animationDuration ?? 3000);
  Duration get _pauseDuration =>
      Duration(milliseconds: widget.pauseDuration ?? 1000);
  Duration get _typingSpeed =>
      Duration(milliseconds: widget.typingSpeed ?? 100);

  List<String> get _texts => widget.texts ?? ['Sample Text'];
  bool get _displayFullTextOnTap => widget.displayFullTextOnTap ?? false;
  bool get _stopPauseOnTap => widget.stopPauseOnTap ?? false;

  // Add validation for fade values
  double get _fadeInEnd {
    final value = widget.fadeInEnd ?? 0.5;
    return value.clamp(0.0, 1.0);
  }

  double get _fadeOutBegin {
    final value = widget.fadeOutBegin ?? 0.8;
    return value.clamp(0.0, 1.0);
  }

  bool get _showCursor => widget.showCursor ?? true;
  String get _cursorChar => widget.cursorChar ?? '|';

  // Add validation for scaling factor
  double get _scalingFactor {
    final value = widget.scalingFactor ?? 2.0;
    return value.clamp(0.1, 10.0);
  }

  double get _transitionHeight => widget.transitionHeight ?? 100.0;
  bool get _rotateOut => widget.rotateOut ?? true;

  // Helper function to convert hex string to Color
  Color _hexToColor(String hex) {
    // Remove # if present
    hex = hex.replaceAll('#', '');
    // Add FF for alpha if not present (6 digit hex)
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }

  List<Color> get _colorizeColors {
    // Prioritize hex colors if provided
    if (widget.colorizeHexColors != null &&
        widget.colorizeHexColors!.isNotEmpty) {
      return widget.colorizeHexColors!.map((hex) => _hexToColor(hex)).toList();
    }
    // Fallback to Color objects
    return widget.colorizeColors ??
        [Colors.purple, Colors.blue, Colors.yellow, Colors.red];
  }

  Duration get _colorizeSpeed =>
      Duration(milliseconds: widget.colorizeSpeed ?? 200);

  Duration get _wavySpeed => Duration(milliseconds: widget.wavySpeed ?? 300);

  Duration get _flickerSpeed =>
      Duration(milliseconds: widget.flickerSpeed ?? 200);

  // Add validation for entry end
  double get _entryEnd {
    final value = widget.entryEnd ?? 0.5;
    return value.clamp(0.0, 1.0);
  }

  // Fixed total repeat count logic
  int get _effectiveTotalRepeatCount {
    return widget.repeatForever ? 0 : widget.totalRepeatCount;
  }

  List<atk.AnimatedText> _buildAnimatedTexts() {
    switch (widget.animationType.toLowerCase()) {
      case "fade":
        return _texts
            .map((text) => atk.FadeAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  duration: _animationDuration,
                  fadeInEnd: _fadeInEnd,
                  fadeOutBegin: _fadeOutBegin,
                ))
            .toList();

      case "type":
        return _texts
            .map((text) => atk.TyperAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  speed: _typingSpeed,
                ))
            .toList();

      case "typewriter":
        return _texts
            .map((text) => atk.TypewriterAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  speed: _typingSpeed,
                  cursor: _showCursor ? _cursorChar : '',
                ))
            .toList();

      case "scale":
        return _texts
            .map((text) => atk.ScaleAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  duration: _animationDuration,
                  scalingFactor: _scalingFactor,
                ))
            .toList();

      case "rotate":
        return _texts
            .map((text) => atk.RotateAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  duration: _animationDuration,
                  transitionHeight: _transitionHeight,
                  rotateOut: _rotateOut,
                  alignment: _alignment,
                ))
            .toList();

      case "colorize":
        return _texts
            .map((text) => atk.ColorizeAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  colors: _colorizeColors,
                  speed: _colorizeSpeed,
                  textDirection: _textDirection,
                ))
            .toList();

      case "wavy":
        return _texts
            .map((text) => atk.WavyAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  speed: _wavySpeed,
                ))
            .toList();

      case "flicker":
        return _texts
            .map((text) => atk.FlickerAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  speed: _flickerSpeed,
                  entryEnd: _entryEnd,
                ))
            .toList();

      default:
        return _texts
            .map((text) => atk.FadeAnimatedText(
                  text,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  duration: _animationDuration,
                ))
            .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height ?? 60.0,
      child: atk.AnimatedTextKit(
        animatedTexts: _buildAnimatedTexts(),
        repeatForever: widget.repeatForever,
        totalRepeatCount: _effectiveTotalRepeatCount,
        pause: _pauseDuration,
        displayFullTextOnTap: _displayFullTextOnTap,
        stopPauseOnTap: _stopPauseOnTap,
      ),
    );
  }
}
