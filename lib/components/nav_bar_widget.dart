import '/components/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    this.activePage,
    this.nombreTienda,
    this.emailTendero,
    this.tenderoRef,
    this.nombreTendero,
    this.pwPass,
  });

  final String? activePage;
  final String? nombreTienda;
  final String? emailTendero;
  final DocumentReference? tenderoRef;
  final String? nombreTendero;
  final String? pwPass;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with TickerProviderStateMixin {
  late NavBarModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    animationsMap.addAll({
      'navBarItemOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Color(0x13000000),
                  offset: Offset(
                    0.0,
                    -8.0,
                  ),
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                wrapWithModel(
                  model: _model.navBarItemModel1,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavBarItemWidget(
                    activePage: widget.activePage!,
                    unselectedIcon: Icon(
                      Icons.home,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.home,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Inicio',
                    title: 'Inicio',
                    action: () async {
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
                            widget.nombreTendero,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                ).animateOnActionTrigger(
                  animationsMap['navBarItemOnActionTriggerAnimation']!,
                ),
                wrapWithModel(
                  model: _model.navBarItemModel2,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavBarItemWidget(
                    activePage: widget.activePage!,
                    unselectedIcon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Añadir',
                    title: 'Añadir',
                    action: () async {
                      context.goNamed(
                        ClienteMakeInfoWidget.routeName,
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
                            widget.nombreTendero,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarItemModel3,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavBarItemWidget(
                    activePage: widget.activePage!,
                    unselectedIcon: Icon(
                      Icons.question_mark,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.question_mark,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Ayuda',
                    title: 'Ayuda',
                    action: () async {
                      context.goNamed(
                        AyudaWidget.routeName,
                        queryParameters: {
                          'nombreTienda': serializeParam(
                            widget.nombreTienda,
                            ParamType.String,
                          ),
                          'emailTendero': serializeParam(
                            widget.emailTendero,
                            ParamType.String,
                          ),
                          'tenderoRef': serializeParam(
                            widget.tenderoRef,
                            ParamType.DocumentReference,
                          ),
                          'nombreTendero': serializeParam(
                            widget.nombreTendero,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarItemModel4,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavBarItemWidget(
                    activePage: widget.activePage!,
                    unselectedIcon: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Perfil',
                    title: 'Perfil',
                    action: () async {
                      context.goNamed(
                        TenderoEditInfoWidget.routeName,
                        queryParameters: {
                          'tenderoRef': serializeParam(
                            widget.tenderoRef,
                            ParamType.DocumentReference,
                          ),
                          'nombreTienda': serializeParam(
                            widget.nombreTienda,
                            ParamType.String,
                          ),
                          'pwPassed': serializeParam(
                            widget.pwPass,
                            ParamType.String,
                          ),
                          'tenderoEmailPassed': serializeParam(
                            widget.emailTendero,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
