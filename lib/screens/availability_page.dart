import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  State<AvailabilityPage> createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String availabilityStatus = "";

  // Dummy function to check room availability
  bool _isRoomAvailable(DateTime date, TimeOfDay time) {
    return date.weekday != DateTime.sunday; // Assume rooms are unavailable on Sundays
  }

  Future<void> _selectDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year, now.month - 3),
      lastDate: DateTime(now.year, now.month + 3),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _updateAvailabilityStatus();
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _updateAvailabilityStatus();
      });
    }
  }

  void _updateAvailabilityStatus() {
    if (selectedDate != null && selectedTime != null) {
      bool isAvailable = _isRoomAvailable(selectedDate!, selectedTime!);
      setState(() {
        availabilityStatus = isAvailable
            ? 'The room is available!'
            : 'Sorry, the room is not available.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Room Availability'),
        backgroundColor: Color.fromRGBO(16, 47, 43, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _selectDate,
                  child: Text(selectedDate == null
                      ? 'Select Date'
                      : DateFormat('yyyy-MM-dd').format(selectedDate!)),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Select Time:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _selectTime,
                  child: Text(selectedTime == null
                      ? 'Select Time'
                      : selectedTime!.format(context)),
                ),
              ],
            ),
            SizedBox(height: 24),
            if (selectedDate != null && selectedTime != null) ...[
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(16, 47, 43, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    availabilityStatus,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
