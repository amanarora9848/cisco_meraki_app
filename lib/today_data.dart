import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';




class AnaToday extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AnaTodayPage(),
    );
  }
}


class AnaTodayPage extends StatefulWidget {
  @override
  _AnaTodayPageState createState() => _AnaTodayPageState();
}

class _AnaTodayPageState extends State<AnaTodayPage> {

  final String url = "https://n188.meraki.com/api/v0/devices/Q2FV-VVSR-NQ8U/camera/analytics/live";
  List merakiData;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

   Future<String> getJsonData() async {
    var response = await http.get(
    //We encode the URL here:
    Uri.encodeFull(url),
    //Only accept json response.
    headers: {"Accept": "application/json", "Content-type": "application/ json", "X-Cisco-Meraki-API-Key": ""}
    );
    int noPeople;
    print(response.body);
    print(response.body);
    setState((){
      var convertDataToJson = json.decode(response.body);
      int numPeople = convertDataToJson['zones']['0']['person'];
//      List<String> zone = convertDataToJson['zones'];
      print(numPeople);
//      print(zone);
      noPeople = numPeople;
    });
    return noPeople.toString();
  }



  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    var data = [
      Sales("08:00", 27.769373),
      Sales("10:00", 31.117863),
      Sales("12:00", 30.153517),
      Sales("14:00", 20),
      Sales("16:00", 18),
      Sales("18:00", 31.365051),
    ];

    var series = [
      charts.Series(
        domainFn: (Sales sales, _)=>sales.time,
        measureFn: (Sales sales, _)=>sales.sold,
        id: 'Sales',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      barGroupingType: charts.BarGroupingType.groupedStacked,
//      selectionModels: ,
    );

    return new Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getJsonData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Data Analytics Chart',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: pageHeight / 9,
                      width: pageWidth / 1.05,
                      child: new Card(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6.0),
                              child: Image.asset('assets/images/images.jpeg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 25.0),
                              child: Column(
                                children: <Widget>[
                                  Text('ABC Bank', style: new TextStyle(color: Colors.green, fontSize: 25.0, fontWeight: FontWeight.w500),),
                                  Text(
                                    'Timings: 9:00a.m. to 5:00p.m.'
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: chart,
                    color: Colors.white12,
                    height: pageHeight / 2.6,
                  ),

                  Container(
                    height: pageHeight / 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 6.5,
                            color: Colors.white,
                            child: new Container(
                              height: pageHeight / 15.0,
                              width: pageWidth / 1.1,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Center(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Text(
                                                  'No connection...',
                                                  style: new TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 6.5,
                                color: Colors.white,
                                child: new Container(
                                  height: pageHeight / 6.5,
                                  width: pageWidth / 2.2,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: new Text(
                                                'Number of people at the moment: ',
                                                style: new TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Container(
                                                height: pageHeight / 35,
                                                width: pageWidth / 20,
                                                child: new CircularProgressIndicator(
                                                  strokeWidth: 3.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 6.5,
                                color: Colors.white,
                                child: new Container(
                                  height: pageHeight / 6.5,
                                  width: pageWidth / 2.2,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(7.0),
                                                child: new Text(
                                                  'Should you visit today?',
                                                  style: new TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(0.1),
                                                child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Container(
                                                height: pageHeight / 40,
                                                width: pageWidth / 20,
                                                child: new CircularProgressIndicator(
                                                  strokeWidth: 3.0,
                                                ),
                                              ),
                                              ),
                                            ),
                                          ),
                                        ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            else {
              String conf;
              if(int.parse(snapshot.data) >= 5) {
                conf = "No";
              }
              else{
                conf = "Yes";
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Data Analytics Chart',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: pageHeight / 9,
                      width: pageWidth / 1.05,
                      child: new Card(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6.0),
                              child: Image.asset('assets/images/images.jpeg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 25.0),
                              child: Column(
                                children: <Widget>[
                                  Text('ABC Bank', style: new TextStyle(color: Colors.green, fontSize: 25.0, fontWeight: FontWeight.w500),),
                                  Text(
                                    'Timings: 9:00a.m. to 5:00p.m.'
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: chart,
                    color: Colors.white12,
                    height: pageHeight / 2.6,
                  ),

                  Container(
                    height: pageHeight / 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 6.5,
                            color: Colors.white,
                            child: new Container(
                              height: pageHeight / 15.0,
                              width: pageWidth / 1.1,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Center(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Text(
                                                  'Best time to visit today: 16:00 hrs.',
                                                  style: new TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                                new Text(
                                                  'X',
                                                  style: new TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 6.5,
                                color: Colors.white,
                                child: new Container(
                                  height: pageHeight / 6.5,
                                  width: pageWidth / 2.2,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: new Text(
                                                'Number of people at the moment: ',
                                                style: new TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: new Text(
                                                snapshot.data,
                                                style: new TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 6.5,
                                color: Colors.white,
                                child: new Container(
                                  height: pageHeight / 6.5,
                                  width: pageWidth / 2.2,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(7.0),
                                                child: new Text(
                                                  'Should you visit today?',
                                                  style: new TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(0.1),
                                                child: new Text(
                                                  '$conf',
                                                  style: new TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }
        ),
      ),
    );
  }
}



class Sales {
  final String time;
  final double sold;
  Sales(this.time, this.sold);
}
