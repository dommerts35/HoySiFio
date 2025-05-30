import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'resumen_fiado_clien_tienda_new_widget.dart'
    show ResumenFiadoClienTiendaNewWidget;
import 'package:flutter/material.dart';

class ResumenFiadoClienTiendaNewModel
    extends FlutterFlowModel<ResumenFiadoClienTiendaNewWidget> {
  ///  Local state fields for this page.

  List<String> nombresTiendas = [];
  void addToNombresTiendas(String item) => nombresTiendas.add(item);
  void removeFromNombresTiendas(String item) => nombresTiendas.remove(item);
  void removeAtIndexFromNombresTiendas(int index) =>
      nombresTiendas.removeAt(index);
  void insertAtIndexInNombresTiendas(int index, String item) =>
      nombresTiendas.insert(index, item);
  void updateNombresTiendasAtIndex(int index, Function(String) updateFn) =>
      nombresTiendas[index] = updateFn(nombresTiendas[index]);

  int tempNombreTiendasCount = 0;

  String? urImg;

  int tempSetCountCliente = 0;

  int tempItemCountHistorial = 0;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? clienteTiendasListController;
  // Stores action output result for [Firestore Query - Query a collection] action in resumenFiadoClienTiendaNew widget.
  List<ClientesRecord>? queryOnLoadClientes;
  // Stores action output result for [Backend Call - Read Document] action in resumenFiadoClienTiendaNew widget.
  TenderosRecord? readCountTendero;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    clienteTiendasListController?.finish();
  }
}
