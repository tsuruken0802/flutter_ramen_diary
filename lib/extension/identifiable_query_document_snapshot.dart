import 'package:cloud_firestore/cloud_firestore.dart';

extension IdentifiableQueryDocumentSnapshot
    on QueryDocumentSnapshot<Map<String, dynamic>> {
  Map<String, dynamic> identifiableData() {
    return _dataWithId(data());
  }
}

extension IdentifiableDocumentSnapshot
    on DocumentSnapshot<Map<String, dynamic>> {
  Map<String, dynamic> _dataWithId(Map<String, dynamic> data) {
    Map<String, dynamic> newData = data;
    newData['id'] = id;
    return newData;
  }

  Map<String, dynamic>? optionalDataWithId() {
    final data = this.data();
    if (data == null) {
      return null;
    }
    return _dataWithId(data);
  }
}
