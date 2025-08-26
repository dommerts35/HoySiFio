import '/backend/backend.dart';
import '/components_nivel_tendero/razon_negado_c/razon_negado_c_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  // Stores action output result for [Custom Action - checkInternetConnection] action in historialVouchers widget.
  bool? isInternetGood;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;
  // Models for razonNegadoC dynamic component.
  late FlutterFlowDynamicModels<RazonNegadoCModel> razonNegadoCModels;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconoDeny widget.
  bool? isDeny;
  // Stores action output result for [Backend Call - Read Document] action in iconoDeny widget.
  TenderosRecord? readForTenderoDenyPush;
  // Stores action output result for [Backend Call - Read Document] action in iconoConfirmarComprobante widget.
  ClientesRecord? readClienteToNormalize;
  // Stores action output result for [Custom Action - normalizarValorParaAceptacionDePago] action in iconoConfirmarComprobante widget.
  double? totalDeudaRCompletaReal;
  // Stores action output result for [Custom Action - normalizarValorParaAceptacionDePago] action in iconoConfirmarComprobante widget.
  double? totalPorPagarNormalized;
  // Stores action output result for [Custom Action - normalizarValorParaAceptacionDePago] action in iconoConfirmarComprobante widget.
  double? totalPorPagarRE;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconoConfirmarComprobante widget.
  bool? isConfirmar;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormV;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormV2;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? calculoNormalized;
  // Stores action output result for [Custom Action - normalizarValorParaAceptacionDePago] action in iconoConfirmarComprobante widget.
  double? montoAPagarNormalized;
  // Stores action output result for [Custom Action - normalizarValorParaAceptacionDePago] action in iconoConfirmarComprobante widget.
  double? montoAPagarReal;
  // Stores action output result for [Custom Action - normalizarValorParaAceptacionDePago] action in iconoConfirmarComprobante widget.
  double? resultadoProcesado;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormVF;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in iconoConfirmarComprobante widget.
  double? tDCNormVF2;
  // Stores action output result for [Backend Call - Read Document] action in iconoConfirmarComprobante widget.
  TenderosRecord? readForTenderoAcceptPush;

  @override
  void initState(BuildContext context) {
    razonNegadoCModels = FlutterFlowDynamicModels(() => RazonNegadoCModel());
  }

  @override
  void dispose() {
    razonNegadoCModels.dispose();
  }
}
