import 'service.dart';

class Trip {
  String uid, title, country, employeeEntry, airLine, hotel;
  int seats;
  double
      tripPrice,
      weight;
  DateTime? departure, arrival;
  List<Service> services = [];

  Trip(
      {required this.uid,
        required this.title,
        required this.country,
        required this.hotel,
        required this.employeeEntry,
        required this.airLine,
        required this.seats,
        required this.tripPrice,
        required this.weight,
        required this.departure,
        required this.arrival,
        required this.services,});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'country': country,
      'employeeEntry': employeeEntry,
      'airLine': airLine,
      'hotel': hotel,
      'seats': seats,
      'tripPrice': tripPrice,
      'weight': weight,
      'departure': departure,
      'arrival': arrival,
      'services': services.map((e) => e.toMap()).toList(),
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map, String uid) {
    return Trip(
      uid: uid,
      title: map['title'] as String,
      country: map['country'] as String,
      employeeEntry: map['employeeEntry'] as String,
      airLine: map['airLine'] as String,
      hotel: map['hotel'] as String,
      seats: map['seats'] as int,
      tripPrice: map['tripPrice'] as double,
      weight: map['weight'] as double,
      departure: map['departure'] as DateTime,
      arrival: map['arrival'] as DateTime,
      services: map['services'] as List<Service>,
    );
  }
}