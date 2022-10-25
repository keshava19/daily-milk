import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1997, 2, 27),
        lastDate: DateTime(2097, 11, 19),
        onDateChanged: (_) {},
      ),
    );
  }
}
