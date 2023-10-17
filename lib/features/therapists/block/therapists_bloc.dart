import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_event.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_state.dart';

class TherapistsBloc {

  TherapistsState _therapistsState = TherapistsState(0, 100, 0, 100000);

  final _inputEventController = StreamController<TherapistsEvent>();

  StreamSink<TherapistsEvent> get inputEventSinc =>
      _inputEventController.sink; ///входной поток с эвентом TherapistsEvent

  final _outputStateController = StreamController<TherapistsState>();

  Stream<TherapistsState> get outputStateStream =>
      _outputStateController.stream; ///выходной поток с сотоянием TherapistsState

  void _mapEventToState(TherapistsEvent event) {
    print('Вывод данных Event: $event');
    ///тут код заполнения state из event
    _therapistsState.startAge = event.startAge;
    _therapistsState.endAge = event.endAge;
    _therapistsState.minCostOfServices = event.minCostOfServices;
    _therapistsState.maxCostOfServices = event.maxCostOfServices;

    _outputStateController.sink.add(_therapistsState);
    print('Вывод данных State: $_therapistsState');
  }
  TherapistsBloc(){ ///через конструктор
    _inputEventController.stream.listen(_mapEventToState);
  }
  void dispose () {
    _inputEventController.close();
    _outputStateController.close();
  }
}

