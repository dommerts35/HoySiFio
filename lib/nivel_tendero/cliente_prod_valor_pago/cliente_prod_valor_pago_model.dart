import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cliente_prod_valor_pago_widget.dart' show ClienteProdValorPagoWidget;
import 'package:flutter/material.dart';

class ClienteProdValorPagoModel
    extends FlutterFlowModel<ClienteProdValorPagoWidget> {
  ///  Local state fields for this page.

  int? tempCount = 0;

  double? tempSum1;

  List<DataTypeProductosStruct> dtProdToHistorial = [];
  void addToDtProdToHistorial(DataTypeProductosStruct item) =>
      dtProdToHistorial.add(item);
  void removeFromDtProdToHistorial(DataTypeProductosStruct item) =>
      dtProdToHistorial.remove(item);
  void removeAtIndexFromDtProdToHistorial(int index) =>
      dtProdToHistorial.removeAt(index);
  void insertAtIndexInDtProdToHistorial(
          int index, DataTypeProductosStruct item) =>
      dtProdToHistorial.insert(index, item);
  void updateDtProdToHistorialAtIndex(
          int index, Function(DataTypeProductosStruct) updateFn) =>
      dtProdToHistorial[index] = updateFn(dtProdToHistorial[index]);

  DateTime? dateDTProdToHistorial;

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
  // Stores action output result for [Firestore Query - Query a collection] action in botonPago widget.
  ClientesRecord? queryPaga;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorAPFocusNode?.dispose();
    valorAPTextController?.dispose();
  }
}
