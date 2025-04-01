// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypeHistorialPagoStruct extends FFFirebaseStruct {
  DataTypeHistorialPagoStruct({
    DateTime? fechaPago,
    List<DataTypeProductosStruct>? productos,
    double? totalPagado,
    bool? transferencia,
    bool? efectivo,
    double? totalGeneral,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fechaPago = fechaPago,
        _productos = productos,
        _totalPagado = totalPagado,
        _transferencia = transferencia,
        _efectivo = efectivo,
        _totalGeneral = totalGeneral,
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

  static DataTypeHistorialPagoStruct fromMap(Map<String, dynamic> data) =>
      DataTypeHistorialPagoStruct(
        fechaPago: data['fechaPago'] as DateTime?,
        productos: getStructList(
          data['productos'],
          DataTypeProductosStruct.fromMap,
        ),
        totalPagado: castToType<double>(data['totalPagado']),
        transferencia: data['transferencia'] as bool?,
        efectivo: data['efectivo'] as bool?,
        totalGeneral: castToType<double>(data['totalGeneral']),
      );

  static DataTypeHistorialPagoStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeHistorialPagoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fechaPago': _fechaPago,
        'productos': _productos?.map((e) => e.toMap()).toList(),
        'totalPagado': _totalPagado,
        'transferencia': _transferencia,
        'efectivo': _efectivo,
        'totalGeneral': _totalGeneral,
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
      }.withoutNulls;

  static DataTypeHistorialPagoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypeHistorialPagoStruct(
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
      );

  @override
  String toString() => 'DataTypeHistorialPagoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataTypeHistorialPagoStruct &&
        fechaPago == other.fechaPago &&
        listEquality.equals(productos, other.productos) &&
        totalPagado == other.totalPagado &&
        transferencia == other.transferencia &&
        efectivo == other.efectivo &&
        totalGeneral == other.totalGeneral;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fechaPago,
        productos,
        totalPagado,
        transferencia,
        efectivo,
        totalGeneral
      ]);
}

DataTypeHistorialPagoStruct createDataTypeHistorialPagoStruct({
  DateTime? fechaPago,
  double? totalPagado,
  bool? transferencia,
  bool? efectivo,
  double? totalGeneral,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeHistorialPagoStruct(
      fechaPago: fechaPago,
      totalPagado: totalPagado,
      transferencia: transferencia,
      efectivo: efectivo,
      totalGeneral: totalGeneral,
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
