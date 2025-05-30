import '/backend/backend.dart';
import '/components_nivel_tendero/check_cuentas_comp/check_cuentas_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'historial_por_pagar_widget.dart' show HistorialPorPagarWidget;
import 'package:flutter/material.dart';

class HistorialPorPagarModel extends FlutterFlowModel<HistorialPorPagarWidget> {
  ///  Local state fields for this page.

  double totalAPagarCalc = 0.0;

  ///  State fields for stateful widgets in this page.

  // Models for checkCuentasComp dynamic component.
  late FlutterFlowDynamicModels<CheckCuentasCompModel> checkCuentasCompModels;
  // State field(s) for Checkbox widget.
  Map<DataTypeHistorialPagoStruct, bool> checkboxValueMap1 = {};
  List<DataTypeHistorialPagoStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<DataTypeHistorialPagoStruct, bool> checkboxValueMap2 = {};
  List<DataTypeHistorialPagoStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Query cache managers for this widget.

  final _queryNameClienteHistorialPorPagarManager =
      StreamRequestManager<ClientesRecord>();
  Stream<ClientesRecord> queryNameClienteHistorialPorPagar({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<ClientesRecord> Function() requestFn,
  }) =>
      _queryNameClienteHistorialPorPagarManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryNameClienteHistorialPorPagarCache() =>
      _queryNameClienteHistorialPorPagarManager.clear();
  void clearQueryNameClienteHistorialPorPagarCacheKey(String? uniqueKey) =>
      _queryNameClienteHistorialPorPagarManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    checkCuentasCompModels =
        FlutterFlowDynamicModels(() => CheckCuentasCompModel());
  }

  @override
  void dispose() {
    checkCuentasCompModels.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNameClienteHistorialPorPagarCache();
  }
}
