import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'cliente_prod_valor_pago_widget.dart' show ClienteProdValorPagoWidget;
import 'package:flutter/material.dart';

class ClienteProdValorPagoModel
    extends FlutterFlowModel<ClienteProdValorPagoWidget> {
  ///  Local state fields for this page.

  DataTypeHistorialPagoStruct? dtProdHistorialAfter;
  void updateDtProdHistorialAfterStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtProdHistorialAfter ??= DataTypeHistorialPagoStruct());
  }

  double? nuevoTotal;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for valorAP widget.
  FocusNode? valorAPFocusNode;
  TextEditingController? valorAPTextController;
  String? Function(BuildContext, String?)? valorAPTextControllerValidator;
  // State field(s) for checkTransfer widget.
  bool? checkTransferValue;
  // State field(s) for comprobanteNumTF widget.
  FocusNode? comprobanteNumTFFocusNode;
  TextEditingController? comprobanteNumTFTextController;
  String? Function(BuildContext, String?)?
      comprobanteNumTFTextControllerValidator;
  // State field(s) for checkEfectivo widget.
  bool? checkEfectivoValue;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? valorConv;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? totalPorPagarFromHistorialConv;
  // Stores action output result for [Validate Form] action in botonPago widget.
  bool? validarFormPago;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? tDCNorm;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? tDCNormF;
  // Stores action output result for [Backend Call - Read Document] action in botonPago widget.
  TenderosRecord? readTenderoVP;

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
    valorAPFocusNode?.dispose();
    valorAPTextController?.dispose();

    comprobanteNumTFFocusNode?.dispose();
    comprobanteNumTFTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNombreClienteCache();
  }
}
