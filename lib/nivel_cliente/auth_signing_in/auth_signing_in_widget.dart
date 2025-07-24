import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_signing_in_model.dart';
export 'auth_signing_in_model.dart';

class AuthSigningInWidget extends StatefulWidget {
  const AuthSigningInWidget({super.key});

  static String routeName = 'authSigningIn';
  static String routePath = '/authSigningIn';

  @override
  State<AuthSigningInWidget> createState() => _AuthSigningInWidgetState();
}

class _AuthSigningInWidgetState extends State<AuthSigningInWidget>
    with TickerProviderStateMixin {
  late AuthSigningInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthSigningInModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      _model.playerIdResult = await actions.getPlayerId();
      _model.getFCMTokenResult = await actions.getFCMToken();
      FFAppState().playerId = _model.playerIdResult!;
      safeSetState(() {});
      unawaited(
        () async {
          await actions.enterImmersiveMode();
        }(),
      );
    });

    _model.tabInicioSesionController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.emailAddressTenderoTextController ??= TextEditingController();
    _model.emailAddressTenderoFocusNode ??= FocusNode();

    _model.passwordTenderoTextController ??= TextEditingController();
    _model.passwordTenderoFocusNode ??= FocusNode();

    _model.pinTenderoTextController ??= TextEditingController();
    _model.pinTenderoFocusNode ??= FocusNode();

    _model.ciClienteTextController ??= TextEditingController();
    _model.ciClienteFocusNode ??= FocusNode();

    _model.passwordClienteTextController ??= TextEditingController();
    _model.passwordClienteFocusNode ??= FocusNode();

    _model.pinClienteTextController ??= TextEditingController();
    _model.pinClienteFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.75, 0.75),
            end: Offset(1.3, 1.3),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.3, 1.3),
            end: Offset(0.75, 0.75),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.75, 0.75),
            end: Offset(1.3, 1.3),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.3, 1.3),
            end: Offset(0.75, 0.75),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hoy',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: 'Sí',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF01AFFF),
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: 'Fio',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.88,
                            constraints: BoxConstraints(
                              maxWidth: 530.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    controller:
                                        _model.tabInicioSesionController,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 16.0, 24.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  'Bienvenido',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 24.0),
                                                  child: Text(
                                                    'Inicie sesión como tendero.',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailAddressTenderoTextController,
                                                      focusNode: _model
                                                          .emailAddressTenderoFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'E-mail',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'E-mail',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .emailAddressTenderoTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.isPswrdTendero ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .passwordTenderoTextController,
                                                        focusNode: _model
                                                            .passwordTenderoFocusNode,
                                                        autofocus: false,
                                                        autofillHints: [
                                                          AutofillHints.password
                                                        ],
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        obscureText: !_model
                                                            .passwordTenderoVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Contraseña',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  24.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                safeSetState(
                                                              () => _model
                                                                      .passwordTenderoVisibility =
                                                                  !_model
                                                                      .passwordTenderoVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordTenderoVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                        maxLength: 16,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        validator: _model
                                                            .passwordTenderoTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.isPINTendero == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .pinTenderoTextController,
                                                        focusNode: _model
                                                            .pinTenderoFocusNode,
                                                        autofocus: false,
                                                        autofillHints: [
                                                          AutofillHints.password
                                                        ],
                                                        textInputAction:
                                                            TextInputAction.go,
                                                        obscureText: !_model
                                                            .pinTenderoVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'PIN',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  24.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                safeSetState(
                                                              () => _model
                                                                      .pinTenderoVisibility =
                                                                  !_model
                                                                      .pinTenderoVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.pinTenderoVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                        maxLength: 4,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        validator: _model
                                                            .pinTenderoTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.isPswrdTendero =
                                                                  !_model
                                                                      .isPswrdTendero;
                                                              _model.isPINTendero =
                                                                  !_model
                                                                      .isPINTendero;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .pinTenderoTextController
                                                                    ?.clear();
                                                                _model
                                                                    .passwordTenderoTextController
                                                                    ?.clear();
                                                              });
                                                              if (animationsMap[
                                                                      'buttonOnActionTriggerAnimation1'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'buttonOnActionTriggerAnimation1']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0);
                                                              }
                                                            },
                                                            text: _model.isPINTendero ==
                                                                    true
                                                                ? 'Contraseña'
                                                                : 'PIN',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFF0E8AF9),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            showLoadingIndicator:
                                                                false,
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'buttonOnActionTriggerAnimation1']!,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model.emailAddressTenderoTextController
                                                                      .text ==
                                                                  '') {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          200.0,
                                                                      child:
                                                                          DialogBtnWidget(
                                                                        titulo:
                                                                            '¡Datos incorrectos!',
                                                                        mensaje:
                                                                            'Los datos ingresados son inválidos.',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            _model.queryForNoPassTendero =
                                                                await queryTenderosRecordOnce(
                                                              queryBuilder:
                                                                  (tenderosRecord) =>
                                                                      tenderosRecord
                                                                          .where(
                                                                            'pin',
                                                                            isEqualTo:
                                                                                _model.pinTenderoTextController.text,
                                                                          )
                                                                          .where(
                                                                            'tenderos.mail',
                                                                            isEqualTo:
                                                                                _model.emailAddressTenderoTextController.text,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            _shouldSetState =
                                                                true;
                                                            if (_model
                                                                    .queryForNoPassTendero
                                                                    ?.isAuth ==
                                                                false) {
                                                              context
                                                                  .goNamedAuth(
                                                                TenderoFirstLoginWidget
                                                                    .routeName,
                                                                context.mounted,
                                                                queryParameters:
                                                                    {
                                                                  'idTenderoNoAuth':
                                                                      serializeParam(
                                                                    _model
                                                                        .queryForNoPassTendero
                                                                        ?.reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            if (_model
                                                                    .queryForNoPassTendero
                                                                    ?.reference ==
                                                                null) {
                                                              _model.queryForNoPIN =
                                                                  await queryTenderosRecordOnce(
                                                                queryBuilder:
                                                                    (tenderosRecord) =>
                                                                        tenderosRecord
                                                                            .where(
                                                                              'tenderos.mail',
                                                                              isEqualTo: _model.emailAddressTenderoTextController.text,
                                                                            )
                                                                            .where(
                                                                              'tenderos.pw',
                                                                              isEqualTo: _model.passwordTenderoTextController.text,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .queryForNoPIN
                                                                      ?.isAuth ==
                                                                  false) {
                                                                context
                                                                    .goNamedAuth(
                                                                  TenderoFirstLoginWidget
                                                                      .routeName,
                                                                  context
                                                                      .mounted,
                                                                  queryParameters:
                                                                      {
                                                                    'idTenderoNoAuth':
                                                                        serializeParam(
                                                                      _model
                                                                          .queryForNoPIN
                                                                          ?.reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                              if (_model
                                                                      .queryForNoPIN
                                                                      ?.reference ==
                                                                  null) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              200.0,
                                                                          child:
                                                                              DialogBtnWidget(
                                                                            titulo:
                                                                                '¡Datos incorrectos!',
                                                                            mensaje:
                                                                                'Los datos ingresados son inválidos.',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();

                                                            final user =
                                                                await authManager
                                                                    .signInWithEmail(
                                                              context,
                                                              _model
                                                                  .emailAddressTenderoTextController
                                                                  .text,
                                                              (_model.passwordTenderoTextController
                                                                              .text ==
                                                                          ''
                                                                  ? _model
                                                                      .queryForNoPassTendero!
                                                                      .tenderos
                                                                      .pw
                                                                  : _model
                                                                      .passwordTenderoTextController
                                                                      .text),
                                                            );
                                                            if (user == null) {
                                                              return;
                                                            }

                                                            if (_model.passwordTenderoTextController
                                                                        .text ==
                                                                    '') {
                                                              _model.queryInicioTenderoPin =
                                                                  await queryTenderosRecordOnce(
                                                                queryBuilder: (tenderosRecord) =>
                                                                    tenderosRecord
                                                                        .where(
                                                                          'tenderos.mail',
                                                                          isEqualTo: _model
                                                                              .emailAddressTenderoTextController
                                                                              .text,
                                                                        )
                                                                        .where(
                                                                          'tenderos.pin',
                                                                          isEqualTo: _model
                                                                              .pinTenderoTextController
                                                                              .text,
                                                                        )
                                                                        .where(
                                                                          'pin',
                                                                          isEqualTo: _model
                                                                              .pinTenderoTextController
                                                                              .text,
                                                                        ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.queryInicioTenderoPin !=
                                                                      null) ==
                                                                  true) {
                                                                if (_model
                                                                        .queryInicioTenderoPin
                                                                        ?.isAuth ==
                                                                    false) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            '¡Alerta!'),
                                                                        content:
                                                                            Text('Su cuenta aún no ha sido autenticada. Por favor, revise su correo electrónico.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              200.0,
                                                                          child:
                                                                              DialogBtnWidget(
                                                                            titulo:
                                                                                '¡Bienvenido! 😊',
                                                                            mensaje:
                                                                                'Ha iniciado sesión exitosamente en la tienda: ${_model.queryInicioTenderoPin?.tenderos.nombreTienda} 🏪',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                _model.readForTenderoNotifLogInPsswrd =
                                                                    await TenderosRecord.getDocumentOnce(_model
                                                                        .queryInicioTenderoPin!
                                                                        .reference);
                                                                _shouldSetState =
                                                                    true;
                                                                if (!((FFAppState().playerId ==
                                                                            '') ||
                                                                    _model
                                                                        .readForTenderoNotifLogInPsswrd!
                                                                        .playerIds
                                                                        .contains(
                                                                            FFAppState().playerId))) {
                                                                  await _model
                                                                      .queryInicioTenderoPin!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'player_ids':
                                                                            FieldValue.arrayUnion([
                                                                          FFAppState()
                                                                              .playerId
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                }
                                                                if (!((kDebugMode ==
                                                                        true) ||
                                                                    (isWeb ==
                                                                        true))) {
                                                                  for (int loop1Index =
                                                                          0;
                                                                      loop1Index <
                                                                          _model
                                                                              .queryInicioTenderoPin!
                                                                              .playerIds
                                                                              .length;
                                                                      loop1Index++) {
                                                                    final currentLoop1Item = _model
                                                                        .queryInicioTenderoPin!
                                                                        .playerIds[loop1Index];
                                                                    unawaited(
                                                                      () async {
                                                                        await actions
                                                                            .sendNotificationToPlayer(
                                                                          currentLoop1Item,
                                                                          '${_model.readForTenderoNotifLogInPsswrd?.tenderos.nombreTendero}: ¡Se ha iniciado sesión como tendero en la tienda: ${_model.readForTenderoNotifLogInPsswrd?.displayName}!',
                                                                        );
                                                                      }(),
                                                                    );
                                                                  }
                                                                  unawaited(
                                                                    () async {
                                                                      await actions
                                                                          .sendCustomEmailForTenderoLogin(
                                                                        _model
                                                                            .emailAddressTenderoTextController
                                                                            .text,
                                                                        _model
                                                                            .readForTenderoNotifLogInPsswrd!
                                                                            .displayName,
                                                                        'Inicio de Sesion',
                                                                      );
                                                                    }(),
                                                                  );
                                                                }

                                                                context
                                                                    .goNamedAuth(
                                                                  ListaClientesWidget
                                                                      .routeName,
                                                                  context
                                                                      .mounted,
                                                                  queryParameters:
                                                                      {
                                                                    'tenderoRef':
                                                                        serializeParam(
                                                                      _model
                                                                          .queryInicioTenderoPin
                                                                          ?.reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'nombreTienda':
                                                                        serializeParam(
                                                                      _model
                                                                          .readForTenderoNotifLogInPsswrd
                                                                          ?.displayName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'tenderoEmail':
                                                                        serializeParam(
                                                                      _model
                                                                          .emailAddressTenderoTextController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'nombreTendero':
                                                                        serializeParam(
                                                                      _model
                                                                          .readForTenderoNotifLogInPsswrd
                                                                          ?.tenderos
                                                                          .nombreTendero,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              200.0,
                                                                          child:
                                                                              DialogBtnWidget(
                                                                            titulo:
                                                                                '¡Datos incorrectos!',
                                                                            mensaje:
                                                                                'Los datos ingresados son inválidos.',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            if (_model.pinTenderoTextController
                                                                        .text ==
                                                                    '') {
                                                              _model.queryInicioTenderoPswrd =
                                                                  await queryTenderosRecordOnce(
                                                                queryBuilder:
                                                                    (tenderosRecord) =>
                                                                        tenderosRecord
                                                                            .where(
                                                                              'tenderos.mail',
                                                                              isEqualTo: _model.emailAddressTenderoTextController.text,
                                                                            )
                                                                            .where(
                                                                              'tenderos.pw',
                                                                              isEqualTo: _model.passwordTenderoTextController.text,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.queryInicioTenderoPswrd !=
                                                                      null) ==
                                                                  true) {
                                                                if (_model
                                                                        .queryInicioTenderoPswrd
                                                                        ?.isAuth ==
                                                                    false) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            '¡Alerta!'),
                                                                        content:
                                                                            Text('Su cuenta aún no ha sido autenticada. Por favor, revise su correo electrónico.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              200.0,
                                                                          child:
                                                                              DialogBtnWidget(
                                                                            titulo:
                                                                                '¡Bienvenido! 😊',
                                                                            mensaje:
                                                                                'Ha iniciado sesión exitosamente en la tienda: ${_model.queryInicioTenderoPswrd?.tenderos.nombreTienda} 🏪',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                _model.readForTenderoNotifLogInPIN =
                                                                    await TenderosRecord.getDocumentOnce(_model
                                                                        .queryInicioTenderoPswrd!
                                                                        .reference);
                                                                _shouldSetState =
                                                                    true;
                                                                if (!((FFAppState().playerId ==
                                                                            '') ||
                                                                    _model
                                                                        .readForTenderoNotifLogInPIN!
                                                                        .playerIds
                                                                        .contains(
                                                                            FFAppState().playerId))) {
                                                                  await _model
                                                                      .queryInicioTenderoPswrd!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'player_ids':
                                                                            FieldValue.arrayUnion([
                                                                          FFAppState()
                                                                              .playerId
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                }
                                                                if (!((isWeb ==
                                                                        true) ||
                                                                    (kDebugMode ==
                                                                        true))) {
                                                                  for (int loop1Index =
                                                                          0;
                                                                      loop1Index <
                                                                          _model
                                                                              .queryInicioTenderoPswrd!
                                                                              .playerIds
                                                                              .length;
                                                                      loop1Index++) {
                                                                    final currentLoop1Item = _model
                                                                        .queryInicioTenderoPswrd!
                                                                        .playerIds[loop1Index];
                                                                    unawaited(
                                                                      () async {
                                                                        await actions
                                                                            .sendNotificationToPlayer(
                                                                          currentLoop1Item,
                                                                          '${_model.readForTenderoNotifLogInPIN?.tenderos.nombreTendero}: ¡Se ha iniciado sesión en su tienda: ${_model.readForTenderoNotifLogInPIN?.displayName}!',
                                                                        );
                                                                      }(),
                                                                    );
                                                                  }
                                                                  unawaited(
                                                                    () async {
                                                                      await actions
                                                                          .sendCustomEmailForTenderoLogin(
                                                                        _model
                                                                            .emailAddressTenderoTextController
                                                                            .text,
                                                                        _model
                                                                            .readForTenderoNotifLogInPIN!
                                                                            .displayName,
                                                                        'Inicio de Sesion',
                                                                      );
                                                                    }(),
                                                                  );
                                                                }

                                                                context
                                                                    .goNamedAuth(
                                                                  ListaClientesWidget
                                                                      .routeName,
                                                                  context
                                                                      .mounted,
                                                                  queryParameters:
                                                                      {
                                                                    'tenderoRef':
                                                                        serializeParam(
                                                                      _model
                                                                          .queryInicioTenderoPswrd
                                                                          ?.reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'nombreTienda':
                                                                        serializeParam(
                                                                      _model
                                                                          .readForTenderoNotifLogInPIN
                                                                          ?.displayName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'tenderoEmail':
                                                                        serializeParam(
                                                                      _model
                                                                          .emailAddressTenderoTextController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'nombreTendero':
                                                                        serializeParam(
                                                                      _model
                                                                          .readForTenderoNotifLogInPIN
                                                                          ?.tenderos
                                                                          .nombreTendero,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              200.0,
                                                                          child:
                                                                              DialogBtnWidget(
                                                                            titulo:
                                                                                '¡Datos incorrectos!',
                                                                            mensaje:
                                                                                'Los datos ingresados son inválidos.',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            200.0,
                                                                        child:
                                                                            DialogBtnWidget(
                                                                          titulo:
                                                                              '¡Datos incorrectos!',
                                                                          mensaje:
                                                                              'Los datos ingresados son inválidos.',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'Iniciar Sesión',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 230.0,
                                                          height: 52.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                TermsOfServiceSubPageToAcceptWidget
                                                                    .routeName);
                                                          },
                                                          child: Text(
                                                            'Registrarse como tendero',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                ForgotMyPasswordWidget
                                                                    .routeName);
                                                          },
                                                          child: AutoSizeText(
                                                            '¿Olvidó su contraseña?',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                TermsOfServiceSubPageToViewWidget
                                                                    .routeName);
                                                          },
                                                          child: AutoSizeText(
                                                            'Políticas de privacidad',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ].addToEnd(
                                                  SizedBox(height: 40.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  'Bienvenido',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 24.0),
                                                  child: Text(
                                                    'Inicie sesión como cliente.',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .ciClienteTextController,
                                                      focusNode: _model
                                                          .ciClienteFocusNode,
                                                      autofocus: true,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Cédula de Identidad',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                      maxLength: 10,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .ciClienteTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model.isPswrdCliente ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .passwordClienteTextController,
                                                            focusNode: _model
                                                                .passwordClienteFocusNode,
                                                            autofocus: false,
                                                            autofillHints: [
                                                              AutofillHints
                                                                  .password
                                                            ],
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .words,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: !_model
                                                                .passwordClienteVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Contraseña',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          24.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    safeSetState(
                                                                  () => _model
                                                                          .passwordClienteVisibility =
                                                                      !_model
                                                                          .passwordClienteVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.passwordClienteVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                            maxLength: 16,
                                                            maxLengthEnforcement:
                                                                MaxLengthEnforcement
                                                                    .enforced,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .passwordClienteTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              if (!isAndroid &&
                                                                  !isiOS)
                                                                TextInputFormatter
                                                                    .withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                  return TextEditingValue(
                                                                    selection:
                                                                        newValue
                                                                            .selection,
                                                                    text: newValue
                                                                        .text
                                                                        .toCapitalization(
                                                                            TextCapitalization.words),
                                                                  );
                                                                }),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.isPINCliente ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .pinClienteTextController,
                                                            focusNode: _model
                                                                .pinClienteFocusNode,
                                                            autofocus: false,
                                                            autofillHints: [
                                                              AutofillHints
                                                                  .password
                                                            ],
                                                            textInputAction:
                                                                TextInputAction
                                                                    .go,
                                                            obscureText: !_model
                                                                .pinClienteVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: 'PIN',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          24.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    safeSetState(
                                                                  () => _model
                                                                          .pinClienteVisibility =
                                                                      !_model
                                                                          .pinClienteVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.pinClienteVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                            maxLength: 4,
                                                            maxLengthEnforcement:
                                                                MaxLengthEnforcement
                                                                    .enforced,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .pinClienteTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.isPswrdCliente =
                                                                      !_model
                                                                          .isPswrdCliente;
                                                                  _model.isPINCliente =
                                                                      !_model
                                                                          .isPINCliente;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .pinClienteTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .passwordClienteTextController
                                                                        ?.clear();
                                                                  });
                                                                  if (animationsMap[
                                                                          'buttonOnActionTriggerAnimation2'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'buttonOnActionTriggerAnimation2']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                },
                                                                text: _model.isPINCliente ==
                                                                        true
                                                                    ? 'Contraseña'
                                                                    : 'PIN',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF0E8AF9),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                showLoadingIndicator:
                                                                    false,
                                                              ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'buttonOnActionTriggerAnimation2']!,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model.ciClienteTextController
                                                                      .text ==
                                                                  '') {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        DialogBtnWidget(
                                                                      titulo:
                                                                          '¡Datos incorrectos!',
                                                                      mensaje:
                                                                          'Los datos ingresados son inválidos.',
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            _model.queryForClienteWithPswrd =
                                                                await queryClientesRecordOnce(
                                                              queryBuilder:
                                                                  (clientesRecord) =>
                                                                      clientesRecord
                                                                          .where(
                                                                            'cliente.cedula',
                                                                            isEqualTo:
                                                                                _model.ciClienteTextController.text,
                                                                          )
                                                                          .where(
                                                                            'cliente.secret_pass',
                                                                            isEqualTo:
                                                                                null,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            _shouldSetState =
                                                                true;
                                                            if (_model
                                                                        .queryForClienteWithPswrd
                                                                        ?.cliente
                                                                        .contrasena !=
                                                                    null &&
                                                                _model
                                                                        .queryForClienteWithPswrd
                                                                        ?.cliente
                                                                        .contrasena !=
                                                                    '') {
                                                              _model.isClienteSetWithPss =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.isClienteSetWithPss =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            if ((_model.ciClienteTextController
                                                                            .text !=
                                                                        '') &&
                                                                (_model.queryForClienteWithPswrd
                                                                        ?.reference ==
                                                                    null)) {
                                                              _model.isQueryUnsuccesful =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.isQueryUnsuccesful =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            if (_model
                                                                    .isClienteSetWithPss ==
                                                                false) {
                                                              _model.queryForClienteWithNoPsswrd =
                                                                  await queryClientesRecordOnce(
                                                                queryBuilder:
                                                                    (clientesRecord) =>
                                                                        clientesRecord
                                                                            .where(
                                                                              'cliente.cedula',
                                                                              isEqualTo: _model.ciClienteTextController.text,
                                                                            )
                                                                            .where(
                                                                              'cliente.contrasena',
                                                                              isEqualTo: null,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .queryForClienteWithNoPsswrd
                                                                      ?.reference ==
                                                                  null) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            DialogBtnWidget(
                                                                          titulo:
                                                                              '¡Datos incorrectos!',
                                                                          mensaje:
                                                                              'Los datos ingresados son inválidos.',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                              safeSetState(() {
                                                                _model
                                                                    .pinClienteTextController
                                                                    ?.clear();
                                                                _model
                                                                    .passwordClienteTextController
                                                                    ?.clear();
                                                              });

                                                              context.pushNamed(
                                                                ClienteFirstLoginWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'idClienteWithNoPsswrd':
                                                                      serializeParam(
                                                                    _model
                                                                        .queryForClienteWithNoPsswrd
                                                                        ?.reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            _model.queryClientePsswrd =
                                                                await queryClientesRecordOnce(
                                                              queryBuilder:
                                                                  (clientesRecord) =>
                                                                      clientesRecord
                                                                          .where(
                                                                            'cliente.cedula',
                                                                            isEqualTo:
                                                                                _model.ciClienteTextController.text,
                                                                          )
                                                                          .where(
                                                                            'cliente.contrasena',
                                                                            isEqualTo:
                                                                                _model.passwordClienteTextController.text,
                                                                          ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.queryClientePsswrd !=
                                                                        null &&
                                                                    (_model.queryClientePsswrd)!
                                                                        .isNotEmpty) ==
                                                                true) {
                                                              for (int loop1Index =
                                                                      0;
                                                                  loop1Index <
                                                                      _model
                                                                          .queryClientePsswrd!
                                                                          .length;
                                                                  loop1Index++) {
                                                                final currentLoop1Item =
                                                                    _model.queryClientePsswrd![
                                                                        loop1Index];
                                                                _model.addToIdsTenderos(
                                                                    currentLoop1Item
                                                                        .cliente
                                                                        .idTendero!);
                                                                safeSetState(
                                                                    () {});
                                                                if (!(FFAppState()
                                                                            .playerId ==
                                                                        '')) {
                                                                  await currentLoop1Item
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'player_ids':
                                                                            FieldValue.arrayUnion([
                                                                          FFAppState()
                                                                              .playerId
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                }
                                                              }
                                                              _model.notifPsswrdReadCliente =
                                                                  await ClientesRecord.getDocumentOnce(_model
                                                                      .queryClientePsswrd!
                                                                      .lastOrNull!
                                                                      .reference);
                                                              _shouldSetState =
                                                                  true;
                                                              if (!((isWeb ==
                                                                      true) ||
                                                                  (kDebugMode ==
                                                                      true))) {
                                                                for (int loop2Index =
                                                                        0;
                                                                    loop2Index <
                                                                        _model
                                                                            .notifPsswrdReadCliente!
                                                                            .playerIds
                                                                            .length;
                                                                    loop2Index++) {
                                                                  final currentLoop2Item = _model
                                                                          .notifPsswrdReadCliente!
                                                                          .playerIds[
                                                                      loop2Index];
                                                                  unawaited(
                                                                    () async {
                                                                      await actions
                                                                          .sendNotificationToPlayer(
                                                                        currentLoop2Item
                                                                            .toString(),
                                                                        '¡Hola, ${_model.notifPsswrdReadCliente?.cliente.nombre}, ha iniciado sesión como cliente!',
                                                                      );
                                                                    }(),
                                                                  );
                                                                }
                                                                unawaited(
                                                                  () async {
                                                                    await actions
                                                                        .sendCustomEmailForClienteLogin(
                                                                      _model
                                                                          .notifPsswrdReadCliente!
                                                                          .cliente
                                                                          .emailCliente,
                                                                      _model
                                                                          .notifPsswrdReadCliente!
                                                                          .cliente
                                                                          .nombre,
                                                                      'Inicio de sesión como cliente',
                                                                    );
                                                                  }(),
                                                                );
                                                              }
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            300.0,
                                                                        child:
                                                                            DialogBtnWidget(
                                                                          titulo:
                                                                              '¡Inicio de sesión exitoso! ✔',
                                                                          mensaje:
                                                                              '¡Bienvenido, ${_model.notifPsswrdReadCliente?.cliente.nombre} ${_model.notifPsswrdReadCliente?.cliente.apellido}! 😊',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              context.pushNamed(
                                                                ResumenFiadoClienTiendaNewWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'cedula':
                                                                      serializeParam(
                                                                    _model
                                                                        .ciClienteTextController
                                                                        .text,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'idTenderoList':
                                                                      serializeParam(
                                                                    _model
                                                                        .idsTenderos,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              _model.queryClientePIN =
                                                                  await queryClientesRecordOnce(
                                                                queryBuilder:
                                                                    (clientesRecord) =>
                                                                        clientesRecord
                                                                            .where(
                                                                              'cliente.cedula',
                                                                              isEqualTo: _model.ciClienteTextController.text,
                                                                            )
                                                                            .where(
                                                                              'cliente.pin',
                                                                              isEqualTo: _model.pinClienteTextController.text,
                                                                            ),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.queryClientePIN !=
                                                                          null &&
                                                                      (_model.queryClientePIN)!
                                                                          .isNotEmpty) ==
                                                                  true) {
                                                                for (int loop1Index =
                                                                        0;
                                                                    loop1Index <
                                                                        _model
                                                                            .queryClientePIN!
                                                                            .length;
                                                                    loop1Index++) {
                                                                  final currentLoop1Item =
                                                                      _model.queryClientePIN![
                                                                          loop1Index];
                                                                  _model.addToIdsTenderos(
                                                                      currentLoop1Item
                                                                          .cliente
                                                                          .idTendero!);
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(FFAppState()
                                                                              .playerId ==
                                                                          '')) {
                                                                    await currentLoop1Item
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'player_ids':
                                                                              FieldValue.arrayUnion([
                                                                            FFAppState().playerId
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }
                                                                }
                                                                _model.notifPINReadCliente =
                                                                    await ClientesRecord.getDocumentOnce(_model
                                                                        .queryClientePIN!
                                                                        .lastOrNull!
                                                                        .reference);
                                                                _shouldSetState =
                                                                    true;
                                                                if (!((isWeb ==
                                                                        true) ||
                                                                    (kDebugMode ==
                                                                        true))) {
                                                                  for (int loop2Index =
                                                                          0;
                                                                      loop2Index <
                                                                          _model
                                                                              .notifPINReadCliente!
                                                                              .playerIds
                                                                              .length;
                                                                      loop2Index++) {
                                                                    final currentLoop2Item = _model
                                                                        .notifPINReadCliente!
                                                                        .playerIds[loop2Index];
                                                                    unawaited(
                                                                      () async {
                                                                        await actions
                                                                            .sendNotificationToPlayer(
                                                                          currentLoop2Item,
                                                                          '¡Hola, ${_model.notifPINReadCliente?.cliente.nombre}, ha iniciado sesión como cliente!',
                                                                        );
                                                                      }(),
                                                                    );
                                                                  }
                                                                  unawaited(
                                                                    () async {
                                                                      await actions
                                                                          .sendCustomEmailForClienteLogin(
                                                                        _model
                                                                            .notifPINReadCliente!
                                                                            .cliente
                                                                            .emailCliente,
                                                                        _model
                                                                            .notifPINReadCliente!
                                                                            .cliente
                                                                            .nombre,
                                                                        'Inicio de sesión como cliente',
                                                                      );
                                                                    }(),
                                                                  );
                                                                }
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              300.0,
                                                                          child:
                                                                              DialogBtnWidget(
                                                                            titulo:
                                                                                '¡Inicio de sesión exitoso! ✔',
                                                                            mensaje:
                                                                                '¡Bienvenido, ${_model.notifPINReadCliente?.cliente.nombre} ${_model.notifPINReadCliente?.cliente.apellido}! 😊',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                  ResumenFiadoClienTiendaNewWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'cedula':
                                                                        serializeParam(
                                                                      _model
                                                                          .ciClienteTextController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idTenderoList':
                                                                        serializeParam(
                                                                      _model
                                                                          .idsTenderos,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            DialogBtnWidget(
                                                                          titulo:
                                                                              '¡Datos incorrectos!',
                                                                          mensaje:
                                                                              'Los datos ingresados son inválidos.',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'Iniciar Sesión',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 230.0,
                                                          height: 52.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          TermsOfServiceSubPageToViewWidget
                                                              .routeName);
                                                    },
                                                    child: Text(
                                                      'Políticas de privacidad',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            ForgotMyPasswordWidget
                                                                .routeName);
                                                      },
                                                      child: AutoSizeText(
                                                        '¿Olvidó su contraseña?',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    unselectedBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    unselectedBorderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 12.0,
                                    elevation: 0.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                    buttonMargin:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    tabs: [
                                      Tab(
                                        text: 'Tendero',
                                      ),
                                      Tab(
                                        text: 'Cliente',
                                      ),
                                    ],
                                    controller:
                                        _model.tabInicioSesionController,
                                    onTap: (i) async {
                                      [
                                        () async {
                                          safeSetState(() {
                                            _model.passwordTenderoTextController
                                                ?.clear();
                                            _model
                                                .emailAddressTenderoTextController
                                                ?.clear();
                                            _model.pinTenderoTextController
                                                ?.clear();
                                          });
                                          _model.isClienteSetWithPss = false;
                                          safeSetState(() {});
                                        },
                                        () async {
                                          safeSetState(() {
                                            _model.ciClienteTextController
                                                ?.clear();
                                          });
                                          _model.isClienteSetWithPss = false;
                                          safeSetState(() {});
                                        }
                                      ][i]();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
