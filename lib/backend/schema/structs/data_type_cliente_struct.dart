// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypeClienteStruct extends FFFirebaseStruct {
  DataTypeClienteStruct({
    String? nombre,
    String? telf,
    bool? isFiando,

    /// apellido
    String? apellido,

    /// cedula
    int? cedula,

    /// direccion de casa
    String? direccionDomicilio,

    /// vivienda alquilada
    bool? viviendaAlq,

    /// vivienda propia
    bool? viviendaPropia,

    /// email
    String? emailCliente,
    DocumentReference? idCliente,
    DocumentReference? idTendero,
    double? total,
    List<DataTypeProductosStruct>? producto,
    List<DataTypeHistorialPagoStruct>? historialPagadosProd,
    List<DataTypeHistorialPagoStruct>? historialPorPagarProd,

    /// hora/dia de ultima actualizacion al datatype
    DateTime? lastUpdate,
    double? totalDeudaCompleta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _telf = telf,
        _isFiando = isFiando,
        _apellido = apellido,
        _cedula = cedula,
        _direccionDomicilio = direccionDomicilio,
        _viviendaAlq = viviendaAlq,
        _viviendaPropia = viviendaPropia,
        _emailCliente = emailCliente,
        _idCliente = idCliente,
        _idTendero = idTendero,
        _total = total,
        _producto = producto,
        _historialPagadosProd = historialPagadosProd,
        _historialPorPagarProd = historialPorPagarProd,
        _lastUpdate = lastUpdate,
        _totalDeudaCompleta = totalDeudaCompleta,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "telf" field.
  String? _telf;
  String get telf => _telf ?? '';
  set telf(String? val) => _telf = val;

  bool hasTelf() => _telf != null;

  // "isFiando" field.
  bool? _isFiando;
  bool get isFiando => _isFiando ?? false;
  set isFiando(bool? val) => _isFiando = val;

  bool hasIsFiando() => _isFiando != null;

  // "apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  set apellido(String? val) => _apellido = val;

  bool hasApellido() => _apellido != null;

  // "cedula" field.
  int? _cedula;
  int get cedula => _cedula ?? 0;
  set cedula(int? val) => _cedula = val;

  void incrementCedula(int amount) => cedula = cedula + amount;

  bool hasCedula() => _cedula != null;

  // "direccionDomicilio" field.
  String? _direccionDomicilio;
  String get direccionDomicilio => _direccionDomicilio ?? '';
  set direccionDomicilio(String? val) => _direccionDomicilio = val;

  bool hasDireccionDomicilio() => _direccionDomicilio != null;

  // "viviendaAlq" field.
  bool? _viviendaAlq;
  bool get viviendaAlq => _viviendaAlq ?? false;
  set viviendaAlq(bool? val) => _viviendaAlq = val;

  bool hasViviendaAlq() => _viviendaAlq != null;

  // "viviendaPropia" field.
  bool? _viviendaPropia;
  bool get viviendaPropia => _viviendaPropia ?? false;
  set viviendaPropia(bool? val) => _viviendaPropia = val;

  bool hasViviendaPropia() => _viviendaPropia != null;

  // "emailCliente" field.
  String? _emailCliente;
  String get emailCliente => _emailCliente ?? '';
  set emailCliente(String? val) => _emailCliente = val;

  bool hasEmailCliente() => _emailCliente != null;

  // "idCliente" field.
  DocumentReference? _idCliente;
  DocumentReference? get idCliente => _idCliente;
  set idCliente(DocumentReference? val) => _idCliente = val;

  bool hasIdCliente() => _idCliente != null;

  // "idTendero" field.
  DocumentReference? _idTendero;
  DocumentReference? get idTendero => _idTendero;
  set idTendero(DocumentReference? val) => _idTendero = val;

  bool hasIdTendero() => _idTendero != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "producto" field.
  List<DataTypeProductosStruct>? _producto;
  List<DataTypeProductosStruct> get producto => _producto ?? const [];
  set producto(List<DataTypeProductosStruct>? val) => _producto = val;

  void updateProducto(Function(List<DataTypeProductosStruct>) updateFn) {
    updateFn(_producto ??= []);
  }

  bool hasProducto() => _producto != null;

  // "historialPagadosProd" field.
  List<DataTypeHistorialPagoStruct>? _historialPagadosProd;
  List<DataTypeHistorialPagoStruct> get historialPagadosProd =>
      _historialPagadosProd ?? const [];
  set historialPagadosProd(List<DataTypeHistorialPagoStruct>? val) =>
      _historialPagadosProd = val;

  void updateHistorialPagadosProd(
      Function(List<DataTypeHistorialPagoStruct>) updateFn) {
    updateFn(_historialPagadosProd ??= []);
  }

  bool hasHistorialPagadosProd() => _historialPagadosProd != null;

  // "historialPorPagarProd" field.
  List<DataTypeHistorialPagoStruct>? _historialPorPagarProd;
  List<DataTypeHistorialPagoStruct> get historialPorPagarProd =>
      _historialPorPagarProd ?? const [];
  set historialPorPagarProd(List<DataTypeHistorialPagoStruct>? val) =>
      _historialPorPagarProd = val;

  void updateHistorialPorPagarProd(
      Function(List<DataTypeHistorialPagoStruct>) updateFn) {
    updateFn(_historialPorPagarProd ??= []);
  }

  bool hasHistorialPorPagarProd() => _historialPorPagarProd != null;

  // "lastUpdate" field.
  DateTime? _lastUpdate;
  DateTime? get lastUpdate => _lastUpdate;
  set lastUpdate(DateTime? val) => _lastUpdate = val;

  bool hasLastUpdate() => _lastUpdate != null;

  // "totalDeudaCompleta" field.
  double? _totalDeudaCompleta;
  double get totalDeudaCompleta => _totalDeudaCompleta ?? 0.0;
  set totalDeudaCompleta(double? val) => _totalDeudaCompleta = val;

  void incrementTotalDeudaCompleta(double amount) =>
      totalDeudaCompleta = totalDeudaCompleta + amount;

  bool hasTotalDeudaCompleta() => _totalDeudaCompleta != null;

  static DataTypeClienteStruct fromMap(Map<String, dynamic> data) =>
      DataTypeClienteStruct(
        nombre: data['nombre'] as String?,
        telf: data['telf'] as String?,
        isFiando: data['isFiando'] as bool?,
        apellido: data['apellido'] as String?,
        cedula: castToType<int>(data['cedula']),
        direccionDomicilio: data['direccionDomicilio'] as String?,
        viviendaAlq: data['viviendaAlq'] as bool?,
        viviendaPropia: data['viviendaPropia'] as bool?,
        emailCliente: data['emailCliente'] as String?,
        idCliente: data['idCliente'] as DocumentReference?,
        idTendero: data['idTendero'] as DocumentReference?,
        total: castToType<double>(data['total']),
        producto: getStructList(
          data['producto'],
          DataTypeProductosStruct.fromMap,
        ),
        historialPagadosProd: getStructList(
          data['historialPagadosProd'],
          DataTypeHistorialPagoStruct.fromMap,
        ),
        historialPorPagarProd: getStructList(
          data['historialPorPagarProd'],
          DataTypeHistorialPagoStruct.fromMap,
        ),
        lastUpdate: data['lastUpdate'] as DateTime?,
        totalDeudaCompleta: castToType<double>(data['totalDeudaCompleta']),
      );

  static DataTypeClienteStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypeClienteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'telf': _telf,
        'isFiando': _isFiando,
        'apellido': _apellido,
        'cedula': _cedula,
        'direccionDomicilio': _direccionDomicilio,
        'viviendaAlq': _viviendaAlq,
        'viviendaPropia': _viviendaPropia,
        'emailCliente': _emailCliente,
        'idCliente': _idCliente,
        'idTendero': _idTendero,
        'total': _total,
        'producto': _producto?.map((e) => e.toMap()).toList(),
        'historialPagadosProd':
            _historialPagadosProd?.map((e) => e.toMap()).toList(),
        'historialPorPagarProd':
            _historialPorPagarProd?.map((e) => e.toMap()).toList(),
        'lastUpdate': _lastUpdate,
        'totalDeudaCompleta': _totalDeudaCompleta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'telf': serializeParam(
          _telf,
          ParamType.String,
        ),
        'isFiando': serializeParam(
          _isFiando,
          ParamType.bool,
        ),
        'apellido': serializeParam(
          _apellido,
          ParamType.String,
        ),
        'cedula': serializeParam(
          _cedula,
          ParamType.int,
        ),
        'direccionDomicilio': serializeParam(
          _direccionDomicilio,
          ParamType.String,
        ),
        'viviendaAlq': serializeParam(
          _viviendaAlq,
          ParamType.bool,
        ),
        'viviendaPropia': serializeParam(
          _viviendaPropia,
          ParamType.bool,
        ),
        'emailCliente': serializeParam(
          _emailCliente,
          ParamType.String,
        ),
        'idCliente': serializeParam(
          _idCliente,
          ParamType.DocumentReference,
        ),
        'idTendero': serializeParam(
          _idTendero,
          ParamType.DocumentReference,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'producto': serializeParam(
          _producto,
          ParamType.DataStruct,
          isList: true,
        ),
        'historialPagadosProd': serializeParam(
          _historialPagadosProd,
          ParamType.DataStruct,
          isList: true,
        ),
        'historialPorPagarProd': serializeParam(
          _historialPorPagarProd,
          ParamType.DataStruct,
          isList: true,
        ),
        'lastUpdate': serializeParam(
          _lastUpdate,
          ParamType.DateTime,
        ),
        'totalDeudaCompleta': serializeParam(
          _totalDeudaCompleta,
          ParamType.double,
        ),
      }.withoutNulls;

  static DataTypeClienteStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataTypeClienteStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        telf: deserializeParam(
          data['telf'],
          ParamType.String,
          false,
        ),
        isFiando: deserializeParam(
          data['isFiando'],
          ParamType.bool,
          false,
        ),
        apellido: deserializeParam(
          data['apellido'],
          ParamType.String,
          false,
        ),
        cedula: deserializeParam(
          data['cedula'],
          ParamType.int,
          false,
        ),
        direccionDomicilio: deserializeParam(
          data['direccionDomicilio'],
          ParamType.String,
          false,
        ),
        viviendaAlq: deserializeParam(
          data['viviendaAlq'],
          ParamType.bool,
          false,
        ),
        viviendaPropia: deserializeParam(
          data['viviendaPropia'],
          ParamType.bool,
          false,
        ),
        emailCliente: deserializeParam(
          data['emailCliente'],
          ParamType.String,
          false,
        ),
        idCliente: deserializeParam(
          data['idCliente'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['clientes'],
        ),
        idTendero: deserializeParam(
          data['idTendero'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tenderos'],
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        producto: deserializeStructParam<DataTypeProductosStruct>(
          data['producto'],
          ParamType.DataStruct,
          true,
          structBuilder: DataTypeProductosStruct.fromSerializableMap,
        ),
        historialPagadosProd:
            deserializeStructParam<DataTypeHistorialPagoStruct>(
          data['historialPagadosProd'],
          ParamType.DataStruct,
          true,
          structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
        ),
        historialPorPagarProd:
            deserializeStructParam<DataTypeHistorialPagoStruct>(
          data['historialPorPagarProd'],
          ParamType.DataStruct,
          true,
          structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
        ),
        lastUpdate: deserializeParam(
          data['lastUpdate'],
          ParamType.DateTime,
          false,
        ),
        totalDeudaCompleta: deserializeParam(
          data['totalDeudaCompleta'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DataTypeClienteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataTypeClienteStruct &&
        nombre == other.nombre &&
        telf == other.telf &&
        isFiando == other.isFiando &&
        apellido == other.apellido &&
        cedula == other.cedula &&
        direccionDomicilio == other.direccionDomicilio &&
        viviendaAlq == other.viviendaAlq &&
        viviendaPropia == other.viviendaPropia &&
        emailCliente == other.emailCliente &&
        idCliente == other.idCliente &&
        idTendero == other.idTendero &&
        total == other.total &&
        listEquality.equals(producto, other.producto) &&
        listEquality.equals(historialPagadosProd, other.historialPagadosProd) &&
        listEquality.equals(
            historialPorPagarProd, other.historialPorPagarProd) &&
        lastUpdate == other.lastUpdate &&
        totalDeudaCompleta == other.totalDeudaCompleta;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nombre,
        telf,
        isFiando,
        apellido,
        cedula,
        direccionDomicilio,
        viviendaAlq,
        viviendaPropia,
        emailCliente,
        idCliente,
        idTendero,
        total,
        producto,
        historialPagadosProd,
        historialPorPagarProd,
        lastUpdate,
        totalDeudaCompleta
      ]);
}

DataTypeClienteStruct createDataTypeClienteStruct({
  String? nombre,
  String? telf,
  bool? isFiando,
  String? apellido,
  int? cedula,
  String? direccionDomicilio,
  bool? viviendaAlq,
  bool? viviendaPropia,
  String? emailCliente,
  DocumentReference? idCliente,
  DocumentReference? idTendero,
  double? total,
  DateTime? lastUpdate,
  double? totalDeudaCompleta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeClienteStruct(
      nombre: nombre,
      telf: telf,
      isFiando: isFiando,
      apellido: apellido,
      cedula: cedula,
      direccionDomicilio: direccionDomicilio,
      viviendaAlq: viviendaAlq,
      viviendaPropia: viviendaPropia,
      emailCliente: emailCliente,
      idCliente: idCliente,
      idTendero: idTendero,
      total: total,
      lastUpdate: lastUpdate,
      totalDeudaCompleta: totalDeudaCompleta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataTypeClienteStruct? updateDataTypeClienteStruct(
  DataTypeClienteStruct? dataTypeCliente, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataTypeCliente
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataTypeClienteStructData(
  Map<String, dynamic> firestoreData,
  DataTypeClienteStruct? dataTypeCliente,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeCliente == null) {
    return;
  }
  if (dataTypeCliente.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataTypeCliente.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataTypeClienteData =
      getDataTypeClienteFirestoreData(dataTypeCliente, forFieldValue);
  final nestedData =
      dataTypeClienteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataTypeCliente.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataTypeClienteFirestoreData(
  DataTypeClienteStruct? dataTypeCliente, [
  bool forFieldValue = false,
]) {
  if (dataTypeCliente == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataTypeCliente.toMap());

  // Add any Firestore field values
  dataTypeCliente.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeClienteListFirestoreData(
  List<DataTypeClienteStruct>? dataTypeClientes,
) =>
    dataTypeClientes
        ?.map((e) => getDataTypeClienteFirestoreData(e, true))
        .toList() ??
    [];
