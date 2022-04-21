import '/pages/page_1.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;

  TabBar get _tabBar => TabBar(
    labelPadding: const EdgeInsets.all(0),
    labelColor: Colors.black87,
    isScrollable: true,
        indicator: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: const BorderRadius.all(Radius.circular(7))
        ),
        controller: _tabController,
        tabs: const [
          SizedBox(child: Tab(text: 'Home',), width: 100,),
          SizedBox(child: Tab(text: 'Trips',), width: 100,),
          SizedBox(child: Tab(text: 'Costumers',), width: 100,),
        ],
      );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Color(
                0xFFC1C1C1)),),
            color: Colors.white,
          ),
          child: _tabBar,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(32.0),
        child: TabBarView(
          controller: _tabController,
          children: const [
            Page1(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
