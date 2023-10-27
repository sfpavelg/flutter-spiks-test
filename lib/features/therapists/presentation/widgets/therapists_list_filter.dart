import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/configs/app_config.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_event.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class TherapistsListFilter {
  static Future<void> openFilter(
    BuildContext context,
    TherapistsBloc therapistsBloc,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return _TherapistsListFilter(therapistsBloc: therapistsBloc);
        },
      ),
    );
  }
}

class _TherapistsListFilter extends StatefulWidget {
  final TherapistsBloc therapistsBloc;

  _TherapistsListFilter({required this.therapistsBloc});

  @override
  _TherapistsListFilterState createState() =>
      _TherapistsListFilterState(therapistsBloc: therapistsBloc);
}

class _TherapistsListFilterState extends State<_TherapistsListFilter> {
  final TherapistsBloc therapistsBloc;

  _TherapistsListFilterState({required this.therapistsBloc});

  /// начальное значение для ползунка
  int _startAge = AppConfig.defaultStartAgeFilter;

  /// конечное значение для ползунка
  int _endAge = AppConfig.defaultEndAgeFilter;

  ///минимальная начальная цена услуг
  int _minCostOfServices = AppConfig.defaultMinCostOfServices;

  ///максимальная начальная цена услуг
  int _maxCostOfServices = AppConfig.defaultMaxCostOfServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    S.of(context).close,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    S.of(context).filters,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ///  логика сброса фильтра
                    setState(() {
                      _startAge = AppConfig.defaultStartAgeFilter;
                      _endAge = AppConfig.defaultEndAgeFilter;
                      _minCostOfServices = AppConfig.defaultMinCostOfServices;
                      _maxCostOfServices = AppConfig.defaultMaxCostOfServices;
                    });
                  },
                  child: Text(
                    S.of(context).reset,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(S.of(context).session_cost,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _minCostOfServices = 0;
                      _maxCostOfServices = 2500;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (_minCostOfServices == 0 &&
                            _maxCostOfServices == 2500) {
                          return const Color(0xFF38B7FF);
                        }
                        return const Color(0xFFE5F6FF);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Text(
                    S.of(context).up_to_2500R,
                    style: TextStyle(
                      color:
                          _minCostOfServices == 0 && _maxCostOfServices == 2500
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _minCostOfServices = 2500;
                      _maxCostOfServices = 5000;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (_minCostOfServices == 2500 &&
                            _maxCostOfServices == 5000) {
                          return const Color(0xFF38B7FF);
                        }
                        return const Color(0xFFE5F6FF);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Text(
                    '2 500 - 5 000 ₽̶',
                    style: TextStyle(
                      color: _minCostOfServices == 2500 &&
                              _maxCostOfServices == 5000
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _minCostOfServices = 5000;
                      _maxCostOfServices = 100000;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (_minCostOfServices == 5000 &&
                            _maxCostOfServices == 100000) {
                          return const Color(0xFF38B7FF);
                        }
                        return const Color(0xFFE5F6FF);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Text(
                    S.of(context).more_than_5000R,
                    style: TextStyle(
                      color: _minCostOfServices == 5000 &&
                              _maxCostOfServices == 100000
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _minCostOfServices = 0;
                      _maxCostOfServices = 100000;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (_minCostOfServices == 0 &&
                            _maxCostOfServices == 100000) {
                          return const Color(0xFF38B7FF);
                        }
                        return const Color(0xFFE5F6FF);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Text(
                     S.of(context).the_whole_price_range,
                    style: TextStyle(
                      color: _minCostOfServices == 0 &&
                              _maxCostOfServices == 100000
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).psychologists_age,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      '${_startAge.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: RangeSlider(
                      values:
                          RangeValues(_startAge.toDouble(), _endAge.toDouble()),
                      min: 18,
                      max: 70,
                      divisions: 52,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _startAge = values.start.round();
                          _endAge = values.end.round();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '${_endAge.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
        width: double.infinity,
        height: 64,
        child: ElevatedButton(
          onPressed: () {
            therapistsBloc.add(
              FilterEvent(
                _startAge,
                _endAge,
                _minCostOfServices,
                _maxCostOfServices,
              ),
            );
            context.pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) => const Color(0xFF38B7FF),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          child: Text(
            S.of(context).show_psychologists,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
