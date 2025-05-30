import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

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
  // State field(s) for valorMAP widget.
  FocusNode? valorMAPFocusNode;
  TextEditingController? valorMAPTextController;
  String? Function(BuildContext, String?)? valorMAPTextControllerValidator;
  // State field(s) for numVoucher widget.
  FocusNode? numVoucherFocusNode;
  TextEditingController? numVoucherTextController;
  String? Function(BuildContext, String?)? numVoucherTextControllerValidator;
  // State field(s) for checkElectr widget.
  bool? checkElectrValue;
  // State field(s) for checkBanca widget.
  bool? checkBancaValue;
  // State field(s) for checkVent widget.
  bool? checkVentValue;
  bool isDataUploading_uploadDataZ9l = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ9l =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ9l = '';

  // Stores action output result for [Custom Action - normalizarValorNumerico] action in botonPago widget.
  double? valorMAPConv;

  /// Query cache managers for this widget.

  final _queryNombreClienteManager = StreamRequestManager<ClientesRecord>();
  Stream<ClientesRecord> queryNombreCliente({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<ClientesRecord> Function() requestFn,
  }) =>
      _queryNombreClienteManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryNombreClienteCache() => _queryNombreClienteManager.clear();
  void clearQueryNombreClienteCacheKey(String? uniqueKey) =>
      _queryNombreClienteManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorMAPFocusNode?.dispose();
    valorMAPTextController?.dispose();

    numVoucherFocusNode?.dispose();
    numVoucherTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNombreClienteCache();
  }
}
