import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resumen_fiado_clien_tienda_new_widget.dart'
    show ResumenFiadoClienTiendaNewWidget;
import 'package:flutter/material.dart';

class ResumenFiadoClienTiendaNewModel
    extends FlutterFlowModel<ResumenFiadoClienTiendaNewWidget> {
  ///  Local state fields for this page.

  String? urImg;

  int tempSetCountCliente = 0;

  int tempItemCountHistorial = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in resumenFiadoClienTiendaNew widget.
  List<ClientesRecord>? queryOnLoadClientes;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
