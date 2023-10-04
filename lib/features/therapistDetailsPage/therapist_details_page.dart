import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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

  TherapistDetailsPage({this.therapistId, super.key});


  String? getAvatarFromId(String? id, List<Therapist> therapistsList) {
    final Therapist therapist = //Берём URL аватарки по id
    therapistsList.firstWhere((therapist) => therapist.id == id);
    final String? avatarUrl = therapist.avatar; // Получить URL-адрес аватара
    return avatarUrl;
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Устанавливаем прозрачный цвет statusBar
      statusBarIconBrightness: Brightness
          .dark, // Устанавливаем цвет иконок statusBar на темный
    ));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400),
        child: AppBar(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(48),
              bottomRight: Radius.circular(48),
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.go(AppRouter.therapistsListPath);
            },
          ),
          flexibleSpace: Stack(
            children: [
              Image.network(
                'https://${getAvatarFromId(therapistId, therapistsList)}',
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}