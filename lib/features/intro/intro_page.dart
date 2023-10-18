import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/core/keys/app_keys.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/features/therapists/block/therapists_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/therapists_list_page.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
//import 'package:flutter_spiks_test/router/app_router.dart';
//import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
//import 'package:go_router/go_router.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => TherapistsBloc(),
    child:
      Scaffold(
      body: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 32,
            ),
            child: SizedBox.expand(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const RiveAnimation.asset('assets/rive/splash_animation.riv'),
                  Padding(
                    padding: EdgeInsets.only(bottom: 80),
                    child: Text(
                      'Тестовое задание\n Софеина Павла Геннадьевича',
                      style: context.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    key: const Key(WidgetKeys.introStartedButtonKey),
                    onPressed: () {
                      // router push to HOME
                      // context.push(AppRouter.therapistsListPath);
                      ///Получите экземпляр TherapistsBloc из BlocProvider
                      // final therapistsBloc = context.read<TherapistsBloc>();
                      /// Передайте экземпляр TherapistsBloc в маршрут с помощью параметров маршрута
                      // // context.push(
                      // context.go(
                      //   AppRouter.therapistsListPath,
                         // arguments: {'therapistsBloc': therapistsBloc},
                        // goArguments: GoArguments(extra: {'therapistsBloc': therapistsBloc}),
                      //   //  goArguments: GoArguments(extra: {'therapistsBloc': therapistsBloc}),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TherapistsListPage()),
                      );
                    },
                    child: Text(S.of(context).therapists),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );//scaffold
  }
}
