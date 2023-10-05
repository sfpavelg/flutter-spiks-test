import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';

/// Расширенная модель терапевта (Therapist)

class TherapistDetail extends Therapist {
  final String? workPrinciples;
  final String? biography;
  final String? videoPresentationUrl;
  final String? additionalSpecializations;

  TherapistDetail({
    required super.id,
    required super.name,
    required super.surname,
    super.avatar,
    super.mainSpecialization,
    required super.experience,
    required super.costOfServices,
    required super.costOfServicesGroup,
    required this.workPrinciples,
    required this.biography,
    required this.videoPresentationUrl,
    this.additionalSpecializations,
  });
}
