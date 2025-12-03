import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyText(),
            MyCounterText(counter: _counter),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(onPressed: (){
        _incrementCounter();
      },),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('You have pushed the button this many times:');
  }
}


class MyCounterText extends StatelessWidget {
  final int counter;
  const MyCounterText({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MyFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}


