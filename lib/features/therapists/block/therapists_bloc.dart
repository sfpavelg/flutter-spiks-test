
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_event.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_state.dart';

class TherapistsBloc extends Bloc<TherapistsEvent, TherapistsState> {
  TherapistsBloc() : super(TherapistsState(0, 100, 0, 100000)) {
    on<AgeAndCostFilterEvent>((event, emit) {
      emit(TherapistsState(state.startAge = event.startAge,
        state.endAge = event.endAge,
        state.minCostOfServices = event.minCostOfServices,
        state.maxCostOfServices = event.maxCostOfServices,),);
    });
  }
}