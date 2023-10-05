/**
 * Модель терапевта
**/

class Therapist {
  final String id;
  final String name;
  final String surname;
  /// avatar url
  final String? avatar;
  /// специализация
  final String? mainSpecialization;
  /// годы опыта
  final int experience;
  /// стоимость услуг
  final int costOfServices;
  final int costOfServicesGroup;

  Therapist({
    required this.id,
    required this.name,
    required this.surname,
    required this.experience,
    required this.costOfServices,
    required this.costOfServicesGroup,
    this.avatar,
    this.mainSpecialization,
  });
}
