/**
 * Модель терапевта
**/

class Therapist {
  final String id;
  final String name;
  final String surname;
  // avatar url
  final String? avatar;
  final String? mainSpecialization;
  // годы опыта
  final int experience;
  final int costOfServices;

  Therapist({
    required this.id,
    required this.name,
    required this.surname,
    required this.experience,
    required this.costOfServices,
    this.avatar,
    this.mainSpecialization,
  });
}
