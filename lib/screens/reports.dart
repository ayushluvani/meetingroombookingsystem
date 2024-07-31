import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(187, 217, 215, 1.0),
      appBar: AppBar(
        title: Text('Reports'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.notifications_off,
                size: 100.0,
                color: Colors.grey,
              ),
              SizedBox(height: 20.0),
              Text(
                'You have not booked any meeting room.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal[800],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
