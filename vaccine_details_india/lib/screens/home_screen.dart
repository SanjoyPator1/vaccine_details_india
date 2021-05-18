
import 'package:flutter/material.dart';
import 'package:vaccine_details_india/screens/pincode_search_screen.dart';

import 'district_search_screen.dart';
import 'drawer.dart';
import 'list_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vaccine Details",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.chrome_reader_mode_outlined), text: "List"),
            Tab(icon: Icon(Icons.map_outlined), text: "District"),
            Tab(icon: Icon(Icons.pin_drop), text: "Pincode"),
          ],
        ),
        actions: [
          Icon(
            Icons.coronavirus_outlined,
            size: 15,
            color: Colors.white30,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Icon(
            Icons.coronavirus_outlined,
            size: 25,
            color: Colors.white30,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Icon(
            Icons.coronavirus_outlined,
            size: 35,
            color: Colors.white30,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListDetailsScreen(),
          DistrictSearchScreen(),
          PincodeSearchScreen(),
        ],
      ),
     
      drawer: Mydrawer(),
    );
  }
}
