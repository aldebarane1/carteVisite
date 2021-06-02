/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// the [currentIndex] is set to index 0. The selected item is amber in color.
// With each [BottomNavigationBarItem] widget, backgroundColor property is
// also defined, which changes the background color of [BottomNavigationBar],
// when that item is selected. The `_onItemTapped` function changes the
// selected item's index and displays a corresponding message in the center of
// the [Scaffold].

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    CircleAvatar(
      radius: 70.0,
      backgroundImage: AssetImage('assets/photoCV.png'),
    ),
    Text(
      'Présentation',
      style: TextStyle(
          wordSpacing: 6,
          letterSpacing: 2,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          height: 24,
          color: Colors.black),
    ),
    Text(
      'Compétences',
      style: TextStyle(fontFamily: 'DancingScript', fontSize: 30, height: 27),
    ),
    Card(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Adlan',
            style: TextStyle(
                fontFamily: 'DancingScript.ttf',
                fontSize: 30,
                height: 1.5,
                color: Colors.white),
          ),
        )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adlan AISSAOUI'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Qui suis-je! ',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Compétences',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formation',
            backgroundColor: Colors.purpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'CV',
            backgroundColor: Colors.black26,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
