part of 'therapists_bloc.dart';

@Freezed()
class TherapistsEvent with _$TherapistsEvent {
  const factory TherapistsEvent.startAgeChanged({
    required int startAge,
  }) = _StartAgeChanged;
}