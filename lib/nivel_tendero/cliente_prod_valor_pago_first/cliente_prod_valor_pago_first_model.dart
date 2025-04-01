import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_prod_valor_pago_first_widget.dart'
    show ClienteProdValorPagoFirstWidget;
import 'package:flutter/material.dart';

class ClienteProdValorPagoFirstModel
    extends FlutterFlowModel<ClienteProdValorPagoFirstWidget> {
  ///  Local state fields for this page.

  DataTypeHistorialPagoStruct? dtProdHistorial;
  void updateDtProdHistorialStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtProdHistorial ??= DataTypeHistorialPagoStruct());
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
  ClientesRecord? readPagaParcial;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorAPFocusNode?.dispose();
    valorAPTextController?.dispose();
  }
}
