import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_my_password_widget.dart' show ForgotMyPasswordWidget;
import 'package:flutter/material.dart';

class ForgotMyPasswordModel extends FlutterFlowModel<ForgotMyPasswordWidget> {
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

  bool isPINTendero = false;

  bool isPswrdTendero = true;

  bool isPINCliente = false;

  bool isPswrdCliente = true;

  bool isClienteSetWithPss = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress_forgot widget.
  FocusNode? emailAddressForgotFocusNode;
  TextEditingController? emailAddressForgotTextController;
  String? Function(BuildContext, String?)?
      emailAddressForgotTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressForgotFocusNode?.dispose();
    emailAddressForgotTextController?.dispose();
  }
}
