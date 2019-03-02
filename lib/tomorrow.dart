import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    var data = [
      Sales("00", 60),
      Sales("02", 20),
      Sales("04", 90),
      Sales("06", 10),
      Sales("08", 80),
      Sales("10", 6),
      Sales("12", 30),
      Sales("14", 50),
      Sales("16", 190),
      Sales("18", 70),
      Sales("20", 60),
      Sales("22", 10),
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
            padding: const EdgeInsets.all(4.0),
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
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
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
                            Center(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: new Text(
                                    'Should you visit tomorrow?',
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

