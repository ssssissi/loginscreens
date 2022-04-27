import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:untitled/profile_page.dart';
import 'package:untitled/settings.dart';
import 'package:untitled/stocks.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Calender();
}

class _Calender extends State<Calender> {

  final CalendarController _controller = CalendarController();
  Color? _headerColor, _viewHeaderColor, _calendarColor;
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Client KYC'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('On this page you can see all the meetings and important dates you have.'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calendar"),
          centerTitle: true,
          backgroundColor: const Color(0xff051b47),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.info),
                onPressed: _showcontent),
            IconButton(icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  const Settings()));
                })
          ],
        ),
        bottomNavigationBar:
        BottomAppBar(
          color:const Color(0xff051b47),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>  const Calender()));
              }, icon: const Icon(Icons.calendar_today,color: Colors.white,
                  size:32)),
              const SizedBox(width: 80),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>  const Stocks()));
              }, icon: const Icon(Icons.analytics, color: Colors.white, size: 32)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(child: const Icon(Icons.account_circle,
            size: 50,
            color: Color(0xff051b47)),
            backgroundColor: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const MyProfile()));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: SfCalendar(
          view: CalendarView.week,
          showNavigationArrow: true,
          allowedViews: const [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month,

          ],
          viewHeaderStyle: ViewHeaderStyle(backgroundColor: _viewHeaderColor),
          backgroundColor: _calendarColor,
          controller: _controller,
          initialDisplayDate: DateTime.now(),
          dataSource: getCalendarDataSource(),
          onTap: calendarTapped,
          monthViewSettings: const MonthViewSettings(
              navigationDirection: MonthNavigationDirection.vertical),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (_controller.view == CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _controller.view = CalendarView.day;
    } else if ((_controller.view == CalendarView.week ||
        _controller.view == CalendarView.workWeek) &&
        calendarTapDetails.targetElement == CalendarElement.viewHeader) {
      _controller.view = CalendarView.day;
    }
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting with Elon (RISK=HIGH)',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4)),
      endTime: DateTime.now().add(const Duration(hours: 6)),
      subject: 'Check KYC of Elon (RISK=MEDIUM)',
      color: Colors.yellow,
    ));


    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}