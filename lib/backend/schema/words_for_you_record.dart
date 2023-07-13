import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WordsForYouRecord extends FirestoreRecord {
  WordsForYouRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "words" field.
  List<String>? _words;
  List<String> get words => _words ?? const [];
  bool hasWords() => _words != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _words = getDataList(snapshotData['words']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wordsForYou');

  static Stream<WordsForYouRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WordsForYouRecord.fromSnapshot(s));

  static Future<WordsForYouRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WordsForYouRecord.fromSnapshot(s));

  static WordsForYouRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WordsForYouRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WordsForYouRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WordsForYouRecord._(reference, mapFromFirestore(data));

  static WordsForYouRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      WordsForYouRecord.getDocumentFromData(
        {
          'category': snapshot.data['category'],
          'words': safeGet(
            () => snapshot.data['words'].toList(),
          ),
        },
        WordsForYouRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<WordsForYouRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'wordsForYou',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'WordsForYouRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WordsForYouRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWordsForYouRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class WordsForYouRecordDocumentEquality implements Equality<WordsForYouRecord> {
  const WordsForYouRecordDocumentEquality();

  @override
  bool equals(WordsForYouRecord? e1, WordsForYouRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        listEquality.equals(e1?.words, e2?.words);
  }

  @override
  int hash(WordsForYouRecord? e) =>
      const ListEquality().hash([e?.category, e?.words]);

  @override
  bool isValidKey(Object? o) => o is WordsForYouRecord;
}
