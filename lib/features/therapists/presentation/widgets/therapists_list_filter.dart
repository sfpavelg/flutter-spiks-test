import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class TherapistsListFilter {
  static Future<void> openFilter(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return _TherapistsListFilter();
      }),
    );
  }
}

class _TherapistsListFilter extends StatelessWidget {
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
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Center(
                  child: Text(
                    S.of(context).filters,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Ваша логика сброса фильтра
                  },
                  child: Text(
                    S.of(context).reset,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
