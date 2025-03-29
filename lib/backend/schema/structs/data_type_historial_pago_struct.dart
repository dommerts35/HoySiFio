// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypeHistorialPagoStruct extends FFFirebaseStruct {
  DataTypeHistorialPagoStruct({
    DateTime? fechaPago,
    List<HistorialPagosStruct>? productos,
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
  List<HistorialPagosStruct>? _productos;
  List<HistorialPagosStruct> get productos => _productos ?? const [];
  set productos(List<HistorialPagosStruct>? val) => _productos = val;

  void updateProductos(Function(List<HistorialPagosStruct>) updateFn) {
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

  static DataTypeHistorialPagoStruct fromMap(Map<String, dynamic> data) =>
      DataTypeHistorialPagoStruct(
        fechaPago: data['fechaPago'] as DateTime?,
        productos: getStructList(
          data['productos'],
          HistorialPagosStruct.fromMap,
        ),
        totalPagado: castToType<double>(data['totalPagado']),
      );

  static DataTypeHistorialPagoStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeHistorialPagoStruct.fromMap(data.cast<String, dynamic>())
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

  static DataTypeHistorialPagoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeHistorialPagoStruct(
        fechaPago: deserializeParam(
          data['fechaPago'],
          ParamType.DateTime,
          false,
        ),
        productos: deserializeStructParam<HistorialPagosStruct>(
          data['productos'],
          ParamType.DataStruct,
          true,
          structBuilder: HistorialPagosStruct.fromSerializableMap,
        ),
        totalPagado: deserializeParam(
          data['totalPagado'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DataTypeHistorialPagoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataTypeHistorialPagoStruct &&
        fechaPago == other.fechaPago &&
        listEquality.equals(productos, other.productos) &&
        totalPagado == other.totalPagado;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fechaPago, productos, totalPagado]);
}

DataTypeHistorialPagoStruct createDataTypeHistorialPagoStruct({
  DateTime? fechaPago,
  double? totalPagado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeHistorialPagoStruct(
      fechaPago: fechaPago,
      totalPagado: totalPagado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeHistorialPagoStruct? updateDataTypeHistorialPagoStruct(
  DataTypeHistorialPagoStruct? dataTypeHistorialPago, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeHistorialPago
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeHistorialPagoStructData(
  Map<String, dynamic> firestoreData,
  DataTypeHistorialPagoStruct? dataTypeHistorialPago,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeHistorialPago == null) {
    return;
  }
  if (dataTypeHistorialPago.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      dataTypeHistorialPago.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeHistorialPagoData = getDataTypeHistorialPagoFirestoreData(
      dataTypeHistorialPago, forFieldValue);
  final nestedData =
      dataTypeHistorialPagoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dataTypeHistorialPago.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeHistorialPagoFirestoreData(
  DataTypeHistorialPagoStruct? dataTypeHistorialPago, [
  bool forFieldValue = false,
]) {
  if (dataTypeHistorialPago == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeHistorialPago.toMap());

  // Add any Firestore field values
  dataTypeHistorialPago.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeHistorialPagoListFirestoreData(
  List<DataTypeHistorialPagoStruct>? dataTypeHistorialPagos,
) =>
    dataTypeHistorialPagos
        ?.map((e) => getDataTypeHistorialPagoFirestoreData(e, true))
        .toList() ??
    [];
