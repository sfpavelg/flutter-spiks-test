import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';
import 'package:flutter_spiks_test/data/repositories/therapists_list_data/therapists_data.dart';
import 'package:flutter_spiks_test/router/app_router.dart';

/**
 * Сраница подробной карточки терапевта
 * @TODO реализовать
 */
class TherapistDetailsPage extends StatelessWidget {
  const TherapistDetailsPage({this.therapistId, super.key});

  final String? therapistId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200, // Установка высоты AppBar
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(48),
            bottomRight: Radius.circular(48),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go(AppRouter.therapistsListPath);
          },
        ),
        title: Image.network(
            'https://${getAvatarFromId(therapistId, therapistsList)}'),
      ),
    );
  }

  String? getAvatarFromId(String? id, List<Therapist> therapistsList) {
    final Therapist therapist =
        therapistsList.firstWhere((therapist) => therapist.id == id);
    return therapist.avatar;
  }
}
