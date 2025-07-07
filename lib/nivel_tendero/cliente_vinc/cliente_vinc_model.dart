import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'cliente_vinc_widget.dart' show ClienteVincWidget;
import 'package:flutter/material.dart';

class ClienteVincModel extends FlutterFlowModel<ClienteVincWidget> {
  ///  Local state fields for this page.

  DataTypeHistorialPagoStruct? dtProdHistorialAfter;
  void updateDtProdHistorialAfterStruct(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtProdHistorialAfter ??= DataTypeHistorialPagoStruct());
  }

  double? nuevoTotal;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for valorUser widget.
  FocusNode? valorUserFocusNode;
  TextEditingController? valorUserTextController;
  String? Function(BuildContext, String?)? valorUserTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in botonVinc widget.
  ClientesRecord? makeVincCliente;

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
    valorUserFocusNode?.dispose();
    valorUserTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryNombreClienteCache();
  }
}
