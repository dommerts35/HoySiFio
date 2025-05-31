import '/backend/backend.dart';
import '/components_nivel_tendero/razon_negado_c/razon_negado_c_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'historial_vouchers_widget.dart' show HistorialVouchersWidget;
import 'package:flutter/material.dart';

class HistorialVouchersModel extends FlutterFlowModel<HistorialVouchersWidget> {
  ///  Local state fields for this page.

  String? link;

  String? linkString;

  DataTypeHistorialPagoStruct? dtHistorialPagoNew;
  void updateDtHistorialPagoNewStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtHistorialPagoNew ??= DataTypeHistorialPagoStruct());
  }

  DataTypeHistorialPagoStruct? dtHistorialPagoOld;
  void updateDtHistorialPagoOldStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtHistorialPagoOld ??= DataTypeHistorialPagoStruct());
  }

  List<DataTypeHistorialPagoStruct> tempHistorialList = [];
  void addToTempHistorialList(DataTypeHistorialPagoStruct item) =>
      tempHistorialList.add(item);
  void removeFromTempHistorialList(DataTypeHistorialPagoStruct item) =>
      tempHistorialList.remove(item);
  void removeAtIndexFromTempHistorialList(int index) =>
      tempHistorialList.removeAt(index);
  void insertAtIndexInTempHistorialList(
          int index, DataTypeHistorialPagoStruct item) =>
      tempHistorialList.insert(index, item);
  void updateTempHistorialListAtIndex(
          int index, Function(DataTypeHistorialPagoStruct) updateFn) =>
      tempHistorialList[index] = updateFn(tempHistorialList[index]);

  DataTypeVouchersStruct? voucherDT;
  void updateVoucherDTStruct(Function(DataTypeVouchersStruct) updateFn) {
    updateFn(voucherDT ??= DataTypeVouchersStruct());
  }

  DataTypeHistorialPagoStruct? voucherHPDT;
  void updateVoucherHPDTStruct(Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(voucherHPDT ??= DataTypeHistorialPagoStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Models for razonNegadoC dynamic component.
  late FlutterFlowDynamicModels<RazonNegadoCModel> razonNegadoCModels;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormV;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormV2;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormVF;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormVF2;

  /// Query cache managers for this widget.

  final _queryNameClienteHistorialPagadoManager =
      StreamRequestManager<ClientesRecord>();
  Stream<ClientesRecord> queryNameClienteHistorialPagado({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<ClientesRecord> Function() requestFn,
  }) =>
      _queryNameClienteHistorialPagadoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryNameClienteHistorialPagadoCache() =>
      _queryNameClienteHistorialPagadoManager.clear();
  void clearQueryNameClienteHistorialPagadoCacheKey(String? uniqueKey) =>
      _queryNameClienteHistorialPagadoManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    razonNegadoCModels = FlutterFlowDynamicModels(() => RazonNegadoCModel());
  }

  @override
  void dispose() {
    razonNegadoCModels.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNameClienteHistorialPagadoCache();
  }
}
