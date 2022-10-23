import 'package:daily_milk/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DailyMilk extends StatelessWidget {
  const DailyMilk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Milk Tracker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const LandingPage(),
    );
  }
}
