import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'cliente_prod_select_pago_widget.dart' show ClienteProdSelectPagoWidget;
import 'package:flutter/material.dart';

class ClienteProdSelectPagoModel
    extends FlutterFlowModel<ClienteProdSelectPagoWidget> {
  ///  Local state fields for this page.

  List<DataTypeHistorialPagoStruct> dtSelectHPListAfter = [];
  void addToDtSelectHPListAfter(DataTypeHistorialPagoStruct item) =>
      dtSelectHPListAfter.add(item);
  void removeFromDtSelectHPListAfter(DataTypeHistorialPagoStruct item) =>
      dtSelectHPListAfter.remove(item);
  void removeAtIndexFromDtSelectHPListAfter(int index) =>
      dtSelectHPListAfter.removeAt(index);
  void insertAtIndexInDtSelectHPListAfter(
          int index, DataTypeHistorialPagoStruct item) =>
      dtSelectHPListAfter.insert(index, item);
  void updateDtSelectHPListAfterAtIndex(
          int index, Function(DataTypeHistorialPagoStruct) updateFn) =>
      dtSelectHPListAfter[index] = updateFn(dtSelectHPListAfter[index]);

  double? totalAPagarSelect;

  double calcForTDC = 0.0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for checkTransfer widget.
  bool? checkTransferValue;
  // State field(s) for checkEfectivo widget.
  bool? checkEfectivoValue;
  // State field(s) for comprobanteNumTF widget.
  FocusNode? comprobanteNumTFFocusNode;
  TextEditingController? comprobanteNumTFTextController;
  String? Function(BuildContext, String?)?
      comprobanteNumTFTextControllerValidator;
  // Stores action output result for [Validate Form] action in botonPago widget.
  bool? validarFormPago;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? totalDeudaCompletaNewNorm;
  // Stores action output result for [Backend Call - Read Document] action in botonPago widget.
  TenderosRecord? tenderoReadSP;

  /// Query cache managers for this widget.

  final _queryNombreClienteManager = StreamRequestManager<ClientesRecord>();
  Stream<ClientesRecord> queryNombreCliente({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<ClientesRecord> Function() requestFn,
  }) =>
      _queryNombreClienteManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryNombreClienteCache() => _queryNombreClienteManager.clear();
  void clearQueryNombreClienteCacheKey(String? uniqueKey) =>
      _queryNombreClienteManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    comprobanteNumTFFocusNode?.dispose();
    comprobanteNumTFTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNombreClienteCache();
  }
}
