import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TenderosRecord extends FirestoreRecord {
  TenderosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tenderos" field.
  DataTypeTenderoStruct? _tenderos;
  DataTypeTenderoStruct get tenderos => _tenderos ?? DataTypeTenderoStruct();
  bool hasTenderos() => _tenderos != null;

  void _initializeFields() {
    _tenderos = snapshotData['tenderos'] is DataTypeTenderoStruct
        ? snapshotData['tenderos']
        : DataTypeTenderoStruct.maybeFromMap(snapshotData['tenderos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tenderos');

  static Stream<TenderosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TenderosRecord.fromSnapshot(s));

  static Future<TenderosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TenderosRecord.fromSnapshot(s));

  static TenderosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TenderosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TenderosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TenderosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TenderosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TenderosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTenderosRecordData({
  DataTypeTenderoStruct? tenderos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tenderos': DataTypeTenderoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "tenderos" field.
  addDataTypeTenderoStructData(firestoreData, tenderos, 'tenderos');

  return firestoreData;
}

class TenderosRecordDocumentEquality implements Equality<TenderosRecord> {
  const TenderosRecordDocumentEquality();

  @override
  bool equals(TenderosRecord? e1, TenderosRecord? e2) {
    return e1?.tenderos == e2?.tenderos;
  }

  @override
  int hash(TenderosRecord? e) => const ListEquality().hash([e?.tenderos]);

  @override
  bool isValidKey(Object? o) => o is TenderosRecord;
}
