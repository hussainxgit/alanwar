import 'passenger.dart';
import 'service.dart';


class Trip {
  String uid, title, country, employeeEntry, airLine, hotel;
  int seats;
  double singlePrice,
      duoPrice,
      thirdPrice,
      ticketPrice,
      chairPrice,
      privateCarPrice,
      weight;
  DateTime departure, arrival;
  List<Service> services = [];
  List<Passenger> passengers = [];

  Trip(
      {required this.uid,
        required this.title,
        required this.country,
        required this.hotel,
        required this.employeeEntry,
        required this.airLine,
        required this.seats,
        required this.singlePrice,
        required this.duoPrice,
        required this.thirdPrice,
        required this.ticketPrice,
        required this.chairPrice,
        required this.privateCarPrice,
        required this.weight,
        required this.departure,
        required this.arrival,
        required this.services,
        required this.passengers});
}