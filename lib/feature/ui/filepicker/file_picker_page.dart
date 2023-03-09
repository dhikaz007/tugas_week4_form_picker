import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../widget/elevated_button_widget.dart';
import '../../widget/scaffold_widget.dart';
import '../../widget/text_form_field_widget.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({super.key, required this.fController});
  final TextEditingController? fController;

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  PlatformFile? _file;
  FilePickerResult? _result;
  String? _filesName;
  File? _displayFile;

  @override
  Widget build(BuildContext context) {
    return AltaScaffold(
      title: 'Pilih sebuah file',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AltaTextFormField(
                controller: widget.fController ?? TextEditingController(),
                keyboardType: TextInputType.none,
                hintText: 'Pilih file',
                onTap: () => pickFile()),
            const SizedBox(height: 16.0),
            AltaElevatedButton(
                onPressed: () => Navigator.pop(context, _displayFile),
                child: const Text('SIMPAN')),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    _result = await FilePicker.platform.pickFiles();
    if (_result == null) return;
    _filesName = _result!.files.first.name;
    _file = _result!.files.first;
    _displayFile = File(_file!.path.toString());
    widget.fController?.text = _filesName ?? '';
    //debugPrint('File Name $filesName');

    setState(() {});
  }
}
