import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'historial_full_voucher_pago_widget.dart'
    show HistorialFullVoucherPagoWidget;
import 'package:flutter/material.dart';

class HistorialFullVoucherPagoModel
    extends FlutterFlowModel<HistorialFullVoucherPagoWidget> {
  ///  Local state fields for this page.

  String? urlSupaImg;

  List<DataTypeHistorialPagoStruct> dtHistorialUpdateList = [];
  void addToDtHistorialUpdateList(DataTypeHistorialPagoStruct item) =>
      dtHistorialUpdateList.add(item);
  void removeFromDtHistorialUpdateList(DataTypeHistorialPagoStruct item) =>
      dtHistorialUpdateList.remove(item);
  void removeAtIndexFromDtHistorialUpdateList(int index) =>
      dtHistorialUpdateList.removeAt(index);
  void insertAtIndexInDtHistorialUpdateList(
          int index, DataTypeHistorialPagoStruct item) =>
      dtHistorialUpdateList.insert(index, item);
  void updateDtHistorialUpdateListAtIndex(
          int index, Function(DataTypeHistorialPagoStruct) updateFn) =>
      dtHistorialUpdateList[index] = updateFn(dtHistorialUpdateList[index]);

  bool checkElectr = false;

  bool checkBanca = false;

  bool checkVent = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for numComprobante widget.
  FocusNode? numComprobanteFocusNode;
  TextEditingController? numComprobanteTextController;
  String? Function(BuildContext, String?)?
      numComprobanteTextControllerValidator;
  // State field(s) for checkElectr widget.
  bool? checkElectrValue;
  // State field(s) for checkBanca widget.
  bool? checkBancaValue;
  // State field(s) for checkVent widget.
  bool? checkVentValue;
  bool isDataUploading_uploadDataZ9l2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ9l2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ9l2 = '';

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
    numComprobanteFocusNode?.dispose();
    numComprobanteTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNombreClienteCache();
  }
}
