// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataTypeProductoHistorialStruct extends FFFirebaseStruct {
  DataTypeProductoHistorialStruct({
    String? nombreProd,
    double? valorProd,
    DateTime? diaPagado,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombreProd = nombreProd,
        _valorProd = valorProd,
        _diaPagado = diaPagado,
        super(firestoreUtilData);

  // "nombreProd" field.
  String? _nombreProd;
  String get nombreProd => _nombreProd ?? '';
  set nombreProd(String? val) => _nombreProd = val;

  bool hasNombreProd() => _nombreProd != null;

  // "valorProd" field.
  double? _valorProd;
  double get valorProd => _valorProd ?? 0.0;
  set valorProd(double? val) => _valorProd = val;

  void incrementValorProd(double amount) => valorProd = valorProd + amount;

  bool hasValorProd() => _valorProd != null;

  // "diaPagado" field.
  DateTime? _diaPagado;
  DateTime? get diaPagado => _diaPagado;
  set diaPagado(DateTime? val) => _diaPagado = val;

  bool hasDiaPagado() => _diaPagado != null;

  static DataTypeProductoHistorialStruct fromMap(Map<String, dynamic> data) =>
      DataTypeProductoHistorialStruct(
        nombreProd: data['nombreProd'] as String?,
        valorProd: castToType<double>(data['valorProd']),
        diaPagado: data['diaPagado'] as DateTime?,
      );

  static DataTypeProductoHistorialStruct? maybeFromMap(dynamic data) => data
          is Map
      ? DataTypeProductoHistorialStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombreProd': _nombreProd,
        'valorProd': _valorProd,
        'diaPagado': _diaPagado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombreProd': serializeParam(
          _nombreProd,
          ParamType.String,
        ),
        'valorProd': serializeParam(
          _valorProd,
          ParamType.double,
        ),
        'diaPagado': serializeParam(
          _diaPagado,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DataTypeProductoHistorialStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeProductoHistorialStruct(
        nombreProd: deserializeParam(
          data['nombreProd'],
          ParamType.String,
          false,
        ),
        valorProd: deserializeParam(
          data['valorProd'],
          ParamType.double,
          false,
        ),
        diaPagado: deserializeParam(
          data['diaPagado'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DataTypeProductoHistorialStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypeProductoHistorialStruct &&
        nombreProd == other.nombreProd &&
        valorProd == other.valorProd &&
        diaPagado == other.diaPagado;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nombreProd, valorProd, diaPagado]);
}

DataTypeProductoHistorialStruct createDataTypeProductoHistorialStruct({
  String? nombreProd,
  double? valorProd,
  DateTime? diaPagado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeProductoHistorialStruct(
      nombreProd: nombreProd,
      valorProd: valorProd,
      diaPagado: diaPagado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeProductoHistorialStruct? updateDataTypeProductoHistorialStruct(
  DataTypeProductoHistorialStruct? dataTypeProductoHistorial, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeProductoHistorial
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeProductoHistorialStructData(
  Map<String, dynamic> firestoreData,
  DataTypeProductoHistorialStruct? dataTypeProductoHistorial,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeProductoHistorial == null) {
    return;
  }
  if (dataTypeProductoHistorial.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      dataTypeProductoHistorial.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeProductoHistorialData =
      getDataTypeProductoHistorialFirestoreData(
          dataTypeProductoHistorial, forFieldValue);
  final nestedData =
      dataTypeProductoHistorialData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dataTypeProductoHistorial.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeProductoHistorialFirestoreData(
  DataTypeProductoHistorialStruct? dataTypeProductoHistorial, [
  bool forFieldValue = false,
]) {
  if (dataTypeProductoHistorial == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeProductoHistorial.toMap());

  // Add any Firestore field values
  dataTypeProductoHistorial.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeProductoHistorialListFirestoreData(
  List<DataTypeProductoHistorialStruct>? dataTypeProductoHistorials,
) =>
    dataTypeProductoHistorials
        ?.map((e) => getDataTypeProductoHistorialFirestoreData(e, true))
        .toList() ??
    [];
