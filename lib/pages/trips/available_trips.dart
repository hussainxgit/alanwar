import 'package:alanwar/models/trip.dart';
import 'package:alanwar/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailableTrips extends StatefulWidget {
  const AvailableTrips({Key? key}) : super(key: key);

  @override
  _AvailableTripsState createState() => _AvailableTripsState();
}

class _AvailableTripsState extends State<AvailableTrips> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _apiService.getTripsStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          } else {
            List<Trip> tripList = snapshot.data!.docs
                .map(
                    (e) => Trip.fromMap(e.data() as Map<String, dynamic>, e.id))
                .toList();
            return ListView.builder(
                itemCount: tripList.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    color: Colors.white,
                    width: 200,
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Trip title'),
                              const SizedBox(height: 8.0,),
                              Text(tripList[index].title +
                                  ' - ' +
                                  tripList[index].country, style: const TextStyle(color: Colors.lightBlue),),
                              const SizedBox(height: 16.0,),
                              const Text('Date'),
                              const SizedBox(height: 8.0,),
                              const Text('May 07 - 25')
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Available seats'),
                              const SizedBox(height: 8.0,),
                              Text(tripList[index].seats.toString()),
                              const SizedBox(height: 16.0,),
                              const Text('Price'),
                              const SizedBox(height: 8.0,),
                              Text('\$${tripList[index].tripPrice.toString()}')
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        });
  }
}
