import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_my_password_widget.dart' show ForgotMyPasswordWidget;
import 'package:flutter/material.dart';

class ForgotMyPasswordModel extends FlutterFlowModel<ForgotMyPasswordWidget> {
  ///  Local state fields for this page.

  bool isSent = false;

  String? pswrdOtp;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress_forgot widget.
  FocusNode? emailAddressForgotFocusNode;
  TextEditingController? emailAddressForgotTextController;
  String? Function(BuildContext, String?)?
      emailAddressForgotTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in emailAddress_forgot widget.
  TenderosRecord? queryEmailTendero;
  // State field(s) for otp_forgot widget.
  FocusNode? otpForgotFocusNode;
  TextEditingController? otpForgotTextController;
  String? Function(BuildContext, String?)? otpForgotTextControllerValidator;
  // State field(s) for passwordNew_forgot widget.
  FocusNode? passwordNewForgotFocusNode;
  TextEditingController? passwordNewForgotTextController;
  late bool passwordNewForgotVisibility;
  String? Function(BuildContext, String?)?
      passwordNewForgotTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_sendForgot widget.
  TenderosRecord? resetQuery;

  @override
  void initState(BuildContext context) {
    passwordNewForgotVisibility = false;
  }

  @override
  void dispose() {
    emailAddressForgotFocusNode?.dispose();
    emailAddressForgotTextController?.dispose();

    otpForgotFocusNode?.dispose();
    otpForgotTextController?.dispose();

    passwordNewForgotFocusNode?.dispose();
    passwordNewForgotTextController?.dispose();
  }
}
