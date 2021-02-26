import 'package:flutter/material.dart';
import 'package:flutter_bloc/counter_bloc.dart';

import 'counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              heroTag: "scan",
              child: Icon(Icons.add),
              backgroundColor: Colors.pink[200],
              onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              heroTag: "scan",
              child: Icon(Icons.remove),
              backgroundColor: Colors.pink[200],
              onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            ),
          ),
        ],
      ),
    );
  }
}
