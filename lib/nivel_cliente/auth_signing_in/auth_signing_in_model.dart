import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_signing_in_widget.dart' show AuthSigningInWidget;
import 'package:flutter/material.dart';

class AuthSigningInModel extends FlutterFlowModel<AuthSigningInWidget> {
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

  // State field(s) for tabInicioSesion widget.
  TabController? tabInicioSesionController;
  int get tabInicioSesionCurrentIndex =>
      tabInicioSesionController != null ? tabInicioSesionController!.index : 0;
  int get tabInicioSesionPreviousIndex => tabInicioSesionController != null
      ? tabInicioSesionController!.previousIndex
      : 0;

  // State field(s) for emailAddress_Tendero widget.
  FocusNode? emailAddressTenderoFocusNode;
  TextEditingController? emailAddressTenderoTextController;
  String? Function(BuildContext, String?)?
      emailAddressTenderoTextControllerValidator;
  // State field(s) for password_Tendero widget.
  FocusNode? passwordTenderoFocusNode;
  TextEditingController? passwordTenderoTextController;
  late bool passwordTenderoVisibility;
  String? Function(BuildContext, String?)?
      passwordTenderoTextControllerValidator;
  // State field(s) for pin_Tendero widget.
  FocusNode? pinTenderoFocusNode;
  TextEditingController? pinTenderoTextController;
  late bool pinTenderoVisibility;
  String? Function(BuildContext, String?)? pinTenderoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_tendero widget.
  TenderosRecord? queryInicioTenderoPin;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_tendero widget.
  TenderosRecord? queryInicioTenderoPswrd;
  // State field(s) for ci_Cliente widget.
  FocusNode? ciClienteFocusNode;
  TextEditingController? ciClienteTextController;
  String? Function(BuildContext, String?)? ciClienteTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in ci_Cliente widget.
  ClientesRecord? queryForClienteWithPswrd;
  // State field(s) for password_Cliente widget.
  FocusNode? passwordClienteFocusNode;
  TextEditingController? passwordClienteTextController;
  late bool passwordClienteVisibility;
  String? Function(BuildContext, String?)?
      passwordClienteTextControllerValidator;
  // State field(s) for pin_Cliente widget.
  FocusNode? pinClienteFocusNode;
  TextEditingController? pinClienteTextController;
  late bool pinClienteVisibility;
  String? Function(BuildContext, String?)? pinClienteTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_cliente widget.
  ClientesRecord? queryForClienteWithNoPsswrd;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_cliente widget.
  List<ClientesRecord>? queryClientePsswrd;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_cliente widget.
  List<ClientesRecord>? queryClientePIN;

  @override
  void initState(BuildContext context) {
    passwordTenderoVisibility = false;
    pinTenderoVisibility = false;
    passwordClienteVisibility = false;
    pinClienteVisibility = false;
  }

  @override
  void dispose() {
    tabInicioSesionController?.dispose();
    emailAddressTenderoFocusNode?.dispose();
    emailAddressTenderoTextController?.dispose();

    passwordTenderoFocusNode?.dispose();
    passwordTenderoTextController?.dispose();

    pinTenderoFocusNode?.dispose();
    pinTenderoTextController?.dispose();

    ciClienteFocusNode?.dispose();
    ciClienteTextController?.dispose();

    passwordClienteFocusNode?.dispose();
    passwordClienteTextController?.dispose();

    pinClienteFocusNode?.dispose();
    pinClienteTextController?.dispose();
  }
}
