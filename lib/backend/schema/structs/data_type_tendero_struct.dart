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
    String? pin,
    String? numCuenta,
    String? cuentaDeBancoName,
    String? tipoDeCuenta,
    String? nombreTendero,
    String? nombreTitularBanco,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mail = mail,
        _pw = pw,
        _nombreTienda = nombreTienda,
        _idTendero = idTendero,
        _pin = pin,
        _numCuenta = numCuenta,
        _cuentaDeBancoName = cuentaDeBancoName,
        _tipoDeCuenta = tipoDeCuenta,
        _nombreTendero = nombreTendero,
        _nombreTitularBanco = nombreTitularBanco,
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

  // "pin" field.
  String? _pin;
  String get pin => _pin ?? '';
  set pin(String? val) => _pin = val;

  bool hasPin() => _pin != null;

  // "numCuenta" field.
  String? _numCuenta;
  String get numCuenta => _numCuenta ?? '';
  set numCuenta(String? val) => _numCuenta = val;

  bool hasNumCuenta() => _numCuenta != null;

  // "cuentaDeBancoName" field.
  String? _cuentaDeBancoName;
  String get cuentaDeBancoName => _cuentaDeBancoName ?? '';
  set cuentaDeBancoName(String? val) => _cuentaDeBancoName = val;

  bool hasCuentaDeBancoName() => _cuentaDeBancoName != null;

  // "tipoDeCuenta" field.
  String? _tipoDeCuenta;
  String get tipoDeCuenta => _tipoDeCuenta ?? '';
  set tipoDeCuenta(String? val) => _tipoDeCuenta = val;

  bool hasTipoDeCuenta() => _tipoDeCuenta != null;

  // "nombreTendero" field.
  String? _nombreTendero;
  String get nombreTendero => _nombreTendero ?? '';
  set nombreTendero(String? val) => _nombreTendero = val;

  bool hasNombreTendero() => _nombreTendero != null;

  // "nombreTitularBanco" field.
  String? _nombreTitularBanco;
  String get nombreTitularBanco => _nombreTitularBanco ?? '';
  set nombreTitularBanco(String? val) => _nombreTitularBanco = val;

  bool hasNombreTitularBanco() => _nombreTitularBanco != null;

  static DataTypeTenderoStruct fromMap(Map<String, dynamic> data) =>
      DataTypeTenderoStruct(
        mail: data['mail'] as String?,
        pw: data['pw'] as String?,
        nombreTienda: data['nombreTienda'] as String?,
        idTendero: data['idTendero'] as DocumentReference?,
        pin: data['pin'] as String?,
        numCuenta: data['numCuenta'] as String?,
        cuentaDeBancoName: data['cuentaDeBancoName'] as String?,
        tipoDeCuenta: data['tipoDeCuenta'] as String?,
        nombreTendero: data['nombreTendero'] as String?,
        nombreTitularBanco: data['nombreTitularBanco'] as String?,
      );

  static DataTypeTenderoStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeTenderoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mail': _mail,
        'pw': _pw,
        'nombreTienda': _nombreTienda,
        'idTendero': _idTendero,
        'pin': _pin,
        'numCuenta': _numCuenta,
        'cuentaDeBancoName': _cuentaDeBancoName,
        'tipoDeCuenta': _tipoDeCuenta,
        'nombreTendero': _nombreTendero,
        'nombreTitularBanco': _nombreTitularBanco,
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
        'pin': serializeParam(
          _pin,
          ParamType.String,
        ),
        'numCuenta': serializeParam(
          _numCuenta,
          ParamType.String,
        ),
        'cuentaDeBancoName': serializeParam(
          _cuentaDeBancoName,
          ParamType.String,
        ),
        'tipoDeCuenta': serializeParam(
          _tipoDeCuenta,
          ParamType.String,
        ),
        'nombreTendero': serializeParam(
          _nombreTendero,
          ParamType.String,
        ),
        'nombreTitularBanco': serializeParam(
          _nombreTitularBanco,
          ParamType.String,
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
        pin: deserializeParam(
          data['pin'],
          ParamType.String,
          false,
        ),
        numCuenta: deserializeParam(
          data['numCuenta'],
          ParamType.String,
          false,
        ),
        cuentaDeBancoName: deserializeParam(
          data['cuentaDeBancoName'],
          ParamType.String,
          false,
        ),
        tipoDeCuenta: deserializeParam(
          data['tipoDeCuenta'],
          ParamType.String,
          false,
        ),
        nombreTendero: deserializeParam(
          data['nombreTendero'],
          ParamType.String,
          false,
        ),
        nombreTitularBanco: deserializeParam(
          data['nombreTitularBanco'],
          ParamType.String,
          false,
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
        idTendero == other.idTendero &&
        pin == other.pin &&
        numCuenta == other.numCuenta &&
        cuentaDeBancoName == other.cuentaDeBancoName &&
        tipoDeCuenta == other.tipoDeCuenta &&
        nombreTendero == other.nombreTendero &&
        nombreTitularBanco == other.nombreTitularBanco;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mail,
        pw,
        nombreTienda,
        idTendero,
        pin,
        numCuenta,
        cuentaDeBancoName,
        tipoDeCuenta,
        nombreTendero,
        nombreTitularBanco
      ]);
}

DataTypeTenderoStruct createDataTypeTenderoStruct({
  String? mail,
  String? pw,
  String? nombreTienda,
  DocumentReference? idTendero,
  String? pin,
  String? numCuenta,
  String? cuentaDeBancoName,
  String? tipoDeCuenta,
  String? nombreTendero,
  String? nombreTitularBanco,
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
      pin: pin,
      numCuenta: numCuenta,
      cuentaDeBancoName: cuentaDeBancoName,
      tipoDeCuenta: tipoDeCuenta,
      nombreTendero: nombreTendero,
      nombreTitularBanco: nombreTitularBanco,
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
