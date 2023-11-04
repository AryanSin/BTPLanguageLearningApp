import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final wordGroupsRF = fireStore.collection('wordGroups');
DocumentReference audioRf(
        {required String wordGroupId, required String audioId}) =>
    wordGroupsRF.doc(wordGroupId).collection('audios').doc(audioId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();

final userRF = fireStore.collection('Users');
FirebaseStorage storage = FirebaseStorage.instance;
