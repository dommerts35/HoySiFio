import '/backend/backend.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cliente_prod_info_edit_widget.dart' show ClienteProdInfoEditWidget;
import 'package:flutter/material.dart';

class ClienteProdInfoEditModel
    extends FlutterFlowModel<ClienteProdInfoEditWidget> {
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
  // Model for infoComp component.
  late InfoCompModel infoCompModel;
  // State field(s) for prodTF widget.
  FocusNode? prodTFFocusNode;
  TextEditingController? prodTFTextController;
  String? Function(BuildContext, String?)? prodTFTextControllerValidator;
  // State field(s) for valorTF widget.
  FocusNode? valorTFFocusNode;
  TextEditingController? valorTFTextController;
  String? Function(BuildContext, String?)? valorTFTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryPaga;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryHistorial;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientesRecord? finalQuery;

  @override
  void initState(BuildContext context) {
    infoCompModel = createModel(context, () => InfoCompModel());
  }

  @override
  void dispose() {
    infoCompModel.dispose();
    prodTFFocusNode?.dispose();
    prodTFTextController?.dispose();

    valorTFFocusNode?.dispose();
    valorTFTextController?.dispose();
  }
}
