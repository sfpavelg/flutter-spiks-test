import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapist_item.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapists_list_filter.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
import 'package:flutter_spiks_test/widgets/scroll_views/paginated_list/paginated_sliver_list.dart';
import 'package:flutter_spiks_test/widgets/scroll_views/paginated_list/values/pagination_status.dart';

import '../../../core/values/icons/outline_icons.dart';
import '../../../data/repositories/therapists_list_data/therapists_data.dart';

/// Страница просмотра списка терапевтов
/// @TODO реализовать
class TherapistsListPage extends StatelessWidget {
  const TherapistsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).therapists),
        automaticallyImplyLeading: false,
        shape: const ContinuousRectangleBorder(
          //Закругляем края
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(48),
            bottomRight: Radius.circular(48),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async =>
                await TherapistsListFilter.openFilter(context),
            icon: Icon(OutlineIcons.settings),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          PaginatedSliverList(
            paginationStatus: PaginationStatus.lastPage,
            builder: (context, index) => TherapistListItem(
              therapist: therapistsList[index],
            ),
            childCount: therapistsList.length,
            separatorBuilder: (
              BuildContext context,
              int index,
            ) =>
                const Divider(height: 0),
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
