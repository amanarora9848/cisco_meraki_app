import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Weekly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WeeklyPage(),
    );
  }
}

class WeeklyPage extends StatefulWidget {
  @override
  _WeeklyPageState createState() => _WeeklyPageState();
}

class _WeeklyPageState extends State<WeeklyPage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    var data = [
      Sales(50, 'Mon'),
      Sales(10, 'Tue'),
      Sales(9, 'Wed'),
      Sales(46, 'Thu'),
      Sales(90, 'Fri'),
      Sales(150, 'Sat'),
      Sales(120, 'Sun'),
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
      vertical: false,
      animate: true,
    );

    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Data Analytics Chart: Previous Week',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 10.0, left: 5.0, right: 5.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: chart,
                  color: Colors.white12,
                  height: pageHeight / 1.3,
                ),
              ],
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

  Sales(this.sold, this.time);
}
