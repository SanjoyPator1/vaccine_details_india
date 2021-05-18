// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

// DateTime now = DateTime.now();
// String formattedDate = DateFormat('dd-MM-yyyy').format(now);

// class DistrictSearchScreen extends StatefulWidget {
//   @override
//   _DistrictSearchScreenState createState() => _DistrictSearchScreenState();
// }

// class _DistrictSearchScreenState extends State<DistrictSearchScreen> {
//   @override
//   void initState() {
//     _getStateList();
//     super.initState();
//   }

//   //getting district details
//   var urlDistrictSlots =
//       'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=';

//   var dataDistrictsSlot;
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
//         urlDistrictSlots + _myDistrict.toString() + "&date=" + formattedDate));
//     dataDistrictsSlot = jsonDecode(res1.body);
//     print("dataDistrictSlot is : $dataDistrictsSlot");

//     centerName = dataDistrictsSlot['centers'][0]["name"];
//     centerAddress = dataDistrictsSlot['centers'][0]["address"];
//     blockName = dataDistrictsSlot['centers'][0]["block_name"];
//     pincode = dataDistrictsSlot['centers'][0]["pincode"];

//     vaccineAvailableDate =
//         dataDistrictsSlot['centers'][0]["sessions"][0]["date"];
//     vaccineAvailableCapacity =
//         dataDistrictsSlot['centers'][0]["sessions"][0]["available_capacity"];
//     vaccineMinAgeLimit =
//         dataDistrictsSlot['centers'][0]["sessions"][0]["min_age_limity"];
//     slotsNoon1 = dataDistrictsSlot['centers'][0]["sessions"][0]["slots"][0];
//     slotsNoon2 = dataDistrictsSlot['centers'][0]["sessions"][0]["slots"][1];

//     var datalength = await dataDistrictsSlot['centers'].length;

//     print('Center name is $centerName');
//     print('Center Address is $centerAddress');
//     print('block name is $blockName');
//     print('VaccineAvailableDate is $vaccineAvailableDate');
//     print('VaccineAvailableCapacity is $vaccineAvailableCapacity');
//     print('vaccineMinAgeLimit is $vaccineMinAgeLimit');
//     print('slotsNoon1 is $slotsNoon1');
//     print('slotsNoon2 is $slotsNoon2');

//     print('length of data1 : $datalength');

//     if (!mounted) return;

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[200],
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: [Colors.purple, Colors.blue])),
//               width: double.infinity,
//               height: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
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
//                                                 print(
//                                                     "Selected district id is : $_myDistrict");
//                                                 getData();
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
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             //draggableScrollableSheet
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: DraggableScrollableSheet(builder: (context, controller) {
//                 return Container(
//                   //color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: dataDistrictsSlot != null
//                         ? ListView.builder(
//                             //scrollDirection: Axis.vertical,
//                             controller: controller,

//                             itemBuilder: (context, index) {
//                               return Card(
//                                 margin: EdgeInsets.only(top: 18),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25.0),
//                                 ),
//                                 elevation: 25,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       DetailsRowReusable(
//                                           labell: "Centers",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]['name']}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Available Slots",
//                                           detailsReturned:
//                                               " ${dataDistrictsSlot['centers'][index]["sessions"][0]["available_capacity"]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Center Address",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["address"]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Block Name",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["block_name"]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Pincode",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["pincode"]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Vaccine Date available",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["sessions"][0]["date"]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Minimum age limit",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["sessions"][0]["min_age_limity"]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Slot 1",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["sessions"][0]["slots"][0]}"),
//                                       Divider(
//                                         thickness: 1,
//                                         color: Colors.purple[200],
//                                         indent: 12,
//                                         endIndent: 20,
//                                       ),
//                                       DetailsRowReusable(
//                                           labell: "Slot2",
//                                           detailsReturned:
//                                               "${dataDistrictsSlot['centers'][index]["sessions"][0]["slots"][1]}"),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             itemCount: dataDistrictsSlot['centers'].length,
//                           )
//                         : Center(child: CircularProgressIndicator()),
//                   ),
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [Colors.purple, Colors.blue]),
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20))),
//                 );
//               }),
//             )
//           ],
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

//   // Get State information by API
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
//                     color: Colors.black54,
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
