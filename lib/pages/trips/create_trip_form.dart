import 'package:alanwar/models/service.dart';
import 'package:alanwar/models/trip.dart';
import 'package:alanwar/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTripForm extends StatefulWidget {
  const CreateTripForm({Key? key}) : super(key: key);

  @override
  State<CreateTripForm> createState() => _CreateTripFormState();
}

class _CreateTripFormState extends State<CreateTripForm> {
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
                        labelText: 'Trip title',
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
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Airline:'),
                        const SizedBox(
                          width: 12.0,
                        ),
                        AirlineSelector(
                          parentWidgetNotify: airlineUpdate,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 100.0,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              if (!value.isNumeric()) {
                                return 'Only numbers allowed';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                trip.seats = int.parse(value);
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Seats',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 100.0,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              if (!value.isNumeric()) {
                                return 'Only numbers allowed';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                trip.weight = double.parse(value);
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Maximum weight',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Country:'),
                        CountrySelector(
                          parentWidgetNotify: countryUpdate,
                        ),
                        const Text('Hotel:'),
                        HotelSelector(
                          parentWidgetNotify: hotelUpdate,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text('Departure and return'),
                    DepartureReturnDatePicker(
                      parentWidgetNotify: departureReturnUpdate,
                    ),
                    Wrap(
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              if (!value.isNumeric()) {
                                return 'Only numbers allowed';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                trip.tripPrice = double.parse(value);
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Trip price',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
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
                        child: const Text('Create'),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            width: 12.0,
          ),
          SizedBox(
            width: 400,
            child: Form(
                key: _servicesAddFormKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Trip title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        serviceTitle = value;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              if (!value.isNumeric()) {
                                return 'Only numbers allowed';
                              }
                            },
                            onChanged: (value) {
                              servicePrice = double.parse(value);
                            },
                            decoration: const InputDecoration(
                              labelText: 'Price',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_servicesAddFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  services.add(Service(
                                      uid: '',
                                      title: serviceTitle,
                                      price: servicePrice,
                                      employeeEntry: ''));
                                });
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(services[index].title),
                            subtitle: Text(services[index].price.toString()),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_forever_rounded),
                              onPressed: () {
                                setState(() {
                                  services.remove(services[index]);
                                });
                              },
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 12.0,
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

  void hotelUpdate(String value) {
    setState(() {
      trip.hotel = value;
    });
  }

  void airlineUpdate(String value) {
    setState(() {
      trip.airLine = value;
    });
  }

  void departureReturnUpdate(DateTime value1, value2) {
    setState(() {
      trip.departure = value1;
      trip.arrival = value2;
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

class HotelSelector extends StatefulWidget {
  final Function parentWidgetNotify;

  const HotelSelector({Key? key, required this.parentWidgetNotify})
      : super(key: key);

  @override
  State<HotelSelector> createState() => _HotelSelectorState();
}

class _HotelSelectorState extends State<HotelSelector> {
  String? dropdownValue;
  List<String> dropdownList = ['Negin', 'Al Ridha', 'Fairmont Makkah'];

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
          widget.parentWidgetNotify(newValue);
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
  final Function parentWidgetNotify;

  const AirlineSelector({Key? key, required this.parentWidgetNotify})
      : super(key: key);

  @override
  State<AirlineSelector> createState() => _AirlineSelectorState();
}

class _AirlineSelectorState extends State<AirlineSelector> {
  String? dropdownValue;
  List<String> dropdownList = ['Kuwaitia', 'Huma', 'Al Jazeera'];

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
          widget.parentWidgetNotify(newValue);
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
  final Function parentWidgetNotify;

  const DepartureReturnDatePicker({Key? key, required this.parentWidgetNotify})
      : super(key: key);

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    DateTime? startDate = args.value.startDate;
    DateTime? endDate = args.value.endDate ?? args.value.startDate;
    parentWidgetNotify(startDate, endDate);
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.range,
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
