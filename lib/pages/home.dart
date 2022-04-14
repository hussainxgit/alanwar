import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = '', country = '', airline = '', hotel = '';
  int seats = 0;
  double singlePrice = 0,
      duoPrice = 0,
      thirdPrice = 0,
      ticketPrice = 0,
      chairPrice = 0,
      weight = 0,
      privateCarPrice = 0;
  DateTime departure = DateTime.now(), arrival = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al Anwar'),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Form(
              child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Trip title',
                  border: OutlineInputBorder(),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Text('Country:'),
                  CountrySelector(),
                  Text('Hotel:'),
                  HotelSelector(),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text('Airline:'),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const AirlineSelector(),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    width: 75.0,
                    height: 30.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Seats',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const Text('Departure and return'),
              const DepartureReturnDatePicker(),
              Wrap(children: [
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ticket price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Single passenger price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Duo passengers price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Three or more passengers price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Chair price',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                width: 75.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Private car price',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 75.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Maximum weight',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String dropdownValue = 'Iran';
  List<String> dropdownList = ['Iran', 'Iraq', 'KSA', 'Syrian'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class HotelSelector extends StatefulWidget {
  const HotelSelector({Key? key}) : super(key: key);

  @override
  State<HotelSelector> createState() => _HotelSelectorState();
}

class _HotelSelectorState extends State<HotelSelector> {
  String dropdownValue = 'Negin';
  List<String> dropdownList = ['Negin', 'Al Ridha', 'Fairmont Makkah'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class AirlineSelector extends StatefulWidget {
  const AirlineSelector({Key? key}) : super(key: key);

  @override
  State<AirlineSelector> createState() => _AirlineSelectorState();
}

class _AirlineSelectorState extends State<AirlineSelector> {
  String dropdownValue = 'Kuwaitia';
  List<String> dropdownList = ['Kuwaitia', 'Huma', 'Al Jazeera'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DepartureReturnDatePicker extends StatelessWidget {
  const DepartureReturnDatePicker({Key? key}) : super(key: key);

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.range,
    );
  }
}
