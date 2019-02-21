import 'package:flutter/material.dart';

class EvalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primaryColor: Colors.white,
////        primarySwatch: Colors.white,
//      ),
//      home: MyEvalPage(title: 'Queue Data Analytics'),
//    );
    return Scaffold(
      body: MyEvalPage(
        title: 'Queue Data Analytics',
      ),
    );
  }
}

class MyEvalPage extends StatefulWidget {
MyEvalPage({Key key, this.title}) : super(key: key);
final String title;

@override
_MyEvalPageState createState() => _MyEvalPageState();
}

class _MyEvalPageState extends State<MyEvalPage> {

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}