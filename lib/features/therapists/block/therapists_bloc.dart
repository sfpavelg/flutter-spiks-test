import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_event.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_state.dart';

class TherapistsBloc extends Bloc<TherapistsEvent, TherapistsState> {
  TherapistsBloc() : super(TherapistsState(0, 100, 0, 100000)) {
    on<AgeAndCostFilterEvent>((AgeAndCostFilterEvent event, emit) {
      emit(
        TherapistsState(
          event.startAge,
          event.endAge,
          event.minCostOfServices,
          event.maxCostOfServices,
        ),
      );
    });
  }
}
