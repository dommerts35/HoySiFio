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

  double? lastSumTotalPago;

  List<DataTypeProductosStruct> dtProdItem = [];
  void addToDtProdItem(DataTypeProductosStruct item) => dtProdItem.add(item);
  void removeFromDtProdItem(DataTypeProductosStruct item) =>
      dtProdItem.remove(item);
  void removeAtIndexFromDtProdItem(int index) => dtProdItem.removeAt(index);
  void insertAtIndexInDtProdItem(int index, DataTypeProductosStruct item) =>
      dtProdItem.insert(index, item);
  void updateDtProdItemAtIndex(
          int index, Function(DataTypeProductosStruct) updateFn) =>
      dtProdItem[index] = updateFn(dtProdItem[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in clienteProd-InfoEdit widget.
  ClientesRecord? readOnLoad;
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
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientesRecord? readAnadirFirst;
  ClientesRecord? vistaMainPreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  ClientesRecord? readDeleteFirst;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientesRecord? readPago;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryHistorial;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientesRecord? readEnviar;
  // Stores action output result for [Backend Call - Read Document] action in iconoBack widget.
  ClientesRecord? readBack;

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
