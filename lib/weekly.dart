import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Weekly extends StatelessWidget {

  Material myItems (IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 18.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(12.0),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      //width: (MediaQuery(data: null, child: null).toDouble,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: new Text(heading,
                            style: new TextStyle(
                              color: new Color(color),
                              fontSize: 28.0,
                              letterSpacing: 0.5,
                            ),
                          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var pageHeight = (MediaQuery.of(context).size.height).toDouble() / 1.24;
    return new Scaffold(
      body: new StaggeredGridView.count(
        crossAxisCount: 1,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
        children: <Widget>[
          myItems(Icons.graphic_eq, 'Data for the next week.', 0xffed622b),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, pageHeight),
        ],
      ),
    );
  }
}
