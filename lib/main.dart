import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _counter.toString(),
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            //ドラッグするものと、ドラッグする先のウィジェットをここに入れる
            //ドラッグするもの
            Draggable(
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40.0,
                  )),
              feedback: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      )),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  )),
              onDragCompleted: () {
                _incrementCounter();
              },
            ),
            const SizedBox(height: 20.0),
            //ドラッグする先
            DragTarget(builder: (context, candidateData, rejectedData) {
              return DragTarget(
                  builder: (context, candidateData, rejectedData) {
                return Container(
                  height: size.height * 0.2,
                  width: size.width * 0.5,
                  color: Colors.grey.shade300,
                );
              });
            }),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
