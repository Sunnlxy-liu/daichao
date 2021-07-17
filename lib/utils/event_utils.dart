import 'dart:async';
// import 'package:flutter/cupertino.dart';

enum Events {
  logined,
  logouted,
  vipPayed,
}

class EventUtils {
  StreamController<Events> _controller;
  static EventUtils _instance;
  factory EventUtils() {
    if (_instance == null) {
      _instance = EventUtils._(); 
    }
    return _instance;
  }

  EventUtils._() {
    _controller = StreamController.broadcast();
  }

  StreamSubscription<dynamic> listen(onData) {
    return _controller.stream.listen(onData);
  }

  void logined() {
    _controller.sink.add(Events.logined);
  }

  void logouted() {
    _controller.sink.add(Events.logouted);
  }

  void vipPayed() {
    _controller.sink.add(Events.vipPayed);
  }

  void dispos() {
    _controller.close();
  }
}