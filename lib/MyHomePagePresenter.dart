import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePagePresenter {
  late Timer _timer;
  var _controller1;
  var _controller2;
  var _itemExtent;

  void init(Timer timer, FixedExtentScrollController controller1,
      FixedExtentScrollController controller2, double itemExtent) {
    var fixedExtentScrollController = _controller1 = controller1;
    _controller2 = controller2;
    _itemExtent = itemExtent;
    _timer = timer;


  }

  void startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (_controller1.position.atEdge) {
        _controller1.jumpTo(0.0);
      } else {
        _controller1.animateTo(_controller1.position.pixels + _itemExtent,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      }

      if (_controller2.position.atEdge) {
        _controller2.jumpTo(0.0);
      } else {
        _controller2.animateTo(_controller2.position.pixels + _itemExtent,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      }
    });
  }

  void stopAutoScroll() {
    _timer.cancel();
  }
}
