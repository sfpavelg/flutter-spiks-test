import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';
import 'package:flutter_spiks_test/data/repositories/therapists_list_data/therapist_list_detail_data.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_state.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapist_item.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapists_list_filter.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
import 'package:flutter_spiks_test/widgets/scroll_views/paginated_list/paginated_sliver_list.dart';
import 'package:flutter_spiks_test/widgets/scroll_views/paginated_list/values/pagination_status.dart';

/// Страница просмотра списка терапевтов
/// @TODO реализовать
class TherapistsListPage extends StatelessWidget {
  // TherapistsListPage({required this.therapistsBloc, super.key});
  TherapistsListPage({super.key});

  final TherapistsBloc therapistsBloc = TherapistsBloc();
  //final TherapistsBloc therapistsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).therapists),
        automaticallyImplyLeading: false,
        shape: const ContinuousRectangleBorder(
          ///Закругляем края
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(48),
            bottomRight: Radius.circular(48),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async => TherapistsListFilter.openFilter(context,
                therapistsBloc,),
            icon: const Icon(OutlineIcons.settings),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => therapistsBloc,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<TherapistsBloc, TherapistsState>(
              bloc: therapistsBloc,
              builder: (context, state) {
                print( 'Значение эвента: ${state.startAge}');
                return PaginatedSliverList(
                  paginationStatus: PaginationStatus.lastPage,
                  builder: (context, index) => TherapistListItem(
                    therapist: therapistsListDetail[index],
                    startAge: state.startAge,
                    endAge: state.endAge,
                    minCostOfServices: state.minCostOfServices,
                    maxCostOfServices: state.maxCostOfServices,
                  ),
                  childCount: therapistsListDetail.length,
                  separatorBuilder: (
                    BuildContext context,
                    int index,
                  ) =>
                      const Divider(height: 1),
                );
              },
            ),
          ],
        ),
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
