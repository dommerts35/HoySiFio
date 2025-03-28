// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataTypeProductosStruct extends FFFirebaseStruct {
  DataTypeProductosStruct({
    String? nombreProd,
    double? valorProd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombreProd = nombreProd,
        _valorProd = valorProd,
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

  static DataTypeProductosStruct fromMap(Map<String, dynamic> data) =>
      DataTypeProductosStruct(
        nombreProd: data['nombreProd'] as String?,
        valorProd: castToType<double>(data['valorProd']),
      );

  static DataTypeProductosStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeProductosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombreProd': _nombreProd,
        'valorProd': _valorProd,
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
      }.withoutNulls;

  static DataTypeProductosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeProductosStruct(
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
      );

  @override
  String toString() => 'DataTypeProductosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypeProductosStruct &&
        nombreProd == other.nombreProd &&
        valorProd == other.valorProd;
  }

  @override
  int get hashCode => const ListEquality().hash([nombreProd, valorProd]);
}

DataTypeProductosStruct createDataTypeProductosStruct({
  String? nombreProd,
  double? valorProd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeProductosStruct(
      nombreProd: nombreProd,
      valorProd: valorProd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeProductosStruct? updateDataTypeProductosStruct(
  DataTypeProductosStruct? dataTypeProductos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeProductos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeProductosStructData(
  Map<String, dynamic> firestoreData,
  DataTypeProductosStruct? dataTypeProductos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeProductos == null) {
    return;
  }
  if (dataTypeProductos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataTypeProductos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeProductosData =
      getDataTypeProductosFirestoreData(dataTypeProductos, forFieldValue);
  final nestedData =
      dataTypeProductosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataTypeProductos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeProductosFirestoreData(
  DataTypeProductosStruct? dataTypeProductos, [
  bool forFieldValue = false,
]) {
  if (dataTypeProductos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeProductos.toMap());

  // Add any Firestore field values
  dataTypeProductos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeProductosListFirestoreData(
  List<DataTypeProductosStruct>? dataTypeProductoss,
) =>
    dataTypeProductoss
        ?.map((e) => getDataTypeProductosFirestoreData(e, true))
        .toList() ??
    [];
