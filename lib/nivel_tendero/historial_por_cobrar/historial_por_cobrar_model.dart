import '/components_nivel_tendero/check_cuentas_comp/check_cuentas_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'historial_por_cobrar_widget.dart' show HistorialPorCobrarWidget;
import 'package:flutter/material.dart';

class HistorialPorCobrarModel
    extends FlutterFlowModel<HistorialPorCobrarWidget> {
  ///  Local state fields for this page.

  double totalAPagarCalc = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in historialPorCobrar widget.
  bool? isInternetGood;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;
  // Models for checkCuentasComp dynamic component.
  late FlutterFlowDynamicModels<CheckCuentasCompModel> checkCuentasCompModels;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button_cobroSelec widget.
  bool? isSelecPago;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button_cobroTotal widget.
  bool? isFullPago;

  @override
  void initState(BuildContext context) {
    checkCuentasCompModels =
        FlutterFlowDynamicModels(() => CheckCuentasCompModel());
  }

  @override
  void dispose() {
    checkCuentasCompModels.dispose();
  }
}
