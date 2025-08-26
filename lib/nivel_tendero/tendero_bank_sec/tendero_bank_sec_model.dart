import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tendero_bank_sec_widget.dart' show TenderoBankSecWidget;
import 'package:flutter/material.dart';

class TenderoBankSecModel extends FlutterFlowModel<TenderoBankSecWidget> {
  ///  Local state fields for this page.

  bool isCuentaCorrienteSec = false;

  bool isCuentaDeAhorrosSec = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkInternetConnection] action in tenderoBankSec widget.
  bool? isInternetGood;
  // State field(s) for NumCuentaSec_tendero widget.
  FocusNode? numCuentaSecTenderoFocusNode;
  TextEditingController? numCuentaSecTenderoTextController;
  String? Function(BuildContext, String?)?
      numCuentaSecTenderoTextControllerValidator;
  // State field(s) for BancoSec_tendero widget.
  FocusNode? bancoSecTenderoFocusNode;
  TextEditingController? bancoSecTenderoTextController;
  String? Function(BuildContext, String?)?
      bancoSecTenderoTextControllerValidator;
  // State field(s) for duenoBancoSec_tendero widget.
  FocusNode? duenoBancoSecTenderoFocusNode;
  TextEditingController? duenoBancoSecTenderoTextController;
  String? Function(BuildContext, String?)?
      duenoBancoSecTenderoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    numCuentaSecTenderoFocusNode?.dispose();
    numCuentaSecTenderoTextController?.dispose();

    bancoSecTenderoFocusNode?.dispose();
    bancoSecTenderoTextController?.dispose();

    duenoBancoSecTenderoFocusNode?.dispose();
    duenoBancoSecTenderoTextController?.dispose();
  }
}
