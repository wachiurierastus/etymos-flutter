import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WordsMeaningsRecord extends FirestoreRecord {
  WordsMeaningsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "word" field.
  String? _word;
  String get word => _word ?? '';
  bool hasWord() => _word != null;

  // "size" field.
  int? _size;
  int get size => _size ?? 0;
  bool hasSize() => _size != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _word = snapshotData['word'] as String?;
    _size = castToType<int>(snapshotData['size']);
    _category = snapshotData['category'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wordsMeanings');

  static Stream<WordsMeaningsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WordsMeaningsRecord.fromSnapshot(s));

  static Future<WordsMeaningsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WordsMeaningsRecord.fromSnapshot(s));

  static WordsMeaningsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WordsMeaningsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WordsMeaningsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WordsMeaningsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WordsMeaningsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WordsMeaningsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWordsMeaningsRecordData({
  String? word,
  int? size,
  DocumentReference? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'word': word,
      'size': size,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class WordsMeaningsRecordDocumentEquality
    implements Equality<WordsMeaningsRecord> {
  const WordsMeaningsRecordDocumentEquality();

  @override
  bool equals(WordsMeaningsRecord? e1, WordsMeaningsRecord? e2) {
    return e1?.word == e2?.word &&
        e1?.size == e2?.size &&
        e1?.category == e2?.category;
  }

  @override
  int hash(WordsMeaningsRecord? e) =>
      const ListEquality().hash([e?.word, e?.size, e?.category]);

  @override
  bool isValidKey(Object? o) => o is WordsMeaningsRecord;
}
