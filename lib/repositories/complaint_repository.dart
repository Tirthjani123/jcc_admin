import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jcc_admin/model/complaint_model.dart';

class ComplaintRepository {
  ComplaintRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<List<ComplaintModel>> getComplaints(String department, String ward) {
    return _firestore
        .collection('complaints')
        .where('departmentName', isEqualTo: department)
        .where('ward', isEqualTo: ward)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ComplaintModel.fromMap(e.data())).toList();
    });
  }
}