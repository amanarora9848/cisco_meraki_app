import 'package:flutter/material.dart';
import 'tabs.dart';

//void main() => runApp(EvalPage());
class EvalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      body: MyEvalPage(
//        title: 'Queue Data Analytics',
//      ),
//    );
    return Scaffold(
      body: TabTheme(),
    );
  }
}

//class MyEvalPage extends StatefulWidget {
//MyEvalPage({Key key, this.title}) : super(key: key);
//final String title;
//
//@override
//_MyEvalPageState createState() => _MyEvalPageState();
//}
//
//class _MyEvalPageState extends State<MyEvalPage> {
//
//  @override
//
//  Widget build(BuildContext context) {
//    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          widget.title,
//          style: new TextStyle(
//            color: Colors.black,
//          ),
//        ),
//        centerTitle: true,
//        elevation: 0.0,
////        bottom: new TabBar(
////          controller: _tabController,
////          indicatorColor: Colors.white,
////          tabs: <Widget>[
////            new Tab(text: 'Today',),
////            new Tab(text: 'Tomorrow',),
////            new Tab(text: 'Weekly',),
////          ],
////        ),
//        backgroundColor: Colors.white,
//        iconTheme: new IconThemeData(
//          color: Colors.black,
//        ),
//      ),
//      backgroundColor: Colors.white,
//      body: new Container(
//        child: new StaggeredGridView.countBuilder(
//          crossAxisCount: 4,
//          itemCount: 6,
//          itemBuilder: (BuildContext context, int index) => new Container(
//              color: Colors.green,
//              child: new Center(
//                child: new CircleAvatar(
//                  backgroundColor: Colors.white,
//                  child: new Text('$index'),
//                ),
//              )),
//          staggeredTileBuilder: (int index) =>
//          new StaggeredTile.count(2, index.isEven ? 2 : 2),
//          mainAxisSpacing: 20.0,
//          crossAxisSpacing: 0.0,
//          //physics: ,
//        )
//      ),
//    );
//  }
//}