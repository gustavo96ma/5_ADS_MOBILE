import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: deviceWidth,
          child: Row(
            children: [
              Container(
                color: Color(0xff84996c),
                width: 200,
                height: double.infinity,
                child: Column(
                  children: [
                    Text('Ensala+', style: TextStyle(fontSize: 28)),
                    Divider(thickness: 2, color: Colors.black),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Ensalamento',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Divider(thickness: 1, color: Colors.black),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Salas',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),

                    Divider(thickness: 1, color: Colors.black),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Turmas',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),

                    Divider(thickness: 1, color: Colors.black),
                  ],
                ),
              ),
              Container(
                child: SfCalendar(
                  view: CalendarView.workWeek,
                  timeSlotViewSettings: TimeSlotViewSettings(
                    startHour: 9,
                    endHour: 16,
                    nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
