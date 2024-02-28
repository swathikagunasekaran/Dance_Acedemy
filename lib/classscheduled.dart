import 'package:flutter/material.dart';
import 'package:sknk/calender/meeting_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:sknk/calender/meetings.dart';

class ClassScheduled extends StatefulWidget {
  const ClassScheduled({super.key});

  @override
  State<ClassScheduled> createState() => _ClassScheduledState();
}

class _ClassScheduledState extends State<ClassScheduled> {

     List<Meetings> _getDataSource(){
       final List<Meetings> m = <Meetings>[];
       final DateTime today = DateTime.now();
       final DateTime startTime = DateTime(today.year , today.month , today.day,9,0,0);
       final DateTime endTime = startTime.add(const Duration(hours:2));

       final List<String> activities1 = [
         'Workout Session - 1',
         'Workout Session - 2',
         'Workout Session - 3',
         'Workout Session - 4',
         'Workout Session - 5',
         'Workout Session - 6',
         'Workout Session - 7',
       ];
       final List<String> activities2 = [
         'Alarippu - Session 1',
         'Alarippu - Session 2',
         'Alarippu - Session 3',
         'Jathesvaram - session 1',
         'Jathesvaram - session 2',
         'Jathesvaram - session 3',
         'Jathesvaram - session 4',
       ];

       for (int i = 0; i < 7; i++) {
         final DateTime classStartTime = startTime.add(Duration(days: i));
         final DateTime classEndTime = endTime.add(Duration(days: i));
         m.add(Meetings(activities1[i], classStartTime, classEndTime, Colors.blue, false));
         m.add(Meetings(activities2[i], classStartTime.add(Duration(hours: 3)), classEndTime.add(Duration(hours: 3)), Colors.blue, false));
       }
       return m;
     }

     CalendarView calendarView = CalendarView.month;
     CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calender' , style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          Row(
            children: [
              OutlinedButton(onPressed: (){
                setState(() {
                     calendarView=CalendarView.month;
                     calendarController.view = calendarView;
                });
                }, child: const Text("Month View")),
              OutlinedButton(onPressed: (){
                setState(() {
                  calendarView = CalendarView.week;
                  calendarController.view = calendarView;
                });
              }, child: const Text("Week View")),
              OutlinedButton(onPressed: (){
                setState(() {
                  calendarView = CalendarView.day;
                  calendarController.view = calendarView;
                });
                  }, child: const Text("Day view")),
            ],
      ),
      Expanded(
      child: SfCalendar(
        view: calendarView,
        initialSelectedDate: DateTime.now(),
        controller: calendarController,
        cellBorderColor: Colors.blueGrey,
        dataSource: MeetingDataSource(_getDataSource()),
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.red , width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode:
            MonthAppointmentDisplayMode.indicator,showAgenda:true, ),
        blackoutDates: [
          DateTime.now().subtract(Duration(hours: 48)),
          DateTime.now().subtract(Duration(hours:24)),
        ],
      ),
      ),
       ],
      ),
    );


  }
}