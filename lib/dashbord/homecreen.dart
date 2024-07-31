import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:intl/intl.dart';

import '../screens/availability_page.dart';
import '../screens/meetingcalender.dart';
import '../screens/notificatoinpage.dart';
import '../screens/reports.dart';
import '../screens/slotbooking.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {

  // Define borders for each index
  final List<BoxDecoration> itemBorders = [
    BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
        bottom: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
      ),
    ),
    BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
        bottom: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
      ),
    ),
    BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromRGBO(16, 47, 43, 1.0), width: 0.0),  // No right border
        bottom: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
      ),
    ),
    BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
        bottom: BorderSide(color: Color.fromRGBO(16, 47, 43, 1.0), width: 1.0),
      ),
    ),
    BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromRGBO(224, 199, 167, 0.3), width: 1.0),
        bottom: BorderSide(color: Color.fromRGBO(16, 47, 43, 1.0), width: 0.0),  // No bottom border
      ),
    ),
    BoxDecoration(
      border: Border(
        right: BorderSide(color: Color.fromRGBO(16, 47, 43, 1.0), width: 0.0),  // No right border
        bottom: BorderSide(color: Color.fromRGBO(16, 47, 43, 1.0), width: 0.0),  // No bottom border
      ),
    ),
  ];

  final List<String> itemNames = [
    'Meeting Room',
    'Book Room',
    'Report',
    'Calendar',
    'Notification',
    'Profile',
  ];

  final List<IconData> icons = [
    Icons.sensor_door_rounded,
    Icons.meeting_room,
    Icons.assignment_outlined,
    Icons.calendar_today,
    Icons.notifications,
    Icons.person,
  ];

  String userName = "Ayush Luvani";
  String userRole = "Admin";

  @override
  void initState() {
    super.initState();
  }

  void showUnavailableDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(16, 47, 43, 1.0), // Background color of the dialog
          title: Text(
            'Unavailable',
            style: TextStyle(
              color: Color.fromRGBO(187, 217, 215, 1.0), // Title text color
            ),
          ),
          content: Text(
            'This feature is not available right now.',
            style: TextStyle(
              color: Color.fromRGBO(224, 199, 167, 1.0), // Content text color
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color.fromRGBO(224, 199, 167, 1.0), // Button text color
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  void navigateToPage(int index) {
    if (index == 0 || index == itemNames.length - 1) {
      showUnavailableDialog();
    } else {
      switch (index) {
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingPage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportsPage()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MeetingSchedule()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationPage()),
          );
          break;
        case 5:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DailyPage()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Color.fromRGBO(66, 92, 89, 1.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(187, 217, 215, 1.0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25, right: 20, left: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/employee/admin_img.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: 150,
                                child: Column(
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(16, 47, 43, 1.0),
                                        ),
                                        child: Text(userName)
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DefaultTextStyle(
                                      child: Text(userRole),
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: AnalogClock(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3.0),
                          color: Color.fromRGBO(16, 47, 43, 1.0),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        width: 150.0,
                        isLive: true,
                        hourHandColor: Color.fromRGBO(224, 199, 167, 1.0),
                        minuteHandColor: Color.fromRGBO(224, 199, 167, 1.0),
                        showSecondHand: true,
                        numberColor: Color.fromRGBO(224, 199, 167, 1.0),
                        showNumbers: true,
                        textScaleFactor: 1.4,
                        showTicks: true,
                        showDigitalClock: false,
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(16, 47, 43, 1.0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Color.fromRGBO(224, 199, 167, 1.0),
                            padding: EdgeInsets.all(8.0),
                            child: DefaultTextStyle(
                              child: Text(
                                DateFormat('MMMM').format(DateTime.now()), // Month name
                                textAlign: TextAlign.center,
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(16, 47, 43, 1.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                            child: DefaultTextStyle(
                              child: Text(
                                DateFormat('d').format(DateTime.now()), // Day of the month
                              ),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(224, 199, 167, 1.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: DefaultTextStyle(
                              child: Text(
                                DateFormat('EEEE').format(DateTime.now()), // Day of the week
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(224, 199, 167, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(16, 47, 43, 1.0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 10,
                    ),
                  ],
                ),
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: screenHeight - 100,
                    width: screenWidth - 50,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                      ),
                      itemCount: itemNames.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: itemBorders[index],  // Apply border configuration from the list
                          child: GestureDetector(
                            onTap: () => navigateToPage(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      icons[index],
                                      color: Color.fromRGBO(224, 199, 167, 1.0),
                                      size: 50,
                                    ),
                                    SizedBox(height: 10),
                                    DefaultTextStyle(
                                      child: Text(
                                        itemNames[index],
                                      ),
                                      style: TextStyle(
                                        color: Color.fromRGBO(224, 199, 167, 1.0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
