import 'package:flutter/material.dart';

class AvailableTrips extends StatefulWidget {
  const AvailableTrips({Key? key}) : super(key: key);

  @override
  _AvailableTripsState createState() => _AvailableTripsState();
}

class _AvailableTripsState extends State<AvailableTrips> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Column(
                  children: const [
                    Text('5/7'),
                    Text('Kuwait'),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                const Icon(Icons.arrow_forward_rounded),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: const [
                    Text('5/11'),
                    Text('Iran'),
                  ],
                ),
              ],
            ),
            subtitle: const Text('Available seats: 16'),
            trailing: const Text('\$195'),
            onTap: () {},
          );
        });
  }
}
