import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_my_password_widget.dart' show ForgotMyPasswordWidget;
import 'package:flutter/material.dart';

class ForgotMyPasswordModel extends FlutterFlowModel<ForgotMyPasswordWidget> {
  ///  Local state fields for this page.

  bool isSent = false;

  String? pswrdOtp;

  bool isProfileTenderoChosen = false;

  bool isProfileClienteChosen = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress_forgot widget.
  FocusNode? emailAddressForgotFocusNode;
  TextEditingController? emailAddressForgotTextController;
  String? Function(BuildContext, String?)?
      emailAddressForgotTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_sendForgot widget.
  TenderosRecord? queryTenderoForPswrdReset;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_sendForgot widget.
  ClientesRecord? queryClienteForPswrdReset;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in btn_sendForgot widget.
  bool? isTendero;
  // State field(s) for passwordNew_forgot widget.
  FocusNode? passwordNewForgotFocusNode;
  TextEditingController? passwordNewForgotTextController;
  late bool passwordNewForgotVisibility;
  String? Function(BuildContext, String?)?
      passwordNewForgotTextControllerValidator;
  String? _passwordNewForgotTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su nueva contraseña';
    }

    if (val.length < 8) {
      return 'Ingrese una contraseña de al menos 8 carácteres.';
    }
    if (val.length > 16) {
      return 'Ingrese una contraseña de menos de 16 carácteres.';
    }
    if (!RegExp(
            '^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*()_+{}\\[\\]:;<>,.?\\~]).{8,}\$')
        .hasMatch(val)) {
      return 'La contraseña ingresada es inválida.';
    }
    return null;
  }

  // State field(s) for otp_forgot widget.
  FocusNode? otpForgotFocusNode;
  TextEditingController? otpForgotTextController;
  String? Function(BuildContext, String?)? otpForgotTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_sendForgot widget.
  TenderosRecord? resetQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_sendForgot widget.
  TenderosRecord? resetQueryTenderoChosen;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_sendForgot widget.
  List<ClientesRecord>? resetQueryCliente;

  @override
  void initState(BuildContext context) {
    passwordNewForgotVisibility = false;
    passwordNewForgotTextControllerValidator =
        _passwordNewForgotTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressForgotFocusNode?.dispose();
    emailAddressForgotTextController?.dispose();

    passwordNewForgotFocusNode?.dispose();
    passwordNewForgotTextController?.dispose();

    otpForgotFocusNode?.dispose();
    otpForgotTextController?.dispose();
  }
}
