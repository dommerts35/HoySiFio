// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypeHistorialPagoStruct extends FFFirebaseStruct {
  DataTypeHistorialPagoStruct({
    List<DataTypeProductosStruct>? productos,
    double? totalPagado,
    double? totalPorPagar,
    bool? transferencia,
    bool? efectivo,
    double? totalGeneral,
    String? idTransaccion,
    DateTime? fechaDeFio,
    int? numVoucher,
    bool? isVoucherSent,
    DateTime? fechaDeCobro,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productos = productos,
        _totalPagado = totalPagado,
        _totalPorPagar = totalPorPagar,
        _transferencia = transferencia,
        _efectivo = efectivo,
        _totalGeneral = totalGeneral,
        _idTransaccion = idTransaccion,
        _fechaDeFio = fechaDeFio,
        _numVoucher = numVoucher,
        _isVoucherSent = isVoucherSent,
        _fechaDeCobro = fechaDeCobro,
        super(firestoreUtilData);

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

  // "totalPorPagar" field.
  double? _totalPorPagar;
  double get totalPorPagar => _totalPorPagar ?? 0.0;
  set totalPorPagar(double? val) => _totalPorPagar = val;

  void incrementTotalPorPagar(double amount) =>
      totalPorPagar = totalPorPagar + amount;

  bool hasTotalPorPagar() => _totalPorPagar != null;

  // "transferencia" field.
  bool? _transferencia;
  bool get transferencia => _transferencia ?? false;
  set transferencia(bool? val) => _transferencia = val;

  bool hasTransferencia() => _transferencia != null;

  // "efectivo" field.
  bool? _efectivo;
  bool get efectivo => _efectivo ?? false;
  set efectivo(bool? val) => _efectivo = val;

  bool hasEfectivo() => _efectivo != null;

  // "totalGeneral" field.
  double? _totalGeneral;
  double get totalGeneral => _totalGeneral ?? 0.0;
  set totalGeneral(double? val) => _totalGeneral = val;

  void incrementTotalGeneral(double amount) =>
      totalGeneral = totalGeneral + amount;

  bool hasTotalGeneral() => _totalGeneral != null;

  // "idTransaccion" field.
  String? _idTransaccion;
  String get idTransaccion => _idTransaccion ?? '';
  set idTransaccion(String? val) => _idTransaccion = val;

  bool hasIdTransaccion() => _idTransaccion != null;

  // "fechaDeFio" field.
  DateTime? _fechaDeFio;
  DateTime? get fechaDeFio => _fechaDeFio;
  set fechaDeFio(DateTime? val) => _fechaDeFio = val;

  bool hasFechaDeFio() => _fechaDeFio != null;

  // "numVoucher" field.
  int? _numVoucher;
  int get numVoucher => _numVoucher ?? 0;
  set numVoucher(int? val) => _numVoucher = val;

  void incrementNumVoucher(int amount) => numVoucher = numVoucher + amount;

  bool hasNumVoucher() => _numVoucher != null;

  // "isVoucherSent" field.
  bool? _isVoucherSent;
  bool get isVoucherSent => _isVoucherSent ?? false;
  set isVoucherSent(bool? val) => _isVoucherSent = val;

  bool hasIsVoucherSent() => _isVoucherSent != null;

  // "fechaDeCobro" field.
  DateTime? _fechaDeCobro;
  DateTime? get fechaDeCobro => _fechaDeCobro;
  set fechaDeCobro(DateTime? val) => _fechaDeCobro = val;

  bool hasFechaDeCobro() => _fechaDeCobro != null;

  static DataTypeHistorialPagoStruct fromMap(Map<String, dynamic> data) =>
      DataTypeHistorialPagoStruct(
        productos: getStructList(
          data['productos'],
          DataTypeProductosStruct.fromMap,
        ),
        totalPagado: castToType<double>(data['totalPagado']),
        totalPorPagar: castToType<double>(data['totalPorPagar']),
        transferencia: data['transferencia'] as bool?,
        efectivo: data['efectivo'] as bool?,
        totalGeneral: castToType<double>(data['totalGeneral']),
        idTransaccion: data['idTransaccion'] as String?,
        fechaDeFio: data['fechaDeFio'] as DateTime?,
        numVoucher: castToType<int>(data['numVoucher']),
        isVoucherSent: data['isVoucherSent'] as bool?,
        fechaDeCobro: data['fechaDeCobro'] as DateTime?,
      );

  static DataTypeHistorialPagoStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeHistorialPagoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'productos': _productos?.map((e) => e.toMap()).toList(),
        'totalPagado': _totalPagado,
        'totalPorPagar': _totalPorPagar,
        'transferencia': _transferencia,
        'efectivo': _efectivo,
        'totalGeneral': _totalGeneral,
        'idTransaccion': _idTransaccion,
        'fechaDeFio': _fechaDeFio,
        'numVoucher': _numVoucher,
        'isVoucherSent': _isVoucherSent,
        'fechaDeCobro': _fechaDeCobro,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'productos': serializeParam(
          _productos,
          ParamType.DataStruct,
          isList: true,
        ),
        'totalPagado': serializeParam(
          _totalPagado,
          ParamType.double,
        ),
        'totalPorPagar': serializeParam(
          _totalPorPagar,
          ParamType.double,
        ),
        'transferencia': serializeParam(
          _transferencia,
          ParamType.bool,
        ),
        'efectivo': serializeParam(
          _efectivo,
          ParamType.bool,
        ),
        'totalGeneral': serializeParam(
          _totalGeneral,
          ParamType.double,
        ),
        'idTransaccion': serializeParam(
          _idTransaccion,
          ParamType.String,
        ),
        'fechaDeFio': serializeParam(
          _fechaDeFio,
          ParamType.DateTime,
        ),
        'numVoucher': serializeParam(
          _numVoucher,
          ParamType.int,
        ),
        'isVoucherSent': serializeParam(
          _isVoucherSent,
          ParamType.bool,
        ),
        'fechaDeCobro': serializeParam(
          _fechaDeCobro,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DataTypeHistorialPagoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeHistorialPagoStruct(
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
        totalPorPagar: deserializeParam(
          data['totalPorPagar'],
          ParamType.double,
          false,
        ),
        transferencia: deserializeParam(
          data['transferencia'],
          ParamType.bool,
          false,
        ),
        efectivo: deserializeParam(
          data['efectivo'],
          ParamType.bool,
          false,
        ),
        totalGeneral: deserializeParam(
          data['totalGeneral'],
          ParamType.double,
          false,
        ),
        idTransaccion: deserializeParam(
          data['idTransaccion'],
          ParamType.String,
          false,
        ),
        fechaDeFio: deserializeParam(
          data['fechaDeFio'],
          ParamType.DateTime,
          false,
        ),
        numVoucher: deserializeParam(
          data['numVoucher'],
          ParamType.int,
          false,
        ),
        isVoucherSent: deserializeParam(
          data['isVoucherSent'],
          ParamType.bool,
          false,
        ),
        fechaDeCobro: deserializeParam(
          data['fechaDeCobro'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DataTypeHistorialPagoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataTypeHistorialPagoStruct &&
        listEquality.equals(productos, other.productos) &&
        totalPagado == other.totalPagado &&
        totalPorPagar == other.totalPorPagar &&
        transferencia == other.transferencia &&
        efectivo == other.efectivo &&
        totalGeneral == other.totalGeneral &&
        idTransaccion == other.idTransaccion &&
        fechaDeFio == other.fechaDeFio &&
        numVoucher == other.numVoucher &&
        isVoucherSent == other.isVoucherSent &&
        fechaDeCobro == other.fechaDeCobro;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productos,
        totalPagado,
        totalPorPagar,
        transferencia,
        efectivo,
        totalGeneral,
        idTransaccion,
        fechaDeFio,
        numVoucher,
        isVoucherSent,
        fechaDeCobro
      ]);
}

DataTypeHistorialPagoStruct createDataTypeHistorialPagoStruct({
  double? totalPagado,
  double? totalPorPagar,
  bool? transferencia,
  bool? efectivo,
  double? totalGeneral,
  String? idTransaccion,
  DateTime? fechaDeFio,
  int? numVoucher,
  bool? isVoucherSent,
  DateTime? fechaDeCobro,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeHistorialPagoStruct(
      totalPagado: totalPagado,
      totalPorPagar: totalPorPagar,
      transferencia: transferencia,
      efectivo: efectivo,
      totalGeneral: totalGeneral,
      idTransaccion: idTransaccion,
      fechaDeFio: fechaDeFio,
      numVoucher: numVoucher,
      isVoucherSent: isVoucherSent,
      fechaDeCobro: fechaDeCobro,
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
