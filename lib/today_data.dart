import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String url = 'view-source:http://2a52bbd8.ngrok.io/today';

//Future<SwapiApi> getPost() async{
//  final response = await http.get('$url/1');
//  return swapiApiFromJson(response.body);
//}


class AnaToday extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AnaTodayPage(),
    );
  }
}

//math.Random random = new math.Random();



class AnaTodayPage extends StatefulWidget {
  @override
  _AnaTodayPageState createState() => _AnaTodayPageState();
}

class _AnaTodayPageState extends State<AnaTodayPage> {

  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    var data = [
      Sales("00", 50),
      Sales("02", 20),
      Sales("04", 90),
      Sales("06", 60),
      Sales("08", 80),
      Sales("10", 100),
      Sales("12", 30),
      Sales("14", 50),
      Sales("16", 20),
      Sales("18", 90),
      Sales("20", 60),
      Sales("22", 30),
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
    );

    return new Scaffold(
      body: Column(
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
                                    'Average Number of people: ',
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
                                      'Should you visit today?',
                                      style: new TextStyle(
                                        color: Colors.green,
                                        fontSize: 25.0,
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
      ),
    );
  }

}

class Sales {
  final String time;
  final int sold;

  Sales(this.time, this.sold);
}