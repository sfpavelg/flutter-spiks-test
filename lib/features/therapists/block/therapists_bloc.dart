import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/configs/app_config.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_event.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_state.dart';

class TherapistsBloc extends Bloc<FilterEvent, TherapistsState> {
  TherapistsBloc()
      : super(
          TherapistsState(
            AppConfig.defaultStartAgeFilter,
            AppConfig.defaultEndAgeFilter,
            AppConfig.defaultMinCostOfServices,
            AppConfig.defaultMaxCostOfServices,
          ),
        ) {
    on<FilterEvent>((FilterEvent event, emit) {
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
