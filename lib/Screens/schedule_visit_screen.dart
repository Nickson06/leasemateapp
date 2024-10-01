import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleVisitScreen extends StatefulWidget {
  final String propertyName;
  final String propertyImage;

  ScheduleVisitScreen({
    required this.propertyName,
    required this.propertyImage,
  });

  @override
  _ScheduleVisitScreenState createState() => _ScheduleVisitScreenState();
}

class _ScheduleVisitScreenState extends State<ScheduleVisitScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isVisitScheduled = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _scheduleVisit() {
    // Implement schedule visit functionality here
    setState(() {
      _isVisitScheduled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Visit'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Details
            Row(
              children: [
                Image.asset(
                  widget.propertyImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.propertyName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Date Selection
            Text('Select Date:'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Pick a date'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Time Selection
            Text('Select Time:'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_selectedTime.format(context)}'),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Pick a time'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _scheduleVisit,
              child: Text('Schedule Visit'),
            ),

            // Confirmation Message
            if (_isVisitScheduled)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your visit has been scheduled!',
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
