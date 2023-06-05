import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 Stream<List<QuerySnapshot>> mergeQueryResults(String from, String to) {
  Stream<QuerySnapshot> stream1 = FirebaseFirestore.instance
      .collection('Messages')
      .where('from', isEqualTo: from)
      .orderBy('time')
      .snapshots();

  Stream<QuerySnapshot> stream2 = FirebaseFirestore.instance
      .collection('Messages')
      .where('to', isEqualTo: to)
      .orderBy('time')
      .snapshots();

  return CombineLatestStream.list([stream1, stream2]);
}
