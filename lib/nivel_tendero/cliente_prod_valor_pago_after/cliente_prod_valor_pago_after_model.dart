import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_prod_valor_pago_after_widget.dart'
    show ClienteProdValorPagoAfterWidget;
import 'package:flutter/material.dart';

class ClienteProdValorPagoAfterModel
    extends FlutterFlowModel<ClienteProdValorPagoAfterWidget> {
  ///  Local state fields for this page.

  DataTypeHistorialPagoStruct? dtProdHistorialAfter;
  void updateDtProdHistorialAfterStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtProdHistorialAfter ??= DataTypeHistorialPagoStruct());
  }

  DataTypeClienteStruct? dtClienteAfter;
  void updateDtClienteAfterStruct(Function(DataTypeClienteStruct) updateFn) {
    updateFn(dtClienteAfter ??= DataTypeClienteStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for valorAP widget.
  FocusNode? valorAPFocusNode;
  TextEditingController? valorAPTextController;
  String? Function(BuildContext, String?)? valorAPTextControllerValidator;
  // State field(s) for checkTransfer widget.
  bool? checkTransferValue;
  // State field(s) for checkEfectivo widget.
  bool? checkEfectivoValue;
  // Stores action output result for [Backend Call - Read Document] action in botonPago widget.
  ClientesRecord? readPagoAfter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorAPFocusNode?.dispose();
    valorAPTextController?.dispose();
  }
}
