import 'package:flutter/material.dart';

import 'package:flutter_spiks_test/generated/l10n.dart';

class TherapistsListFilter {
  static Future<void> openFilter(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return _TherapistsListFilter();
      },),
    );
  }
}

class _TherapistsListFilter extends StatefulWidget {
  @override
  _TherapistsListFilterState createState() => _TherapistsListFilterState();
}

class _TherapistsListFilterState extends State<_TherapistsListFilter> {
  double _startValue = 20; /// начальное значение для ползунка
  double _endValue = 60; /// конечное значение для ползунка
  int min = 0;       ///минимальная начальная цена услуг
  int max = 2500;    ///максимальная начальная цена услуг

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
                    style: const TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,),
                  ),
                ),
                Center(
                  child: Text(
                    S.of(context).filters,
                    style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,),

                  ),
                ),
                TextButton(
                  onPressed: () {
                    ///  логика сброса фильтра
                    setState(() {
                      _startValue = 18;
                      _endValue = 70;
                      int min = 0;
                      int max = 100000;
                    });
                  },
                  child: Text(
                    S.of(context).reset,
                    style: const TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Стоимость сессии',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      min = 0;
                      max = 2500;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (min == 0 && max == 2500) {
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
                    'До 2 500 ₽̶',
                    style: TextStyle(
                      color:
                          min == 0 && max == 2500 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      min = 2500;
                      max = 5000;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (min == 2500 && max == 5000) {
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
                      color: min == 2500 && max == 5000
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      min = 5000;
                      max = 100000;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (min == 5000 && max == 100000) {
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
                    'Более 5 000 ₽̶',
                    style: TextStyle(
                      color: min == 5000 && max == 100000
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Возраст психолога',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      '${_startValue.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: RangeSlider(
                      values: RangeValues(_startValue, _endValue),
                      min: 18,
                      max: 70,
                      divisions: 52,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '${_endValue.round()}',
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
            // Действия
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
          child: const Text(
            'Показать психологов',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
