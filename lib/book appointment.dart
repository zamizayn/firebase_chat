import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BookingAppointmentScreen extends StatefulWidget {
  @override
  _BookingAppointmentScreenState createState() => _BookingAppointmentScreenState();
}

class _BookingAppointmentScreenState extends State<BookingAppointmentScreen> {
  String selectedDate = '';
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'd MMM, yyyy',
              initialValue: '',
              firstDate: DateTime.now(),
              lastDate: DateTime(2025),
              icon: Icon(Icons.event),
              dateLabelText: 'Date',
              onChanged: (value) {
                setState(() {
                  selectedDate = value;
                });
              },
            ),
            DateTimePicker(
              type: DateTimePickerType.time,
              initialValue: '',
              icon: Icon(Icons.access_time),
              timeLabelText: 'Time',
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedDate.isNotEmpty && selectedTime.isNotEmpty) {
                  // Perform booking appointment logic here
                  print('Appointment booked for $selectedDate at $selectedTime');
                } else {
                  print('Please select a date and time');
                }
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}