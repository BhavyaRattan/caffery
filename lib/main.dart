import 'package:caffery/common/characterList.dart';
import 'package:caffery/common/navigation_drawer.dart';
import 'package:caffery/res/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => NavigationDrawer.of(context).open(),
          );
        },
      ),
      title: Text('White Collar'),
      backgroundColor: CafferyColors.primary,
    );
    Widget child = MyHomePage(appBar: appBar);
    child = NavigationDrawer(child: child);
    return MaterialApp(
      title: 'Caffery',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: child,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppBar appBar;

  MyHomePage({Key key, @required this.appBar}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(child: CharacterList()),
    );
  }
}
