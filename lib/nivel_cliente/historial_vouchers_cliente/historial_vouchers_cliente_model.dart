import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in historialVouchersCliente widget.
  bool? isInternetGood;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
