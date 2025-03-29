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

  double? lastSum;

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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryAnadirFirst;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  ClientesRecord? queryDeleteFirst;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientesRecord? readPago;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryHistorial;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClientesRecord? readEnviar;

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
