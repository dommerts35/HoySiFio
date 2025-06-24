import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resumen_fiado_clien_prods_new_widget.dart'
    show ResumenFiadoClienProdsNewWidget;
import 'package:flutter/material.dart';

class ResumenFiadoClienProdsNewModel
    extends FlutterFlowModel<ResumenFiadoClienProdsNewWidget> {
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

  int tempSetCountCliente = 0;

  int tempItemCountHistorial = 0;

  DataTypeHistorialPagoStruct? dTHistorial;
  void updateDTHistorialStruct(Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dTHistorial ??= DataTypeHistorialPagoStruct());
  }

  String? urlSupaImg;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<DataTypeHistorialPagoStruct, bool> checkboxValueMap1 = {};
  List<DataTypeHistorialPagoStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<DataTypeHistorialPagoStruct, bool> checkboxValueMap2 = {};
  List<DataTypeHistorialPagoStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
