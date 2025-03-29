// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistorialPagosStruct extends FFFirebaseStruct {
  HistorialPagosStruct({
    DateTime? fechaPago,
    List<DataTypeProductosStruct>? productos,
    double? totalPagado,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fechaPago = fechaPago,
        _productos = productos,
        _totalPagado = totalPagado,
        super(firestoreUtilData);

  // "fechaPago" field.
  DateTime? _fechaPago;
  DateTime? get fechaPago => _fechaPago;
  set fechaPago(DateTime? val) => _fechaPago = val;

  bool hasFechaPago() => _fechaPago != null;

  // "productos" field.
  List<DataTypeProductosStruct>? _productos;
  List<DataTypeProductosStruct> get productos => _productos ?? const [];
  set productos(List<DataTypeProductosStruct>? val) => _productos = val;

  void updateProductos(Function(List<DataTypeProductosStruct>) updateFn) {
    updateFn(_productos ??= []);
  }

  bool hasProductos() => _productos != null;

  // "totalPagado" field.
  double? _totalPagado;
  double get totalPagado => _totalPagado ?? 0.0;
  set totalPagado(double? val) => _totalPagado = val;

  void incrementTotalPagado(double amount) =>
      totalPagado = totalPagado + amount;

  bool hasTotalPagado() => _totalPagado != null;

  static HistorialPagosStruct fromMap(Map<String, dynamic> data) =>
      HistorialPagosStruct(
        fechaPago: data['fechaPago'] as DateTime?,
        productos: getStructList(
          data['productos'],
          DataTypeProductosStruct.fromMap,
        ),
        totalPagado: castToType<double>(data['totalPagado']),
      );

  static HistorialPagosStruct? maybeFromMap(dynamic data) => data is Map
      ? HistorialPagosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fechaPago': _fechaPago,
        'productos': _productos?.map((e) => e.toMap()).toList(),
        'totalPagado': _totalPagado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fechaPago': serializeParam(
          _fechaPago,
          ParamType.DateTime,
        ),
        'productos': serializeParam(
          _productos,
          ParamType.DataStruct,
          isList: true,
        ),
        'totalPagado': serializeParam(
          _totalPagado,
          ParamType.double,
        ),
      }.withoutNulls;

  static HistorialPagosStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistorialPagosStruct(
        fechaPago: deserializeParam(
          data['fechaPago'],
          ParamType.DateTime,
          false,
        ),
        productos: deserializeStructParam<DataTypeProductosStruct>(
          data['productos'],
          ParamType.DataStruct,
          true,
          structBuilder: DataTypeProductosStruct.fromSerializableMap,
        ),
        totalPagado: deserializeParam(
          data['totalPagado'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'HistorialPagosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HistorialPagosStruct &&
        fechaPago == other.fechaPago &&
        listEquality.equals(productos, other.productos) &&
        totalPagado == other.totalPagado;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fechaPago, productos, totalPagado]);
}

HistorialPagosStruct createHistorialPagosStruct({
  DateTime? fechaPago,
  double? totalPagado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HistorialPagosStruct(
      fechaPago: fechaPago,
      totalPagado: totalPagado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HistorialPagosStruct? updateHistorialPagosStruct(
  HistorialPagosStruct? historialPagos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    historialPagos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHistorialPagosStructData(
  Map<String, dynamic> firestoreData,
  HistorialPagosStruct? historialPagos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (historialPagos == null) {
    return;
  }
  if (historialPagos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && historialPagos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final historialPagosData =
      getHistorialPagosFirestoreData(historialPagos, forFieldValue);
  final nestedData =
      historialPagosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = historialPagos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHistorialPagosFirestoreData(
  HistorialPagosStruct? historialPagos, [
  bool forFieldValue = false,
]) {
  if (historialPagos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(historialPagos.toMap());

  // Add any Firestore field values
  historialPagos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHistorialPagosListFirestoreData(
  List<HistorialPagosStruct>? historialPagoss,
) =>
    historialPagoss
        ?.map((e) => getHistorialPagosFirestoreData(e, true))
        .toList() ??
    [];
