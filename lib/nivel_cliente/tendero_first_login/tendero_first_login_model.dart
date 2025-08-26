import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tendero_first_login_widget.dart' show TenderoFirstLoginWidget;
import 'package:flutter/material.dart';

class TenderoFirstLoginModel extends FlutterFlowModel<TenderoFirstLoginWidget> {
  ///  Local state fields for this page.

  int tempCountLoginCliente = 0;

  List<DocumentReference> idsTenderos = [];
  void addToIdsTenderos(DocumentReference item) => idsTenderos.add(item);
  void removeFromIdsTenderos(DocumentReference item) =>
      idsTenderos.remove(item);
  void removeAtIndexFromIdsTenderos(int index) => idsTenderos.removeAt(index);
  void insertAtIndexInIdsTenderos(int index, DocumentReference item) =>
      idsTenderos.insert(index, item);
  void updateIdsTenderosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      idsTenderos[index] = updateFn(idsTenderos[index]);

  bool isCuentaDeAhorros = false;

  bool isCuentaCorriente = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkInternetConnection] action in tenderoFirstLogin widget.
  bool? isInternetGood;
  // State field(s) for codigoFirstLogin_Cliente widget.
  FocusNode? codigoFirstLoginClienteFocusNode;
  TextEditingController? codigoFirstLoginClienteTextController;
  late bool codigoFirstLoginClienteVisibility;
  String? Function(BuildContext, String?)?
      codigoFirstLoginClienteTextControllerValidator;
  // Stores action output result for [Validate Form] action in btn_tenderoFirstLogin widget.
  bool? validarFirstLoginCliente;

  @override
  void initState(BuildContext context) {
    codigoFirstLoginClienteVisibility = false;
  }

  @override
  void dispose() {
    codigoFirstLoginClienteFocusNode?.dispose();
    codigoFirstLoginClienteTextController?.dispose();
  }
}
