import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signin_confirm_widget.dart' show SigninConfirmWidget;
import 'package:flutter/material.dart';

class SigninConfirmModel extends FlutterFlowModel<SigninConfirmWidget> {
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for password_ToConfirm widget.
  FocusNode? passwordToConfirmFocusNode;
  TextEditingController? passwordToConfirmTextController;
  late bool passwordToConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordToConfirmTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_tendero widget.
  TenderosRecord? queryConfirm;

  @override
  void initState(BuildContext context) {
    passwordToConfirmVisibility = false;
  }

  @override
  void dispose() {
    passwordToConfirmFocusNode?.dispose();
    passwordToConfirmTextController?.dispose();
  }
}
