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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "pin" field.
  String? _pin;
  String get pin => _pin ?? '';
  bool hasPin() => _pin != null;

  // "player_ids" field.
  List<String>? _playerIds;
  List<String> get playerIds => _playerIds ?? const [];
  bool hasPlayerIds() => _playerIds != null;

  // "otp" field.
  String? _otp;
  String get otp => _otp ?? '';
  bool hasOtp() => _otp != null;

  // "isAuth" field.
  bool? _isAuth;
  bool get isAuth => _isAuth ?? false;
  bool hasIsAuth() => _isAuth != null;

  void _initializeFields() {
    _tenderos = snapshotData['tenderos'] is DataTypeTenderoStruct
        ? snapshotData['tenderos']
        : DataTypeTenderoStruct.maybeFromMap(snapshotData['tenderos']);
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _pin = snapshotData['pin'] as String?;
    _playerIds = getDataList(snapshotData['player_ids']);
    _otp = snapshotData['otp'] as String?;
    _isAuth = snapshotData['isAuth'] as bool?;
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
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? uid,
  String? pin,
  String? otp,
  bool? isAuth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tenderos': DataTypeTenderoStruct().toMap(),
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'uid': uid,
      'pin': pin,
      'otp': otp,
      'isAuth': isAuth,
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
    const listEquality = ListEquality();
    return e1?.tenderos == e2?.tenderos &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.pin == e2?.pin &&
        listEquality.equals(e1?.playerIds, e2?.playerIds) &&
        e1?.otp == e2?.otp &&
        e1?.isAuth == e2?.isAuth;
  }

  @override
  int hash(TenderosRecord? e) => const ListEquality().hash([
        e?.tenderos,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.uid,
        e?.pin,
        e?.playerIds,
        e?.otp,
        e?.isAuth
      ]);

  @override
  bool isValidKey(Object? o) => o is TenderosRecord;
}
