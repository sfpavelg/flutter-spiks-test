import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';
import 'package:flutter_spiks_test/data/repositories/therapists_list_data/therapists_data.dart';
import 'package:flutter_spiks_test/router/app_router.dart';
import 'package:go_router/go_router.dart';

/**
 * Сраница подробной карточки терапевта
 * @TODO реализовать
 */
class TherapistDetailsPage extends StatelessWidget {
  const TherapistDetailsPage({this.therapistId, super.key});
  final String? therapistId;

  /// Берём Therapist из массива по id
  Therapist getTherapistFromDBbyId(String? id, List<Therapist> therapistsList) {
        return therapistsList.firstWhere((therapist) => therapist.id == id);
  }

  @override
  Widget build(BuildContext context) {

    ///Извлекаем данные из Therapist, полученного по id
    final String? avatar = getTherapistFromDBbyId(therapistId, therapistsList).avatar;
    final String name = getTherapistFromDBbyId(therapistId, therapistsList).name;
    final String surname = getTherapistFromDBbyId(therapistId, therapistsList).surname;
    final String? mainSpecialization = getTherapistFromDBbyId(therapistId, therapistsList).mainSpecialization;
    final int costOfServices = getTherapistFromDBbyId(therapistId, therapistsList).costOfServices;
    final int costOfServicesGroup = getTherapistFromDBbyId(therapistId, therapistsList).costOfServicesGroup;
    final int experience = getTherapistFromDBbyId(therapistId, therapistsList).experience;

    ///Цвет для иконки портфеля
    Color color1 = Color(0xFFF34384); // #F34384
    Color color2 = Color(0xFF4510DB); // #4510DB
    Color? blendedColor = Color.lerp(color1, color2, 0.5); // 50% blend

    ///Делаем StatusBar прозрачным
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            context.go(AppRouter.therapistsListPath);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFE5F6FF),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://$avatar',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: 600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      /// Белый цвет фона для контейнера с текстом
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        /// Закругление верхних углов
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, /// Центрирование по главной оси
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$name $surname',
                                  style: context.textTheme.titleLarge?.copyWith(fontSize: 34),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  width: 371,
                                  child: Text(
                                    '$mainSpecialization',
                                    style: TextStyle(fontSize: 16),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.business_center,
                                      color: blendedColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Опыт работы - $experience лет',
                                      maxLines: 1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, /// Центрирование по главной оси
                          crossAxisAlignment: CrossAxisAlignment.center, /// Центрирование по поперечной оси
                          children: [
                            Text(
                              'Цена',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, /// Центрирование по главной оси
                          crossAxisAlignment: CrossAxisAlignment.center, /// Центрирование по поперечной оси
                          children: [
                            Text(
                              'Описание',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

