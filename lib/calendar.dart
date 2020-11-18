import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() {
    return CalendarScreenState();
  }
}

class CalendarScreenState extends State<CalendarScreen> {
  CalendarController controller = CalendarController();
// calendar example
  var arr = new List(7);

  @override
  Widget build(BuildContext context) {
    arr[0] = "Mon";
    arr[1] = "Tue";
    arr[2] = "Wed";
    arr[3] = "Thu";
    arr[4] = "Fri";
    arr[5] = "Sat";
    arr[6] = "Sun";

    return Scaffold(
        body: Center(
      child: TableCalendar(
        calendarController: controller,
        initialCalendarFormat: CalendarFormat.week,
        headerVisible: false,
        builders: CalendarBuilders(
          // week days
          dowWeekdayBuilder: (context, weekday) {
            return Container();
          },
          // dates
          dayBuilder: (context, date, events) {
            print(date.month);
            return Container(
              //  color: Colors.green,
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: Border.all(color: const Color(0xffd6edff), width: 1)),

              child: Column(
                children: [
                  _showDate(date),
                  _showWeek(date),
                ],
              ),

              // ),
              // )),
            );
            //);
          },
        ),
      ),
    ));
  }

  Widget _showDate(DateTime date) {
    return Container(
        padding: EdgeInsets.all(2), child: Text(arr[date.weekday - 1]));
  }

  Widget _showWeek(DateTime date) {
    return Container(padding: EdgeInsets.all(2), child: Text('${date.day}'));
  }
}
