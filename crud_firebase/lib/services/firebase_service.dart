import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getData() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection("people");

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((result) {
    final Map<String, dynamic> data = result.data() as Map<String, dynamic>;
    final person = {'id': result.id, 'name': data['name']};
    people.add(person);
  });

  return people;
}

Future<void> addData(String name) async {
  await db.collection("people").add({"name": name});
}

Future<void> updateData(String id, String name) async {
  await db.collection("people").doc(id).update({"name": name});
}

Future<void> deleteData(String id) async {
  await db.collection("people").doc(id).delete();
}
