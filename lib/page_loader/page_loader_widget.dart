import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'page_loader_model.dart';
export 'page_loader_model.dart';

class PageLoaderWidget extends StatefulWidget {
  const PageLoaderWidget({super.key});

  static String routeName = 'pageLoader';
  static String routePath = '/pageLoader';

  @override
  State<PageLoaderWidget> createState() => _PageLoaderWidgetState();
}

class _PageLoaderWidgetState extends State<PageLoaderWidget> {
  late PageLoaderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageLoaderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      unawaited(
        () async {
          await actions.enterImmersiveMode();
        }(),
      );
      await Future.delayed(
        Duration(
          milliseconds: 5000,
        ),
      );
      if (FFAppState().isFirstTime == true) {
        context.goNamed(StartWidget.routeName);
      } else {
        context.goNamed(AuthSigningInWidget.routeName);
      }
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Lottie.asset(
                    'assets/jsons/actualHoySiFioLoad.json',
                    width: 360.0,
                    height: 600.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
