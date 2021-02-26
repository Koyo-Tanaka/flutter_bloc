import 'dart:async';

import 'package:flutter_bloc/counter_event.dart';

class CounterBloc {
  int _conunter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _conunter++;
    else
      _conunter--;

    _inCounter.add(_conunter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
