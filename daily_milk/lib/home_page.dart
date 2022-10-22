import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: const Center(child: Text('Test Data')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
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
}
