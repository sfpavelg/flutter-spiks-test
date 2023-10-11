abstract class TherapistsEvent {}
class AgeAndCostFilterEvent extends TherapistsEvent {
  AgeAndCostFilterEvent(this.startAge, this.endAge, this.minCostOfServices,
      this.maxCostOfServices,);

  final int? startAge;
  final int? endAge;
  final int? minCostOfServices;
  final int? maxCostOfServices;
}
