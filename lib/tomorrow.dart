import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Tomorrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TomorrowPage(),
    );
  }
}

class TomorrowPage extends StatefulWidget {
  @override
  _TomorrowPageState createState() => _TomorrowPageState();
}

class _TomorrowPageState extends State<TomorrowPage> {

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
        headers: {"Accept": "application/json", "Content-type": "application/ json", "X-Cisco-Meraki-API-Key": "f98adaac402daf25ca554cbce3be10ea96f71401"}
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


  //TODO: Include auto-refreshing stream builds.


  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    var data = [
      Sales("08:00", 27.169373),
      Sales("10:00", 20.153517),
      Sales("12:00", 18.80),
      Sales("14:00", 31.111863),
      Sales("16:00", 24.8887),
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
                return Container(
                  child: new Center(
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 4.0,
                    ),
                  ),
                );
              }
              else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Data Analytics Chart: Next Day',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                    Container(
                      child: chart,
                      color: Colors.white12,
                      height: pageHeight / 2,
                    ),
                    Container(
                      height: pageHeight / 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 6.5,
                              color: Colors.white,
                              child: new Container(
                                height: pageHeight / 3.6,
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
                                              'Expected Number of people: ',
                                              style: new TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 24.0,
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
                                                  fontSize: 44.0,
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
                                height: pageHeight / 3.6,
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
                                                'Should you visit tomorrow?',
                                                style: new TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 22.0,
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
                                              padding: const EdgeInsets.all(5.0),
                                              child: new Text(
                                                'Yes',
                                                style: new TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 32.0,
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