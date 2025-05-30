import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'historial_vouchers_cliente_widget.dart'
    show HistorialVouchersClienteWidget;
import 'package:flutter/material.dart';

class HistorialVouchersClienteModel
    extends FlutterFlowModel<HistorialVouchersClienteWidget> {
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearQueryNameClienteHistorialPagadoCache();
  }
}
