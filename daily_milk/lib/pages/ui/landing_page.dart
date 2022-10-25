import 'package:daily_milk/pages/ui/calculate/calculate_page.dart';
import 'package:daily_milk/pages/ui/calendar/calendar_page.dart';
import 'package:daily_milk/pages/ui/home/home_page.dart';
import 'package:daily_milk/pages/ui/receipt/receipt_page.dart';
import 'package:daily_milk/pages/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int pageIndex = 0;

  final pages = const [
    HomePage(),
    CalendarPage(),
    CalculatePage(),
    ReceiptPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: pages.elementAt(pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.home,
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.calendar,
            icon: const Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.calculate,
            icon: const Icon(Icons.receipt),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.receipt,
            icon: const Icon(Icons.receipt_long),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.settings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
