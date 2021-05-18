import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class ListDetailsScreen extends StatefulWidget {
  @override
  _ListDetailsScreenState createState() => _ListDetailsScreenState();
}

class _ListDetailsScreenState extends State<ListDetailsScreen> {
  var url1 = 'https://cdn-api.co-vin.in/api/v2/admin/location/states';

  var data1;
  var stid;
  var stname;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res1 = await http.get(Uri.parse(url1));
    data1 = jsonDecode(res1.body);
    print("data1 is : $data1");

    stname = data1['states'][0]["state_name"];
    stid = data1['states'][0]["state_id"];
    var datalength = await data1['states'].length;

    // print('stname is $stname');
    // print('st_id is $stid');
    // print('length of data1 : $datalength');

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: data1 != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        
                        title: Text(data1['states'][index]["state_name"]),
                        subtitle: Text(
                            "State Id : ${data1['states'][index]["state_id"]}"),
                        leading: Icon(
                          Icons.business,
                          color: Colors.amber[900],
                        ),
                      ),
                    );
                  },
                  itemCount: data1['states'].length,
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
