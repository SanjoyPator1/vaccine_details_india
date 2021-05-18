// import 'package:flutter/material.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

// DateTime now = DateTime.now();
// String formattedDate = DateFormat('dd-MM-yyyy').format(now);

// class PincodeSearchScreen extends StatefulWidget {
//   @override
//   _PincodeSearchScreenState createState() => _PincodeSearchScreenState();
// }

// class _PincodeSearchScreenState extends State<PincodeSearchScreen> {
//   @override
//   void initState() {
//     _getStateList();
//     super.initState();
//   }

//   List? result;

//   //getting district details
//   var urlPinSlots =
//       'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=';

//   var dataPinSlot;
//   var centerAddress;
//   var centerName;
//   var blockName;
//   var pincode;
//   var vaccineAvailableDate;
//   var vaccineAvailableCapacity;
//   var vaccineMinAgeLimit;
//   var slotsNoon1;
//   var slotsNoon2;

//   getData() async {
//     var res1 = await http.get(Uri.parse(
//         urlPinSlots + _myPincode.toString() + "&date=" + formattedDate));
//     dataPinSlot = jsonDecode(res1.body);
//     print("dataPinSlot is : $dataPinSlot");

//     centerName = dataPinSlot['centers'][0]["name"];
//     centerAddress = dataPinSlot['centers'][0]["address"];
//     blockName = dataPinSlot['centers'][0]["block_name"];
//     pincode = dataPinSlot['centers'][0]["pincode"];

//     vaccineAvailableDate = dataPinSlot['centers'][0]["sessions"][0]["date"];
//     vaccineAvailableCapacity =
//         dataPinSlot['centers'][0]["sessions"][0]["available_capacity"];
//     vaccineMinAgeLimit =
//         dataPinSlot['centers'][0]["sessions"][0]["min_age_limity"];
//     slotsNoon1 = dataPinSlot['centers'][0]["sessions"][0]["slots"][0];
//     slotsNoon2 = dataPinSlot['centers'][0]["sessions"][0]["slots"][1];

//     var datalength = await dataPinSlot['centers'].length;

//     print('Center name is $centerName');
//     print('Center Address is $centerAddress');
//     print('block name is $blockName');
//     print('VaccineAvailableDate is $vaccineAvailableDate');
//     print('VaccineAvailableCapacity is $vaccineAvailableCapacity');
//     print('vaccineMinAgeLimit is $vaccineMinAgeLimit');
//     print('slotsNoon1 is $slotsNoon1');
//     print('slotsNoon2 is $slotsNoon2');

//     print('length of dataPinSlot : $datalength');

//     if (!mounted) return;

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[200],
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [Colors.purple, Colors.blue])),
//             child: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Card(
//                       //color: Colors.grey[400],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                       elevation: 25,
//                       child: SizedBox(
//                         child: Column(
//                           children: [
//                             Container(
//                               alignment: Alignment.topCenter,
//                               margin: EdgeInsets.all(5),
//                               child: Text(
//                                 'Select your State and District',
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 22,
//                                   color: Colors.black,
//                                   //letterSpacing: 1.5,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             //======================================================== State

//                             Padding(
//                               padding: const EdgeInsets.all(1.0),
//                               child: Container(
//                                 padding: EdgeInsets.only(left: 10, right: 10),
//                                 //color: Colors.grey,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: DropdownButtonHideUnderline(
//                                         child: ButtonTheme(
//                                           alignedDropdown: true,
//                                           child: DropdownButton<String>(
//                                             value: _myState,
//                                             iconSize: 30,
//                                             icon: (null),
//                                             style: TextStyle(
//                                               color: Colors.black54,
//                                               fontSize: 16,
//                                             ),
//                                             hint: Text('Select State'),
//                                             onChanged: (var newValue) {
//                                               setState(() {
//                                                 _myState = newValue;
//                                                 _myDistrict = null;
//                                                 _getDistrictsList();
//                                                 print(
//                                                     "Selected state id is : $_myState");
//                                               });
//                                             },
//                                             items: statesList?.map((item) {
//                                                   return new DropdownMenuItem(
//                                                     child: new Text(
//                                                         item['state_name']),
//                                                     value: item['state_id']
//                                                         .toString(),
//                                                   );
//                                                 }).toList() ??
//                                                 [],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(
//                             //   height: 1,
//                             // ),

//                             //======================================================== District

//                             Padding(
//                               padding: const EdgeInsets.all(1.0),
//                               child: Container(
//                                 padding: EdgeInsets.only(left: 10, right: 10),
//                                 //color: Colors.grey,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: DropdownButtonHideUnderline(
//                                         child: ButtonTheme(
//                                           alignedDropdown: true,
//                                           child: DropdownButton<String>(
//                                             value: _myDistrict,
//                                             iconSize: 30,
//                                             icon: (null),
//                                             style: TextStyle(
//                                               color: Colors.black54,
//                                               fontSize: 16,
//                                             ),
//                                             hint: Text('Select Districts'),
//                                             onChanged: (var newValue) {
//                                               setState(() {
//                                                 _myDistrict = newValue;
//                                                 _myPincode = null;
//                                                 print(
//                                                     "Selected district id is : $_myDistrict");
//                                                 _getPinList();
//                                               });
//                                             },
//                                             items: districtList?.map((item) {
//                                                   return new DropdownMenuItem(
//                                                     child: new Text(
//                                                         item['district_name']),
//                                                     value: item['district_id']
//                                                         .toString(),
//                                                   );
//                                                 }).toList() ??
//                                                 [],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             //======================================================== Pincode

//                             Padding(
//                               padding: const EdgeInsets.all(1.0),
//                               child: Container(
//                                 padding: EdgeInsets.only(left: 10, right: 10),
//                                 //color: Colors.grey,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: DropdownButtonHideUnderline(
//                                         child: ButtonTheme(
//                                           alignedDropdown: true,
//                                           child: DropdownButton<String>(
//                                             value: _myPincode,
//                                             iconSize: 30,
//                                             icon: (null),
//                                             style: TextStyle(
//                                               color: Colors.black54,
//                                               fontSize: 16,
//                                             ),
//                                             hint: Text('Select Pincode'),
//                                             onChanged: (var newValue) {
//                                               setState(() {
//                                                 _myPincode = newValue;
//                                                 print(
//                                                     "Selected pincode id is : $_myPincode");
//                                                 getData();
//                                               });
//                                             },
//                                             items: result?.map((item) {
//                                                   return new DropdownMenuItem(
//                                                     child: new Text(
//                                                         item.toString()),
//                                                     value: item.toString(),
//                                                   );
//                                                 }).toList() ??
//                                                 [],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),

//                     //list of covid details
//                     Expanded(
//                       child: SizedBox(
//                         child: dataPinSlot != null
//                             ? ListView.builder(
//                                 scrollDirection: Axis.vertical,
//                                 itemBuilder: (context, index) {
//                                   return Card(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           DetailsRowReusable(
//                                               labell: "Centers",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]['name']}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Available Slots",
//                                               detailsReturned:
//                                                   " ${dataPinSlot['centers'][index]["sessions"][0]["available_capacity"]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Center Address",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["address"]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Block Name",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["block_name"]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Pincode",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["pincode"]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Vaccine Date available",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["sessions"][0]["date"]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Minimum age limit",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["sessions"][0]["min_age_limity"]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Slot 1",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["sessions"][0]["slots"][0]}"),
//                                           Divider(
//                                             thickness: 1,
//                                             color: Colors.purple[200],
//                                             indent: 12,
//                                             endIndent: 20,
//                                           ),
//                                           DetailsRowReusable(
//                                               labell: "Slot2",
//                                               detailsReturned:
//                                                   "${dataPinSlot['centers'][index]["sessions"][0]["slots"][1]}"),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 itemCount: dataPinSlot['centers'].length,
//                               )
//                             : Center(child: CircularProgressIndicator()),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   //=============================================================================== Api Calling here

// //CALLING STATE API HERE
// // Get State information by API
//   List? statesList;
//   String? _myState;

//   String stateInfoUrl =
//       'https://cdn-api.co-vin.in/api/v2/admin/location/states';
//   Future<String?> _getStateList() async {
//     await http.get(Uri.parse(stateInfoUrl)).then((response) {
//       var data = json.decode(response.body);

// //      print(data);
//       if (!mounted) return;
//       setState(() {
//         statesList = data['states'];
//       });
//     });
//   }

//   // Get district information by API
//   List? districtList;
//   String? _myDistrict;

//   String cityInfoUrl =
//       'https://cdn-api.co-vin.in/api/v2/admin/location/districts/';
//   Future<String?> _getDistrictsList() async {
//     await http.get(Uri.parse(cityInfoUrl + _myState!)).then((response) {
//       var data = json.decode(response.body);

//       print("State id is : $_myState and District id is : $_myDistrict");
//       if (!mounted) return;

//       setState(() {
//         districtList = data['districts'];
//       });
//     });
//   }

//   // Get district information by API
//   List? pinList;
//   String? _myPincode;

//   String districtInfoUrl =
//       'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=';
//   Future<String?> _getPinList() async {
//     await http
//         .get(Uri.parse(districtInfoUrl +
//             _myDistrict.toString() +
//             "&date=" +
//             formattedDate))
//         .then((response) {
//       var data = json.decode(response.body);

//       print("District id is : $_myDistrict and Pincode id is : $_myPincode");

//       if (!mounted) return;

//       setState(() {
//         pinList = data['centers'];
//         // convert each item to a string by using JSON encoding
//         final jsonList =
//             pinList!.map((item) => jsonEncode(item['pincode'])).toList();

//         // using toSet - toList strategy
//         final uniqueJsonList = jsonList.toSet().toList();

//         // convert each item back to the original form using JSON decoding
//         result = uniqueJsonList.map((item) => jsonDecode(item)).toList();
//         pinList = result;
//         print('pinList without dublicate : $result');
//       });
//     });
//   }
// }

// // ignore: must_be_immutable
// class DetailsRowReusable extends StatelessWidget {
//   DetailsRowReusable({required this.labell, required this.detailsReturned});
//   String? labell;
//   dynamic detailsReturned;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 7, right: 7),
//       child: Row(
//         children: [
//           Container(
//               child: Text(
//             labell! + " : ",
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Open Sans',
//                 fontSize: 17),
//           )),
//           SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: Container(
//               child: Text(
//                 detailsReturned!.toString(),
//                 style: TextStyle(
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Open Sans',
//                     fontSize: 14),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
