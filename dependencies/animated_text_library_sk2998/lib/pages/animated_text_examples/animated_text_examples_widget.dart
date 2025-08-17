import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'animated_text_examples_model.dart';
export 'animated_text_examples_model.dart';

/// Do the same for "typewriter"
///
/// "scale"
///
/// "rotate"
///
/// "colorize"
///
/// "wavy"
///
/// "flicker"
class AnimatedTextExamplesWidget extends StatefulWidget {
  const AnimatedTextExamplesWidget({super.key});

  static String routeName = 'AnimatedTextExamples';
  static String routePath = '/animatedTextExamples';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<AnimatedTextExamplesWidget> createState() =>
      _AnimatedTextExamplesWidgetState();
}

class _AnimatedTextExamplesWidgetState
    extends State<AnimatedTextExamplesWidget> {
  late AnimatedTextExamplesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimatedTextExamplesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Animated Text Examples',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'fade',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      rotateOut: false,
                      texts: List.generate(random_data.randomInteger(10, 20),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'fade',
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      alignment: FFAlignment.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Text(
                  'typewriter',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      cursorChar: '|',
                      rotateOut: false,
                      texts: List.generate(random_data.randomInteger(5, 5),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'typewriter',
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Text(
                  'scale',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      scalingFactor: 50.0,
                      rotateOut: false,
                      texts: List.generate(random_data.randomInteger(5, 5),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'scale',
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Text(
                  'rotate',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      scalingFactor: 5.0,
                      transitionHeight: 5.0,
                      rotateOut: true,
                      texts: List.generate(random_data.randomInteger(5, 5),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'rotate',
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Text(
                  'colorize',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      rotateOut: false,
                      colorizeSpeed: 500,
                      texts: List.generate(random_data.randomInteger(5, 5),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'colorize',
                      colorizeColors: _model.colorizeColors,
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Text(
                  'wavy',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      rotateOut: false,
                      wavySpeed: 500,
                      texts: List.generate(random_data.randomInteger(5, 5),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'wavy',
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Text(
                  'flicker',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    child: custom_widgets.AnimatedText(
                      width: double.infinity,
                      height: 75.0,
                      fontSize: 20.0,
                      color: FlutterFlowTheme.of(context).primary,
                      fontFamily: 'Lato',
                      repeatForever: true,
                      totalRepeatCount: 50,
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                      showCursor: false,
                      rotateOut: false,
                      flickerSpeed: 1000,
                      texts: List.generate(random_data.randomInteger(5, 5),
                          (index) => random_data.randomName(true, true)),
                      animationType: 'flicker',
                      fontWeight: FFFontWeight.normal,
                      textAlign: FFTextAlign.center,
                      textDirection: FFTextDirection.ltr,
                    ),
                  ),
                ),
              ]
                  .addToStart(SizedBox(height: 24.0))
                  .addToEnd(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
