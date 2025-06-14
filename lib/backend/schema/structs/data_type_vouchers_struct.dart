// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypeVouchersStruct extends FFFirebaseStruct {
  DataTypeVouchersStruct({
    String? imgVoucher,
    String? idTransaccion,
    DocumentReference? idCliente,
    DataTypeHistorialPagoStruct? historialPagoParaEliminar,
    DateTime? fechaDeFio,
    String? estadoVoucher,
    String? tipoVoucher,
    double? montoAPagar,
    bool? isFullPago,
    String? razonDenegado,
    int? numVoucher,
    String? nombreBanco,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imgVoucher = imgVoucher,
        _idTransaccion = idTransaccion,
        _idCliente = idCliente,
        _historialPagoParaEliminar = historialPagoParaEliminar,
        _fechaDeFio = fechaDeFio,
        _estadoVoucher = estadoVoucher,
        _tipoVoucher = tipoVoucher,
        _montoAPagar = montoAPagar,
        _isFullPago = isFullPago,
        _razonDenegado = razonDenegado,
        _numVoucher = numVoucher,
        _nombreBanco = nombreBanco,
        super(firestoreUtilData);

  // "imgVoucher" field.
  String? _imgVoucher;
  String get imgVoucher => _imgVoucher ?? '';
  set imgVoucher(String? val) => _imgVoucher = val;

  bool hasImgVoucher() => _imgVoucher != null;

  // "idTransaccion" field.
  String? _idTransaccion;
  String get idTransaccion => _idTransaccion ?? '';
  set idTransaccion(String? val) => _idTransaccion = val;

  bool hasIdTransaccion() => _idTransaccion != null;

  // "idCliente" field.
  DocumentReference? _idCliente;
  DocumentReference? get idCliente => _idCliente;
  set idCliente(DocumentReference? val) => _idCliente = val;

  bool hasIdCliente() => _idCliente != null;

  // "HistorialPagoParaEliminar" field.
  DataTypeHistorialPagoStruct? _historialPagoParaEliminar;
  DataTypeHistorialPagoStruct get historialPagoParaEliminar =>
      _historialPagoParaEliminar ?? DataTypeHistorialPagoStruct();
  set historialPagoParaEliminar(DataTypeHistorialPagoStruct? val) =>
      _historialPagoParaEliminar = val;

  void updateHistorialPagoParaEliminar(
      Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(_historialPagoParaEliminar ??= DataTypeHistorialPagoStruct());
  }

  bool hasHistorialPagoParaEliminar() => _historialPagoParaEliminar != null;

  // "fechaDeFio" field.
  DateTime? _fechaDeFio;
  DateTime? get fechaDeFio => _fechaDeFio;
  set fechaDeFio(DateTime? val) => _fechaDeFio = val;

  bool hasFechaDeFio() => _fechaDeFio != null;

  // "estadoVoucher" field.
  String? _estadoVoucher;
  String get estadoVoucher => _estadoVoucher ?? '';
  set estadoVoucher(String? val) => _estadoVoucher = val;

  bool hasEstadoVoucher() => _estadoVoucher != null;

  // "tipoVoucher" field.
  String? _tipoVoucher;
  String get tipoVoucher => _tipoVoucher ?? '';
  set tipoVoucher(String? val) => _tipoVoucher = val;

  bool hasTipoVoucher() => _tipoVoucher != null;

  // "montoAPagar" field.
  double? _montoAPagar;
  double get montoAPagar => _montoAPagar ?? 0.0;
  set montoAPagar(double? val) => _montoAPagar = val;

  void incrementMontoAPagar(double amount) =>
      montoAPagar = montoAPagar + amount;

  bool hasMontoAPagar() => _montoAPagar != null;

  // "isFullPago" field.
  bool? _isFullPago;
  bool get isFullPago => _isFullPago ?? false;
  set isFullPago(bool? val) => _isFullPago = val;

  bool hasIsFullPago() => _isFullPago != null;

  // "razonDenegado" field.
  String? _razonDenegado;
  String get razonDenegado => _razonDenegado ?? '';
  set razonDenegado(String? val) => _razonDenegado = val;

  bool hasRazonDenegado() => _razonDenegado != null;

  // "numVoucher" field.
  int? _numVoucher;
  int get numVoucher => _numVoucher ?? 0;
  set numVoucher(int? val) => _numVoucher = val;

  void incrementNumVoucher(int amount) => numVoucher = numVoucher + amount;

  bool hasNumVoucher() => _numVoucher != null;

  // "nombreBanco" field.
  String? _nombreBanco;
  String get nombreBanco => _nombreBanco ?? '';
  set nombreBanco(String? val) => _nombreBanco = val;

  bool hasNombreBanco() => _nombreBanco != null;

  static DataTypeVouchersStruct fromMap(Map<String, dynamic> data) =>
      DataTypeVouchersStruct(
        imgVoucher: data['imgVoucher'] as String?,
        idTransaccion: data['idTransaccion'] as String?,
        idCliente: data['idCliente'] as DocumentReference?,
        historialPagoParaEliminar:
            data['HistorialPagoParaEliminar'] is DataTypeHistorialPagoStruct
                ? data['HistorialPagoParaEliminar']
                : DataTypeHistorialPagoStruct.maybeFromMap(
                    data['HistorialPagoParaEliminar']),
        fechaDeFio: data['fechaDeFio'] as DateTime?,
        estadoVoucher: data['estadoVoucher'] as String?,
        tipoVoucher: data['tipoVoucher'] as String?,
        montoAPagar: castToType<double>(data['montoAPagar']),
        isFullPago: data['isFullPago'] as bool?,
        razonDenegado: data['razonDenegado'] as String?,
        numVoucher: castToType<int>(data['numVoucher']),
        nombreBanco: data['nombreBanco'] as String?,
      );

  static DataTypeVouchersStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeVouchersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imgVoucher': _imgVoucher,
        'idTransaccion': _idTransaccion,
        'idCliente': _idCliente,
        'HistorialPagoParaEliminar': _historialPagoParaEliminar?.toMap(),
        'fechaDeFio': _fechaDeFio,
        'estadoVoucher': _estadoVoucher,
        'tipoVoucher': _tipoVoucher,
        'montoAPagar': _montoAPagar,
        'isFullPago': _isFullPago,
        'razonDenegado': _razonDenegado,
        'numVoucher': _numVoucher,
        'nombreBanco': _nombreBanco,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imgVoucher': serializeParam(
          _imgVoucher,
          ParamType.String,
        ),
        'idTransaccion': serializeParam(
          _idTransaccion,
          ParamType.String,
        ),
        'idCliente': serializeParam(
          _idCliente,
          ParamType.DocumentReference,
        ),
        'HistorialPagoParaEliminar': serializeParam(
          _historialPagoParaEliminar,
          ParamType.DataStruct,
        ),
        'fechaDeFio': serializeParam(
          _fechaDeFio,
          ParamType.DateTime,
        ),
        'estadoVoucher': serializeParam(
          _estadoVoucher,
          ParamType.String,
        ),
        'tipoVoucher': serializeParam(
          _tipoVoucher,
          ParamType.String,
        ),
        'montoAPagar': serializeParam(
          _montoAPagar,
          ParamType.double,
        ),
        'isFullPago': serializeParam(
          _isFullPago,
          ParamType.bool,
        ),
        'razonDenegado': serializeParam(
          _razonDenegado,
          ParamType.String,
        ),
        'numVoucher': serializeParam(
          _numVoucher,
          ParamType.int,
        ),
        'nombreBanco': serializeParam(
          _nombreBanco,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataTypeVouchersStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeVouchersStruct(
        imgVoucher: deserializeParam(
          data['imgVoucher'],
          ParamType.String,
          false,
        ),
        idTransaccion: deserializeParam(
          data['idTransaccion'],
          ParamType.String,
          false,
        ),
        idCliente: deserializeParam(
          data['idCliente'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['clientes'],
        ),
        historialPagoParaEliminar: deserializeStructParam(
          data['HistorialPagoParaEliminar'],
          ParamType.DataStruct,
          false,
          structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
        ),
        fechaDeFio: deserializeParam(
          data['fechaDeFio'],
          ParamType.DateTime,
          false,
        ),
        estadoVoucher: deserializeParam(
          data['estadoVoucher'],
          ParamType.String,
          false,
        ),
        tipoVoucher: deserializeParam(
          data['tipoVoucher'],
          ParamType.String,
          false,
        ),
        montoAPagar: deserializeParam(
          data['montoAPagar'],
          ParamType.double,
          false,
        ),
        isFullPago: deserializeParam(
          data['isFullPago'],
          ParamType.bool,
          false,
        ),
        razonDenegado: deserializeParam(
          data['razonDenegado'],
          ParamType.String,
          false,
        ),
        numVoucher: deserializeParam(
          data['numVoucher'],
          ParamType.int,
          false,
        ),
        nombreBanco: deserializeParam(
          data['nombreBanco'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataTypeVouchersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypeVouchersStruct &&
        imgVoucher == other.imgVoucher &&
        idTransaccion == other.idTransaccion &&
        idCliente == other.idCliente &&
        historialPagoParaEliminar == other.historialPagoParaEliminar &&
        fechaDeFio == other.fechaDeFio &&
        estadoVoucher == other.estadoVoucher &&
        tipoVoucher == other.tipoVoucher &&
        montoAPagar == other.montoAPagar &&
        isFullPago == other.isFullPago &&
        razonDenegado == other.razonDenegado &&
        numVoucher == other.numVoucher &&
        nombreBanco == other.nombreBanco;
  }

  @override
  int get hashCode => const ListEquality().hash([
        imgVoucher,
        idTransaccion,
        idCliente,
        historialPagoParaEliminar,
        fechaDeFio,
        estadoVoucher,
        tipoVoucher,
        montoAPagar,
        isFullPago,
        razonDenegado,
        numVoucher,
        nombreBanco
      ]);
}

DataTypeVouchersStruct createDataTypeVouchersStruct({
  String? imgVoucher,
  String? idTransaccion,
  DocumentReference? idCliente,
  DataTypeHistorialPagoStruct? historialPagoParaEliminar,
  DateTime? fechaDeFio,
  String? estadoVoucher,
  String? tipoVoucher,
  double? montoAPagar,
  bool? isFullPago,
  String? razonDenegado,
  int? numVoucher,
  String? nombreBanco,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeVouchersStruct(
      imgVoucher: imgVoucher,
      idTransaccion: idTransaccion,
      idCliente: idCliente,
      historialPagoParaEliminar: historialPagoParaEliminar ??
          (clearUnsetFields ? DataTypeHistorialPagoStruct() : null),
      fechaDeFio: fechaDeFio,
      estadoVoucher: estadoVoucher,
      tipoVoucher: tipoVoucher,
      montoAPagar: montoAPagar,
      isFullPago: isFullPago,
      razonDenegado: razonDenegado,
      numVoucher: numVoucher,
      nombreBanco: nombreBanco,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeVouchersStruct? updateDataTypeVouchersStruct(
  DataTypeVouchersStruct? dataTypeVouchers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeVouchers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeVouchersStructData(
  Map<String, dynamic> firestoreData,
  DataTypeVouchersStruct? dataTypeVouchers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeVouchers == null) {
    return;
  }
  if (dataTypeVouchers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataTypeVouchers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeVouchersData =
      getDataTypeVouchersFirestoreData(dataTypeVouchers, forFieldValue);
  final nestedData =
      dataTypeVouchersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataTypeVouchers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeVouchersFirestoreData(
  DataTypeVouchersStruct? dataTypeVouchers, [
  bool forFieldValue = false,
]) {
  if (dataTypeVouchers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeVouchers.toMap());

  // Handle nested data for "HistorialPagoParaEliminar" field.
  addDataTypeHistorialPagoStructData(
    firestoreData,
    dataTypeVouchers.hasHistorialPagoParaEliminar()
        ? dataTypeVouchers.historialPagoParaEliminar
        : null,
    'HistorialPagoParaEliminar',
    forFieldValue,
  );

  // Add any Firestore field values
  dataTypeVouchers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeVouchersListFirestoreData(
  List<DataTypeVouchersStruct>? dataTypeVoucherss,
) =>
    dataTypeVoucherss
        ?.map((e) => getDataTypeVouchersFirestoreData(e, true))
        .toList() ??
    [];
