import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BookingPage(),
    );
  }
}

class BookingPage extends StatelessWidget {
  final DateTime now = DateTime.now();
  late final BookingService mockBookingService;

  BookingPage() {
    mockBookingService = BookingService(
      serviceName: 'Mock Service',
      serviceDuration: 30,
      bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
      bookingStart: DateTime(now.year, now.month, now.day, 8, 0),
    );
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    DateTime first = now;
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(DateTimeRange(
        start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 92, 89, 1.0),
      appBar: AppBar(
        title: Text('Book Your Room'),
        backgroundColor: Color.fromRGBO(224, 199, 167, 0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: BookingCalendar(
          bookingService: mockBookingService,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          bookingButtonColor: Color.fromRGBO(224, 199, 167, 1.0),
          bookingButtonText: 'Book Now',
          bookingExplanation: Text(
            'Select a slot to book Meeting room.',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(224, 199, 167, 1.0),
            ),
          ),
          bookingGridChildAspectRatio: 1.5,
          bookingGridCrossAxisCount: 3,
          formatDateTime: (DateTime dateTime) => '${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
          availableSlotColor: Colors.green,
          availableSlotText: 'Available',
          bookedSlotColor: Colors.red,
          bookedSlotText: 'Booked',
          selectedSlotColor: Colors.blue,
          selectedSlotText: 'Selected',
          gridScrollPhysics: BouncingScrollPhysics(),
          loadingWidget: Center(child: CircularProgressIndicator()),
          errorWidget: Center(child: Text('Error loading slots')),
          uploadingWidget: Center(child: Text('Uploading...')),
          pauseSlotColor: Colors.orange,
          pauseSlotText: 'Pause',
          hideBreakTime: false,
          locale: null, // Removed locale to avoid issues
          disabledDays: [0, 6], // Disable Sunday (0) and Saturday (6)
          startingDayOfWeek: StartingDayOfWeek.monday,
        ),
      ),
    );
  }
}
