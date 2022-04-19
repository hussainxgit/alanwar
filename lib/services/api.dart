import 'package:alanwar/models/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  final CollectionReference _tripsCollection = FirebaseFirestore.instance.collection('trips');


  Future<void> createTrip(Trip trip) async {
    await _tripsCollection.doc().set(trip.toMap());
  }
}