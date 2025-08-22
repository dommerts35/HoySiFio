import '/components/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'nav_bar_cliente_model.dart';
export 'nav_bar_cliente_model.dart';

class NavBarClienteWidget extends StatefulWidget {
  const NavBarClienteWidget({
    super.key,
    this.activePage,
    this.idTenderoList,
    this.nombreCliente,
    this.cedula,
  });

  final String? activePage;
  final List<DocumentReference>? idTenderoList;
  final String? nombreCliente;
  final String? cedula;

  @override
  State<NavBarClienteWidget> createState() => _NavBarClienteWidgetState();
}

class _NavBarClienteWidgetState extends State<NavBarClienteWidget>
    with TickerProviderStateMixin {
  late NavBarClienteModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarClienteModel());

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
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      Icons.home_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.home_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Inicio',
                    title: 'Inicio',
                    action: () async {
                      context.goNamed(
                        InicioClienteWidget.routeName,
                        queryParameters: {
                          'cedula': serializeParam(
                            widget.cedula,
                            ParamType.String,
                          ),
                          'idTenderoList': serializeParam(
                            widget.idTenderoList,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'nombreCliente': serializeParam(
                            widget.nombreCliente,
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
                      Icons.storefront_sharp,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.storefront_sharp,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Tiendas',
                    title: 'Tiendas',
                    action: () async {
                      context.goNamed(
                        TiendaBetterWidget.routeName,
                        queryParameters: {
                          'cedula': serializeParam(
                            widget.cedula,
                            ParamType.String,
                          ),
                          'idTenderoList': serializeParam(
                            widget.idTenderoList,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'nombreCliente': serializeParam(
                            widget.nombreCliente,
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
                      Icons.settings_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    selectedIcon: Icon(
                      Icons.settings_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    currentItemName: 'Ajustes',
                    title: 'Ajustes',
                    action: () async {
                      context.goNamed(
                        AjustesClienteWidget.routeName,
                        queryParameters: {
                          'nombreCliente': serializeParam(
                            widget.nombreCliente,
                            ParamType.String,
                          ),
                          'cedula': serializeParam(
                            widget.cedula,
                            ParamType.String,
                          ),
                          'idTenderoList': serializeParam(
                            widget.idTenderoList,
                            ParamType.DocumentReference,
                            isList: true,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
