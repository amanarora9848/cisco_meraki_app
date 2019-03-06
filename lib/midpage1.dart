//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//
//
//class SelectBranch extends StatefulWidget {
//  @override
//  _SelectBranchState createState() => _SelectBranchState();
//}
//
//
//class _SelectBranchState extends State<SelectBranch> {
//
//  final String url = "https://2d3bdea4.ngrok.io/all";
////  List merakiData;
//
//  @override
//  void initState(){
//    super.initState();
//    this.getJsonData();
//  }
//
//  Future<String> getJsonData() async {
//    var response = await http.get(
//        Uri.encodeFull(url),
//        headers: {"Accept": "application/json", "Content-type": "application/ json"}
//    );
//    int noPeople;
//    print(response.body);
//    setState((){
//      var convertDataToJson = json.decode(response.body);
//    });
//    return noPeople.toString();
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: new Text(
//          'Cisco Meraki View',
//          style: new TextStyle(
//            color: Colors.white,
//          ),
//        ),
//        centerTitle: true,
//      ),
//      body: new Container(
//        child: FutureBuilder(
//          future: getJsonData(),
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
//    if(snapshot.data == null) {
//    return Container(
//    child: Center(
//    child: new CircularProgressIndicator(
//    backgroundColor: Colors.white,
//    strokeWidth: 4.0,
//    ),
//    ),
//    );
//    }
//    else{
//      return Container(
//        child:
//      ),
//    }
//  }