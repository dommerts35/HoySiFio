import '/backend/backend.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'cliente_info_edit_widget.dart' show ClienteInfoEditWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class ClienteInfoEditModel extends FlutterFlowModel<ClienteInfoEditWidget> {
  ///  Local state fields for this page.

  int tempCount = 0;

  List<DataTypeProductosStruct> dtProdItem = [];
  void addToDtProdItem(DataTypeProductosStruct item) => dtProdItem.add(item);
  void removeFromDtProdItem(DataTypeProductosStruct item) =>
      dtProdItem.remove(item);
  void removeAtIndexFromDtProdItem(int index) => dtProdItem.removeAt(index);
  void insertAtIndexInDtProdItem(int index, DataTypeProductosStruct item) =>
      dtProdItem.insert(index, item);
  void updateDtProdItemAtIndex(
          int index, Function(DataTypeProductosStruct) updateFn) =>
      dtProdItem[index] = updateFn(dtProdItem[index]);

  double totalDeudaCompleta = 0.0;

  double tempSumHistorial = 0.0;

  double tempSumProductos = 0.0;

  double? sumaValoresEnDTProd;

  String? valorANormalizar;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? tenderoICPdeClienteController;
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in clienteInfoEdit widget.
  ClientesRecord? queryOnLoad;
  // Stores action output result for [Firestore Query - Query a collection] action in clienteInfoEdit widget.
  ClientesRecord? queryOnDispose;
  // Model for infoComp component.
  late InfoCompModel infoCompModel;
  // Stores action output result for [Backend Call - Read Document] action in iconoBorrar widget.
  ClientesRecord? readForClienteDelete;
  // Stores action output result for [Firestore Query - Query a collection] action in historialPagados widget.
  ClientesRecord? queryHistorialPagado;
  // Stores action output result for [Firestore Query - Query a collection] action in historialCobrar widget.
  ClientesRecord? queryHistorialPorPagar;
  // State field(s) for cantidatTf widget.
  FocusNode? cantidatTfFocusNode;
  TextEditingController? cantidatTfTextController;
  String? Function(BuildContext, String?)? cantidatTfTextControllerValidator;
  // State field(s) for prodTF widget.
  FocusNode? prodTFFocusNode;
  TextEditingController? prodTFTextController;
  String? Function(BuildContext, String?)? prodTFTextControllerValidator;
  // State field(s) for valorTF widget.
  FocusNode? valorTFFocusNode;
  TextEditingController? valorTFTextController;
  String? Function(BuildContext, String?)? valorTFTextControllerValidator;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in Button widget.
  double? valorConvVTF;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in Button widget.
  double? valorConvCTF;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryOnAnadir;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in Button widget.
  double? totalDeudaCompletaNorm;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon_delete widget.
  ClientesRecord? queryAfterDelete;
  // Stores action output result for [Firestore Query - Query a collection] action in Button_alFio widget.
  ClientesRecord? queryHistorialPorCobrarAlFio;
  // Stores action output result for [Firestore Query - Query a collection] action in Button_cobrar widget.
  ClientesRecord? queryHistorialPorCobrarCobrar;
  // Stores action output result for [Firestore Query - Query a collection] action in Button_abonar widget.
  ClientesRecord? queryHistorialPorCobrarAbonar;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClientesRecord? queryGuardar;
  // Stores action output result for [Custom Action - normalizarValorNumerico] action in Button widget.
  double? sumaValoresEnDTNorm;

  /// Query cache managers for this widget.

  final _queryUpdateTotalManager = StreamRequestManager<ClientesRecord>();
  Stream<ClientesRecord> queryUpdateTotal({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<ClientesRecord> Function() requestFn,
  }) =>
      _queryUpdateTotalManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryUpdateTotalCache() => _queryUpdateTotalManager.clear();
  void clearQueryUpdateTotalCacheKey(String? uniqueKey) =>
      _queryUpdateTotalManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    infoCompModel = createModel(context, () => InfoCompModel());
  }

  @override
  void dispose() {
    tenderoICPdeClienteController?.finish();
    infoCompModel.dispose();
    cantidatTfFocusNode?.dispose();
    cantidatTfTextController?.dispose();

    prodTFFocusNode?.dispose();
    prodTFTextController?.dispose();

    valorTFFocusNode?.dispose();
    valorTFTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryUpdateTotalCache();
  }
}
