import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientesRecord extends FirestoreRecord {
  ClientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cliente" field.
  DataTypeClienteStruct? _cliente;
  DataTypeClienteStruct get cliente => _cliente ?? DataTypeClienteStruct();
  bool hasCliente() => _cliente != null;

  // "player_ids" field.
  List<String>? _playerIds;
  List<String> get playerIds => _playerIds ?? const [];
  bool hasPlayerIds() => _playerIds != null;

  void _initializeFields() {
    _cliente = snapshotData['cliente'] is DataTypeClienteStruct
        ? snapshotData['cliente']
        : DataTypeClienteStruct.maybeFromMap(snapshotData['cliente']);
    _playerIds = getDataList(snapshotData['player_ids']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clientes');

  static Stream<ClientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientesRecord.fromSnapshot(s));

  static Future<ClientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientesRecord.fromSnapshot(s));

  static ClientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientesRecordData({
  DataTypeClienteStruct? cliente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cliente': DataTypeClienteStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "cliente" field.
  addDataTypeClienteStructData(firestoreData, cliente, 'cliente');

  return firestoreData;
}

class ClientesRecordDocumentEquality implements Equality<ClientesRecord> {
  const ClientesRecordDocumentEquality();

  @override
  bool equals(ClientesRecord? e1, ClientesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cliente == e2?.cliente &&
        listEquality.equals(e1?.playerIds, e2?.playerIds);
  }

  @override
  int hash(ClientesRecord? e) =>
      const ListEquality().hash([e?.cliente, e?.playerIds]);

  @override
  bool isValidKey(Object? o) => o is ClientesRecord;
}
