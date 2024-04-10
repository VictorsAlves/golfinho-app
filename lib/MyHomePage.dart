import 'package:flutter/material.dart';
import 'dart:async';

import 'package:golfino/MyHomePagePresenter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FixedExtentScrollController _controller1;
  late FixedExtentScrollController _controller2;
  final presenter = MyHomePagePresenter();
  late final Timer _timer = Timer(Duration.zero, () {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: corpo(context)
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget corpo(BuildContext context) {
    //variáveis
    double _itemExtent = 50.0;
    List<String> _items = List.generate(10, (index) => 'Item $index');

    Timer _timer;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 3 - 20,
              child: ListWheelScrollView(
                controller: _controller1,
                itemExtent: _itemExtent,
                physics: const FixedExtentScrollPhysics(),
                children: _items
                    .map((item) => Center(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 20),
                  ),
                ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 3 - 20,
              child: ListWheelScrollView(
                controller: _controller2,
                itemExtent: _itemExtent,
                physics: const FixedExtentScrollPhysics(),
                children: _items
                    .map((item) => Center(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 20),
                  ),
                ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 3 - 20,
              child: ListWheelScrollView(
                controller: _controller2,
                itemExtent: _itemExtent,
                physics: const FixedExtentScrollPhysics(),
                children: _items
                    .map((item) => Center(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 20),
                  ),
                ))
                    .toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: presenter.startAutoScroll,
              child: const Text('Start Auto Scroll'),
            ),
            ElevatedButton(
              onPressed: presenter.stopAutoScroll,
              child: const Text('Stop Auto Scroll'),
            ),
          ],
        ),
      ],
    );
  }


  @override
  void initState() {
    super.initState();
    _controller1 = FixedExtentScrollController();
    _controller2 = FixedExtentScrollController();
    presenter.init(_timer, _controller1, _controller2, 0);
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

Widget roleta() {
  return Container();
}
