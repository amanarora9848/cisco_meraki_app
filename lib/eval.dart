import 'package:flutter/material.dart';

void main() => runApp(EvalPage());
class EvalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: new Container(
        child: new Row(
          children: <Widget>[
            new Divider(
              height: 25.0,
              color: Colors.red,
              indent: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}