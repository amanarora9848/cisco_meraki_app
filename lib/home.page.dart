import 'package:flutter/material.dart';
import 'main.dart';
import 'package:dio/dio.dart';

//import 'login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        body: MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio(); // for http requests
  String _searchText = "";
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );
  //TODO: An alternative needed for this appBarTitle.

  _MyHomePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cisco Meraki',
          style: TextStyle(
            color: Colors.white,
            wordSpacing: 3.0,
            letterSpacing: 4.0,
          ),
        ),
        iconTheme: new IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 5.0,
      ),
      backgroundColor: Colors.white,
      body: new GridView.extent(
        maxCrossAxisExtent: 240.0,
        children: _buildGridTiles(8, context),
      ),
      drawer: new Drawer(
            elevation: 10.0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: Center(
                    child: new Text(
                      'Elon Musk',
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: new DecorationImage(image: AssetImage(
                      'assets/images/musk.jpeg',
                    ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    //Navigator.of(context).pushNamed("/EvalPage");
                    //Opens up the login page.
                    appAuth.logout().then(
                            (_) => Navigator.of(context).pushReplacementNamed('/login'),
                    );
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    //Opens up the accounts page.
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
    );
  }


  void _getNames() async {
    final response = await dio.get('https://swapi.co/api/people');
    List tempList = new List();
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }

    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        //TODO: appBarTitle alternative needed.
        filteredNames = names;
        _filter.clear();
      }
    });
  }


}
List<Widget> _buildGridTiles(numberOfTiles, BuildContext context) {
  List<Container> containers = new List<Container>.generate(numberOfTiles,
          (int index) {
        final iconNo = index < 12 ? index : 0;
        //index = 0, 1, 2,...
        return new Container(
          child:
          // new Image.asset('assets/images/musk.jpeg'),
          new GestureDetector(
            child: Column(
              children: <Widget>[
                new Icon(
                  Icons.local_post_office,
                  size: 150.0,
                ),
                new Text('Hello World ${index+1}',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
            onTap: () {
              //print(iconName);
              Navigator.of(context).pushNamed("/EvalPage${iconNo+1}");
            },
          ),
        );
      }
  );
  return containers;

}


