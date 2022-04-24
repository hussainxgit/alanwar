import 'package:alanwar/models/service.dart';
import 'package:alanwar/models/trip.dart';
import 'package:alanwar/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookTripForm extends StatefulWidget {
  const BookTripForm({Key? key}) : super(key: key);

  @override
  State<BookTripForm> createState() => _BookTripFormState();
}

class _BookTripFormState extends State<BookTripForm> {
  final ApiService _apiService = ApiService();
  final GlobalKey<FormState> _tripCreateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _servicesAddFormKey = GlobalKey<FormState>();
  List<Service> services = [];
  Trip trip = Trip(
    uid: '',
    title: '',
    country: '',
    hotel: '',
    employeeEntry: '',
    airLine: '',
    seats: 0,
    tripPrice: 0,
    weight: 0,
    departure: DateTime.now(),
    arrival: DateTime.now(),
    services: [],
  );

  String serviceTitle = '';
  double servicePrice = 0;
  late ScrollController _scrollController;

  //Offset state <-------------------------------------
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    //print("init state is called");

    _scrollController = ScrollController() //keepScrollOffset: false removed
      ..addListener(() {
        setState(() {
          //<-----------------------------
          offset = _scrollController.offset;
          // force a refresh so the app bar can be updated
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            child: Form(
                key: _tripCreateFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          trip.title = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          trip.title = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Group ID',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          trip.title = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Total payment',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          trip.title = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Remaining fees',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          trip.title = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Notes',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          trip.title = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Nationality:'),
                        CountrySelector(
                          parentWidgetNotify: countryUpdate,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 100.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_tripCreateFormKey.currentState!.validate()) {
                            setState(() {
                              trip.services = services;
                            });
                            await _apiService.createTrip(trip);
                          }
                        },
                        child: const Text('Book'),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            width: 12.0,
          ),
        ],
      ),
    );
  }
  void countryUpdate(String value) {
    setState(() {
      trip.country = value;
    });
  }

}

class CountrySelector extends StatefulWidget {
  final Function parentWidgetNotify;

  const CountrySelector({Key? key, required this.parentWidgetNotify})
      : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String? dropdownValue;
  List<String> dropdownList = ['Iran', 'Iraq', 'KSA', 'Syrian'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Choose'),
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
          widget.parentWidgetNotify(dropdownValue);
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

extension DateOnlyCompare on DateTime {
  String onlyDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(this);
    return formatted;
  }
}

extension StringUtili on String {
  bool isNumeric() {
    return double.tryParse(this) != null;
  }
}
