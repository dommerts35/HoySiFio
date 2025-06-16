import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wt_lista_clientes_tab_list_fiando_model.dart';
export 'wt_lista_clientes_tab_list_fiando_model.dart';

class WtListaClientesTabListFiandoWidget extends StatefulWidget {
  const WtListaClientesTabListFiandoWidget({super.key});

  @override
  State<WtListaClientesTabListFiandoWidget> createState() =>
      _WtListaClientesTabListFiandoWidgetState();
}

class _WtListaClientesTabListFiandoWidgetState
    extends State<WtListaClientesTabListFiandoWidget> {
  late WtListaClientesTabListFiandoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WtListaClientesTabListFiandoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276.6,
      height: 110.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 4.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Clientes fiando',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          Divider(
            thickness: 2.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Text(
            'Seleccionando esta pestaña verá todos sus clientes que fien.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ],
      ),
    );
  }
}
