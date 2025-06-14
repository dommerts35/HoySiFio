import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'cliente_prod_full_pago_widget.dart' show ClienteProdFullPagoWidget;
import 'package:flutter/material.dart';

class ClienteProdFullPagoModel
    extends FlutterFlowModel<ClienteProdFullPagoWidget> {
  ///  Local state fields for this page.

  List<DataTypeHistorialPagoStruct> dtProdHistorialListAfter = [];
  void addToDtProdHistorialListAfter(DataTypeHistorialPagoStruct item) =>
      dtProdHistorialListAfter.add(item);
  void removeFromDtProdHistorialListAfter(DataTypeHistorialPagoStruct item) =>
      dtProdHistorialListAfter.remove(item);
  void removeAtIndexFromDtProdHistorialListAfter(int index) =>
      dtProdHistorialListAfter.removeAt(index);
  void insertAtIndexInDtProdHistorialListAfter(
          int index, DataTypeHistorialPagoStruct item) =>
      dtProdHistorialListAfter.insert(index, item);
  void updateDtProdHistorialListAfterAtIndex(
          int index, Function(DataTypeHistorialPagoStruct) updateFn) =>
      dtProdHistorialListAfter[index] =
          updateFn(dtProdHistorialListAfter[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  double? totalDeudaCompletaConv;
  // Stores action output result for [Validate Form] action in botonPago widget.
  bool? validarFormPago;
  // Stores action output result for [Backend Call - Read Document] action in botonPago widget.
  TenderosRecord? tenderoRead;

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
