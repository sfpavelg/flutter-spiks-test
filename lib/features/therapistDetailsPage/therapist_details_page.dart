import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';
import 'package:flutter_spiks_test/data/repositories/therapists_list_data/therapists_data.dart';
import 'package:flutter_spiks_test/router/app_router.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';

/**
 * Сраница подробной карточки терапевта
 * @TODO реализовать
 */
class TherapistDetailsPage extends StatelessWidget {
  final String? therapistId;
  late final double appBarWidth;

  TherapistDetailsPage({this.therapistId, super.key});

  String? getAvatarFromId(String? id, List<Therapist> therapistsList) {
    //Берём URL аватарки по id
    final Therapist therapist =
        therapistsList.firstWhere((therapist) => therapist.id == id);
    return therapist.avatar;
  }

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
}
