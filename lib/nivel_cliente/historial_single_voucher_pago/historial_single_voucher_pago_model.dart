import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'historial_single_voucher_pago_widget.dart'
    show HistorialSingleVoucherPagoWidget;
import 'package:flutter/material.dart';

class HistorialSingleVoucherPagoModel
    extends FlutterFlowModel<HistorialSingleVoucherPagoWidget> {
  ///  Local state fields for this page.

  String? urlSupaImg;

  DataTypeHistorialPagoStruct? dtHistorialUpdate;
  void updateDtHistorialUpdateStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtHistorialUpdate ??= DataTypeHistorialPagoStruct());
  }

  bool checkElectr = false;

  bool checkBanca = false;

  bool checkVent = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkInternetConnection] action in historialSingleVoucherPago widget.
  bool? isInternetGood;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for valorMAP widget.
  FocusNode? valorMAPFocusNode;
  TextEditingController? valorMAPTextController;
  String? Function(BuildContext, String?)? valorMAPTextControllerValidator;
  // State field(s) for numComprobante widget.
  FocusNode? numComprobanteFocusNode;
  TextEditingController? numComprobanteTextController;
  String? Function(BuildContext, String?)?
      numComprobanteTextControllerValidator;
  // State field(s) for banco widget.
  FocusNode? bancoFocusNode;
  TextEditingController? bancoTextController;
  String? Function(BuildContext, String?)? bancoTextControllerValidator;
  // State field(s) for checkVent widget.
  bool? checkVentValue;
  // State field(s) for checkMovil widget.
  bool? checkMovilValue;
  // State field(s) for checkBanca widget.
  bool? checkBancaValue;
  // State field(s) for checkElectr widget.
  bool? checkElectrValue;
  bool isDataUploading_uploadDataZ9l = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ9l =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ9l = '';

  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? valorMAPConv;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? valorMAPReConv;
  // Stores action output result for [Backend Call - Read Document] action in botonPago widget.
  TenderosRecord? tenderoRead;
  // Stores action output result for [Backend Call - Read Document] action in botonPago widget.
  ClientesRecord? readClienteToNormalizeTotal;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? totalDeudaCompletaReal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorMAPFocusNode?.dispose();
    valorMAPTextController?.dispose();

    numComprobanteFocusNode?.dispose();
    numComprobanteTextController?.dispose();

    bancoFocusNode?.dispose();
    bancoTextController?.dispose();
  }
}
