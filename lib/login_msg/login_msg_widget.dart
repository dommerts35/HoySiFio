import '/components/dialog_two_btns_choice_reset_pw_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'login_msg_model.dart';
export 'login_msg_model.dart';

class LoginMsgWidget extends StatefulWidget {
  const LoginMsgWidget({
    super.key,
    this.nombreIfTendero,
    this.nombreIfCliente,
    this.tenderoRef,
    this.clienteRef,
    this.nombreTienda,
    this.emailTendero,
    this.cedulaCliente,
    this.idsTenderosList,
  });

  final String? nombreIfTendero;
  final String? nombreIfCliente;
  final DocumentReference? tenderoRef;
  final DocumentReference? clienteRef;
  final String? nombreTienda;
  final String? emailTendero;
  final String? cedulaCliente;
  final List<DocumentReference>? idsTenderosList;

  static String routeName = 'loginMsg';
  static String routePath = '/loginMsg';

  @override
  State<LoginMsgWidget> createState() => _LoginMsgWidgetState();
}

class _LoginMsgWidgetState extends State<LoginMsgWidget>
    with TickerProviderStateMixin {
  late LoginMsgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginMsgModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 6000,
        ),
      );
      if ((widget.emailTendero != null && widget.emailTendero != '') &&
          (widget.cedulaCliente == null || widget.cedulaCliente == '')) {
        context.goNamed(
          ListaClientesWidget.routeName,
          queryParameters: {
            'tenderoRef': serializeParam(
              widget.tenderoRef,
              ParamType.DocumentReference,
            ),
            'nombreTienda': serializeParam(
              widget.nombreTienda,
              ParamType.String,
            ),
            'tenderoEmail': serializeParam(
              widget.emailTendero,
              ParamType.String,
            ),
            'nombreTendero': serializeParam(
              widget.nombreIfTendero,
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 1000),
            ),
          },
        );

        return;
      } else {
        if ((widget.emailTendero == null || widget.emailTendero == '') &&
            (widget.cedulaCliente != null && widget.cedulaCliente != '')) {
          context.goNamed(
            InicioClienteWidget.routeName,
            queryParameters: {
              'cedula': serializeParam(
                widget.cedulaCliente,
                ParamType.String,
              ),
              'idTenderoList': serializeParam(
                widget.idsTenderosList,
                ParamType.DocumentReference,
                isList: true,
              ),
              'nombreCliente': serializeParam(
                widget.nombreIfCliente,
                ParamType.String,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 1000),
              ),
            },
          );

          return;
        } else {
          if ((widget.emailTendero != null && widget.emailTendero != '') &&
              (widget.cedulaCliente != null && widget.cedulaCliente != '')) {
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Container(
                      height: 300.0,
                      child: DialogTwoBtnsChoiceResetPwWidget(
                        titulo: 'Elija el perfil al que desea acceder',
                      ),
                    ),
                  ),
                );
              },
            ).then(
                (value) => safeSetState(() => _model.isTenderoChoice = value));

            if (_model.isTenderoChoice!) {
              context.goNamed(
                ListaClientesWidget.routeName,
                queryParameters: {
                  'tenderoRef': serializeParam(
                    widget.tenderoRef,
                    ParamType.DocumentReference,
                  ),
                  'nombreTienda': serializeParam(
                    widget.nombreTienda,
                    ParamType.String,
                  ),
                  'tenderoEmail': serializeParam(
                    widget.emailTendero,
                    ParamType.String,
                  ),
                  'nombreTendero': serializeParam(
                    widget.nombreIfTendero,
                    ParamType.String,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 1000),
                  ),
                },
              );

              return;
            } else {
              context.goNamed(
                InicioClienteWidget.routeName,
                queryParameters: {
                  'cedula': serializeParam(
                    widget.cedulaCliente,
                    ParamType.String,
                  ),
                  'idTenderoList': serializeParam(
                    widget.idsTenderosList,
                    ParamType.DocumentReference,
                    isList: true,
                  ),
                  'nombreCliente': serializeParam(
                    widget.nombreIfCliente,
                    ParamType.String,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 1000),
                  ),
                },
              );

              return;
            }
          } else {
            return;
          }
        }
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(1.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(1.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(1.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(1.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(1.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Bienvenido/a',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          font: GoogleFonts.asap(
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
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation1']!),
                ),
                Container(
                  height: 60.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              () {
                                if (widget.emailTendero != null &&
                                    widget.emailTendero != '') {
                                  return '${widget.nombreIfTendero}';
                                } else if (widget.cedulaCliente != null &&
                                    widget.cedulaCliente != '') {
                                  return '${widget.nombreIfCliente}';
                                } else {
                                  return 'Usuario';
                                }
                              }(),
                              'Usuario',
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            minFontSize: 4.0,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  font: GoogleFonts.asap(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ),
                        Flexible(
                          child: Lottie.asset(
                            'assets/jsons/party.json',
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ).animateOnPageLoad(animationsMap[
                              'lottieAnimationOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              () {
                                if (widget.emailTendero != null &&
                                    widget.emailTendero != '') {
                                  return 'A la tienda:';
                                } else if (widget.cedulaCliente != null &&
                                    widget.cedulaCliente != '') {
                                  return 'A HoySíFio';
                                } else {
                                  return 'A HoySiFio';
                                }
                              }(),
                              textAlign: TextAlign.center,
                              minFontSize: 4.0,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.asap(
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
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation3']!),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.emailTendero != null && widget.emailTendero != '')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.emailTendero != null &&
                                widget.emailTendero != ''
                            ? widget.nombreTienda
                            : '',
                        'nombreTienda',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            font: GoogleFonts.asap(
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
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation4']!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
