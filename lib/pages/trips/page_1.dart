import 'package:alanwar/pages/trips/available_trips.dart';
import 'package:alanwar/pages/trips/book_trip.dart';
import 'package:alanwar/pages/trips/create_trip_form.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;
  late ScrollController _scrollController;
  //Offset state <-------------------------------------
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 200,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                  title: const Text('Create trip'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                      _tabController.index = _selectedIndex;
                    });
                  },
                  shape: _selectedIndex == 0
                      ? RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(7))
                      : null),
              const SizedBox(
                height: 14.0,
              ),
              ListTile(
                  title: const Text('Available trips'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      _tabController.index = _selectedIndex;
                    });
                  },
                  shape: _selectedIndex == 1
                      ? RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(7))
                      : null),
              const SizedBox(
                height: 14.0,
              ),
              ListTile(
                  title: const Text('Closed trips'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                      _tabController.index = _selectedIndex;
                    });
                  },
                  shape: _selectedIndex == 2
                      ? RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(7))
                      : null),
              const SizedBox(
                height: 14.0,
              ),
              ListTile(
                  title: const Text('Book trip'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                      _tabController.index = _selectedIndex;
                    });
                  },
                  shape: _selectedIndex == 3
                      ? RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(7))
                      : null),
            ],
          ),
        ),
        //todo: removing expanded or parent width
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TabBarView(controller: _tabController, children: const [
              CreateTripForm(),
              Align(alignment:Alignment.centerLeft, child: SizedBox(width:400, child: AvailableTrips())),
              SizedBox.shrink(),
              BookTripForm(),
            ]),
          ),
        ),
      ],
    );
  }
}
