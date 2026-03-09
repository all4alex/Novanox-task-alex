import 'package:flutter/material.dart';
import 'package:novanox_task_for_alex/home_screen.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('he')],
      path: 'assets/translations',
      useOnlyLangCode: true,

      fallbackLocale: const Locale('he'),
      child: TeamMamaApp(),
    ),
  );
}

class TeamMamaApp extends StatelessWidget {
  const TeamMamaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        return Directionality(
          textDirection: context.locale.languageCode == 'he'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xFFF6F7FB),
      ),
      home: HomeScreen()
    );
  }
}
