// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widget/elevated_button_widget.dart';
import '../../widget/scaffold_widget.dart';

class DatePickerPage extends StatefulWidget {
  DatePickerPage({super.key, this.dController});
  late TextEditingController? dController;

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AltaScaffold(
      title: 'Pilih tanggal',
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CalendarDatePicker(
                  initialDate: _selectedDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(DateTime.now().year + 5),
                  onDateChanged: (DateTime value) {
                    _selectedDate = value;
                    setState(() {});
                    widget.dController?.text =
                        'Published: ${DateFormat('EEE, M/d/y').format(value)}';
                  }),
              const SizedBox(height: 16.0),
              AltaElevatedButton(
                  onPressed: () => Navigator.pop(context, _selectedDate),
                  child: const Text('SIMPAN')),
            ],
          ),
        ),
      ),
    );
  }

// Future<void> selectDate(BuildContext context) async {
//   selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1990),
//       lastDate: DateTime(DateTime.now().year + 5));
//   if (selectedDate != null) {
//     widget.dController?.text =
//         'Published: ${DateFormat('EEE, M/d/y').format(selectedDate ?? DateTime.now())}';
//   }
// }
}
