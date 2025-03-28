// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataTypeTenderoStruct extends FFFirebaseStruct {
  DataTypeTenderoStruct({
    String? mail,
    String? pw,
    String? nombreTienda,
    DocumentReference? idTendero,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mail = mail,
        _pw = pw,
        _nombreTienda = nombreTienda,
        _idTendero = idTendero,
        super(firestoreUtilData);

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  set mail(String? val) => _mail = val;

  bool hasMail() => _mail != null;

  // "pw" field.
  String? _pw;
  String get pw => _pw ?? '';
  set pw(String? val) => _pw = val;

  bool hasPw() => _pw != null;

  // "nombreTienda" field.
  String? _nombreTienda;
  String get nombreTienda => _nombreTienda ?? '';
  set nombreTienda(String? val) => _nombreTienda = val;

  bool hasNombreTienda() => _nombreTienda != null;

  // "idTendero" field.
  DocumentReference? _idTendero;
  DocumentReference? get idTendero => _idTendero;
  set idTendero(DocumentReference? val) => _idTendero = val;

  bool hasIdTendero() => _idTendero != null;

  static DataTypeTenderoStruct fromMap(Map<String, dynamic> data) =>
      DataTypeTenderoStruct(
        mail: data['mail'] as String?,
        pw: data['pw'] as String?,
        nombreTienda: data['nombreTienda'] as String?,
        idTendero: data['idTendero'] as DocumentReference?,
      );

  static DataTypeTenderoStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeTenderoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mail': _mail,
        'pw': _pw,
        'nombreTienda': _nombreTienda,
        'idTendero': _idTendero,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mail': serializeParam(
          _mail,
          ParamType.String,
        ),
        'pw': serializeParam(
          _pw,
          ParamType.String,
        ),
        'nombreTienda': serializeParam(
          _nombreTienda,
          ParamType.String,
        ),
        'idTendero': serializeParam(
          _idTendero,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DataTypeTenderoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataTypeTenderoStruct(
        mail: deserializeParam(
          data['mail'],
          ParamType.String,
          false,
        ),
        pw: deserializeParam(
          data['pw'],
          ParamType.String,
          false,
        ),
        nombreTienda: deserializeParam(
          data['nombreTienda'],
          ParamType.String,
          false,
        ),
        idTendero: deserializeParam(
          data['idTendero'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tenderos'],
        ),
      );

  @override
  String toString() => 'DataTypeTenderoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypeTenderoStruct &&
        mail == other.mail &&
        pw == other.pw &&
        nombreTienda == other.nombreTienda &&
        idTendero == other.idTendero;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([mail, pw, nombreTienda, idTendero]);
}

DataTypeTenderoStruct createDataTypeTenderoStruct({
  String? mail,
  String? pw,
  String? nombreTienda,
  DocumentReference? idTendero,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeTenderoStruct(
      mail: mail,
      pw: pw,
      nombreTienda: nombreTienda,
      idTendero: idTendero,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeTenderoStruct? updateDataTypeTenderoStruct(
  DataTypeTenderoStruct? dataTypeTendero, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeTendero
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeTenderoStructData(
  Map<String, dynamic> firestoreData,
  DataTypeTenderoStruct? dataTypeTendero,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeTendero == null) {
    return;
  }
  if (dataTypeTendero.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataTypeTendero.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeTenderoData =
      getDataTypeTenderoFirestoreData(dataTypeTendero, forFieldValue);
  final nestedData =
      dataTypeTenderoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataTypeTendero.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeTenderoFirestoreData(
  DataTypeTenderoStruct? dataTypeTendero, [
  bool forFieldValue = false,
]) {
  if (dataTypeTendero == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeTendero.toMap());

  // Add any Firestore field values
  dataTypeTendero.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeTenderoListFirestoreData(
  List<DataTypeTenderoStruct>? dataTypeTenderos,
) =>
    dataTypeTenderos
        ?.map((e) => getDataTypeTenderoFirestoreData(e, true))
        .toList() ??
    [];
