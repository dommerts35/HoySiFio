import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'animated_text_examples_widget.dart' show AnimatedTextExamplesWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnimatedTextExamplesModel
    extends FlutterFlowModel<AnimatedTextExamplesWidget> {
  ///  Local state fields for this page.

  List<Color> colorizeColors = [
    Color(4283120111),
    Color(4281979584),
    Color(4293823328),
    Color(4294561624),
    Color(4294924643),
    Color(4294940962),
    Color(2136433516)
  ];
  void addToColorizeColors(Color item) => colorizeColors.add(item);
  void removeFromColorizeColors(Color item) => colorizeColors.remove(item);
  void removeAtIndexFromColorizeColors(int index) =>
      colorizeColors.removeAt(index);
  void insertAtIndexInColorizeColors(int index, Color item) =>
      colorizeColors.insert(index, item);
  void updateColorizeColorsAtIndex(int index, Function(Color) updateFn) =>
      colorizeColors[index] = updateFn(colorizeColors[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
