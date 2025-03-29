import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:web/classroom_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              color: Color(0xff2b4612),
              width: 200,
              height: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Ensala+',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  Divider(thickness: 2, color: Colors.white),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Ensalamento',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.white),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ClassroomModal();
                        },
                      );
                    },
                    child: Text(
                      'Salas',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Divider(thickness: 1, color: Colors.white),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Turmas',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Divider(thickness: 1, color: Colors.white),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Professores',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
                child: Center(
                  child: TableCalendar(
                    onDaySelected: (selectedDay, focusedDay) {},
                    firstDay: DateTime.utc(2010, 01, 01),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: DateTime.now(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
