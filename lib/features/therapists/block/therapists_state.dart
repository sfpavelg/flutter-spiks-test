part of 'therapists_bloc.dart';

@Freezed()
class TherapistsState with _$TherapistsState {
  const factory TherapistsState({
    @Default(18) int startAge,
  }) = _TherapistsState;
}
