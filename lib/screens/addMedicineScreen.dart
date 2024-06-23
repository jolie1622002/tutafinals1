import 'package:flutter/material.dart';
import 'Register/notification_service.dart'; // Adjust the import based on the actual location of NotificationService

class AddMedicineScreen extends StatefulWidget {
  static const routeName = '/add-medicine';

  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  TextEditingController medicineNameController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: medicineNameController,
              decoration: InputDecoration(labelText: 'Medicine Name'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Reminder Time: ${selectedTime.format(context)}'),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (picked != null && picked != selectedTime)
                      setState(() {
                        selectedTime = picked;
                      });
                  },
                  child: Text('Select Time'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                scheduleMedicineReminder();
              },
              child: Text('Save Reminder'),
            ),
          ],
        ),
      ),
    );
  }

  void scheduleMedicineReminder() {
    final String medicineName = medicineNameController.text;
    if (medicineName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the medicine name')),
      );
      return;
    }

    final now = TimeOfDay.now();
    final int hour = selectedTime.hour - now.hour;
    final int minute = selectedTime.minute - now.minute;

    NotificationService().scheduleNotification(
      id: 1,
      title: 'Medicine Reminder',
      body: 'Time to take your medicine: $medicineName',
      scheduledNotificationDateTime: DateTime.now().add(Duration(hours: hour, minutes: minute)),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reminder set for $medicineName')),
    );
  }
}
