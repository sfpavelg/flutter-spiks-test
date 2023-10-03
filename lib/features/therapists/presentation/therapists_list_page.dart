import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapists_models.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapist_item.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapists_list_filter.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
import 'package:flutter_spiks_test/widgets/scroll_views/paginated_list/paginated_sliver_list.dart';
import 'package:flutter_spiks_test/widgets/scroll_views/paginated_list/values/pagination_status.dart';

import '../../../core/values/icons/outline_icons.dart';

/// Страница просмотра списка терапевтов
/// @TODO реализовать
class TherapistsListPage extends StatelessWidget {
  const TherapistsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Therapist> list = [
      Therapist(id: '1', name: 'Эмилия', surname: 'Кларк', experience: 8, avatar: 'i.pravatar.cc/150?img=1'),
      Therapist(id: '2', name: 'Лена', surname: 'Хинди', experience: 7, avatar: 'i.pravatar.cc/150?img=5'),
      Therapist(id: '3', name: 'Крисс', surname: 'Эванс', experience:11, avatar: 'i.pravatar.cc/150?img=11'),
      Therapist(id: '4', name: 'Девид', surname: 'Холс', experience: 9, avatar: 'i.pravatar.cc/150?img=13'),
      Therapist(id: '5', name: 'Дональд', surname: 'Девис', experience: 7, avatar: 'i.pravatar.cc/150?img=51'),
      Therapist(id: '6', name: 'Жеймс', surname: 'Жонсон', experience: 12, avatar: 'i.pravatar.cc/150?img=53'),
      Therapist(id: '7', name: 'Патрик', surname: 'Лоуренс', experience: 15, avatar: 'i.pravatar.cc/150?img=59'),
      Therapist(id: '8', name: 'Жефри', surname: 'Перес', experience: 10, avatar: 'i.pravatar.cc/150?img=68'),
      Therapist(id: '9', name: 'Синтия', surname: 'Лоу', experience: 11, avatar: 'i.pravatar.cc/150?img=49'),
      Therapist(id: '10', name: 'Мэри', surname: 'Кеннеди', experience: 7, avatar: 'i.pravatar.cc/150?img=16'),
      Therapist(id: '11', name: 'Гвендолин', surname: 'Роберсон', experience: 8, avatar: 'i.pravatar.cc/150?img=26'),
      Therapist(id: '12', name: 'Наоми', surname: 'Женкинс', experience: 9, avatar: 'i.pravatar.cc/150?img=32'),
      Therapist(id: '13', name: 'Диана', surname: 'Андерсон', experience: 11, avatar: 'i.pravatar.cc/150?img=47'),
      Therapist(id: '13', name: 'Сандра', surname: 'Томсон', experience: 8, avatar: 'i.pravatar.cc/150?img=48'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).therapists),
        automaticallyImplyLeading: false,
        shape: const ContinuousRectangleBorder(  //Закругляем края
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(48),
            bottomRight: Radius.circular(48),
          ),
        ),
        actions: [
          IconButton(onPressed: () async =>
              await TherapistsListFilter.openFilter(context),
            icon: Icon(OutlineIcons.settings),
          ),
        ],
      ),
      body: CustomScrollView(slivers: [
        PaginatedSliverList(
          paginationStatus: PaginationStatus.lastPage,
          builder: (context, index) =>
              TherapistListItem(
                therapist: list[index],
              ),
          childCount: list.length,
          separatorBuilder:
              (BuildContext context, int index,) =>  const Divider(height: 0),
        ),
      ],
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: context.scheme.primary.withOpacity(.2),
          ),
          child: const BottomNavBar(bottomNav: BottomNav.therapists),
      ),
    );
  }
}
