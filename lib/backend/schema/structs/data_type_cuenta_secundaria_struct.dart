// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataTypeCuentaSecundariaStruct extends FFFirebaseStruct {
  DataTypeCuentaSecundariaStruct({
    String? numCuentaSec,
    String? cuentaDeBancoSecName,
    String? tipoDeCuentaSec,
    String? nombreTitularBancoSec,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _numCuentaSec = numCuentaSec,
        _cuentaDeBancoSecName = cuentaDeBancoSecName,
        _tipoDeCuentaSec = tipoDeCuentaSec,
        _nombreTitularBancoSec = nombreTitularBancoSec,
        super(firestoreUtilData);

  // "numCuentaSec" field.
  String? _numCuentaSec;
  String get numCuentaSec => _numCuentaSec ?? '';
  set numCuentaSec(String? val) => _numCuentaSec = val;

  bool hasNumCuentaSec() => _numCuentaSec != null;

  // "cuentaDeBancoSecName" field.
  String? _cuentaDeBancoSecName;
  String get cuentaDeBancoSecName => _cuentaDeBancoSecName ?? '';
  set cuentaDeBancoSecName(String? val) => _cuentaDeBancoSecName = val;

  bool hasCuentaDeBancoSecName() => _cuentaDeBancoSecName != null;

  // "tipoDeCuentaSec" field.
  String? _tipoDeCuentaSec;
  String get tipoDeCuentaSec => _tipoDeCuentaSec ?? '';
  set tipoDeCuentaSec(String? val) => _tipoDeCuentaSec = val;

  bool hasTipoDeCuentaSec() => _tipoDeCuentaSec != null;

  // "nombreTitularBancoSec" field.
  String? _nombreTitularBancoSec;
  String get nombreTitularBancoSec => _nombreTitularBancoSec ?? '';
  set nombreTitularBancoSec(String? val) => _nombreTitularBancoSec = val;

  bool hasNombreTitularBancoSec() => _nombreTitularBancoSec != null;

  static DataTypeCuentaSecundariaStruct fromMap(Map<String, dynamic> data) =>
      DataTypeCuentaSecundariaStruct(
        numCuentaSec: data['numCuentaSec'] as String?,
        cuentaDeBancoSecName: data['cuentaDeBancoSecName'] as String?,
        tipoDeCuentaSec: data['tipoDeCuentaSec'] as String?,
        nombreTitularBancoSec: data['nombreTitularBancoSec'] as String?,
      );

  static DataTypeCuentaSecundariaStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? DataTypeCuentaSecundariaStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'numCuentaSec': _numCuentaSec,
        'cuentaDeBancoSecName': _cuentaDeBancoSecName,
        'tipoDeCuentaSec': _tipoDeCuentaSec,
        'nombreTitularBancoSec': _nombreTitularBancoSec,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'numCuentaSec': serializeParam(
          _numCuentaSec,
          ParamType.String,
        ),
        'cuentaDeBancoSecName': serializeParam(
          _cuentaDeBancoSecName,
          ParamType.String,
        ),
        'tipoDeCuentaSec': serializeParam(
          _tipoDeCuentaSec,
          ParamType.String,
        ),
        'nombreTitularBancoSec': serializeParam(
          _nombreTitularBancoSec,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataTypeCuentaSecundariaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeCuentaSecundariaStruct(
        numCuentaSec: deserializeParam(
          data['numCuentaSec'],
          ParamType.String,
          false,
        ),
        cuentaDeBancoSecName: deserializeParam(
          data['cuentaDeBancoSecName'],
          ParamType.String,
          false,
        ),
        tipoDeCuentaSec: deserializeParam(
          data['tipoDeCuentaSec'],
          ParamType.String,
          false,
        ),
        nombreTitularBancoSec: deserializeParam(
          data['nombreTitularBancoSec'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataTypeCuentaSecundariaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypeCuentaSecundariaStruct &&
        numCuentaSec == other.numCuentaSec &&
        cuentaDeBancoSecName == other.cuentaDeBancoSecName &&
        tipoDeCuentaSec == other.tipoDeCuentaSec &&
        nombreTitularBancoSec == other.nombreTitularBancoSec;
  }

  @override
  int get hashCode => const ListEquality().hash([
        numCuentaSec,
        cuentaDeBancoSecName,
        tipoDeCuentaSec,
        nombreTitularBancoSec
      ]);
}

DataTypeCuentaSecundariaStruct createDataTypeCuentaSecundariaStruct({
  String? numCuentaSec,
  String? cuentaDeBancoSecName,
  String? tipoDeCuentaSec,
  String? nombreTitularBancoSec,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeCuentaSecundariaStruct(
      numCuentaSec: numCuentaSec,
      cuentaDeBancoSecName: cuentaDeBancoSecName,
      tipoDeCuentaSec: tipoDeCuentaSec,
      nombreTitularBancoSec: nombreTitularBancoSec,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeCuentaSecundariaStruct? updateDataTypeCuentaSecundariaStruct(
  DataTypeCuentaSecundariaStruct? dataTypeCuentaSecundaria, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeCuentaSecundaria
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeCuentaSecundariaStructData(
  Map<String, dynamic> firestoreData,
  DataTypeCuentaSecundariaStruct? dataTypeCuentaSecundaria,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeCuentaSecundaria == null) {
    return;
  }
  if (dataTypeCuentaSecundaria.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      dataTypeCuentaSecundaria.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeCuentaSecundariaData = getDataTypeCuentaSecundariaFirestoreData(
      dataTypeCuentaSecundaria, forFieldValue);
  final nestedData =
      dataTypeCuentaSecundariaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dataTypeCuentaSecundaria.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeCuentaSecundariaFirestoreData(
  DataTypeCuentaSecundariaStruct? dataTypeCuentaSecundaria, [
  bool forFieldValue = false,
]) {
  if (dataTypeCuentaSecundaria == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeCuentaSecundaria.toMap());

  // Add any Firestore field values
  dataTypeCuentaSecundaria.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeCuentaSecundariaListFirestoreData(
  List<DataTypeCuentaSecundariaStruct>? dataTypeCuentaSecundarias,
) =>
    dataTypeCuentaSecundarias
        ?.map((e) => getDataTypeCuentaSecundariaFirestoreData(e, true))
        .toList() ??
    [];
