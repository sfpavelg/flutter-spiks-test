import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapists_models.dart';
import 'package:flutter_spiks_test/router/app_router.dart';
import 'package:flutter_spiks_test/widgets/gap/widgets/gap.dart';
import 'package:flutter_spiks_test/widgets/widgets/rounded_avatar.dart';
import 'package:go_router/go_router.dart';

class TherapistListItem extends StatelessWidget {
  const TherapistListItem({required this.therapist, this.discount, super.key});

  final Therapist therapist;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () =>
            context.go('${AppRouter.therapistsListPath}/${therapist.id}'),
        highlightColor: context.scheme.primary.withOpacity(.2),
        child: Container(
          margin: const EdgeInsets.all(30),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedAvatar(
                therapist.avatar,
                size: 56,
              ),
               const Gap(16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${therapist.name} ${therapist.surname}',
                                style: context.textTheme.titleLarge,
                                maxLines: 2,
                              ),
                              const Gap(4),
                                Text(
                                  therapist.mainSpecialization!,
                                  style: context.textTheme.bodySmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                        Icon(
                          OutlineIcons.right,
                          color: context.scheme.onBackground,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                   Icons.business_center,
                                  color: Color(0xFF38B7FF),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Опыт работы - ${therapist.experience} лет',
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text( ///Отедяем пробелом последние 3 цифры, если число черырёхзначное
                              '${therapist.costOfServices.toString().replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]} ',
                              )} ₽̶',
                              style: context.textTheme.titleLarge,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
