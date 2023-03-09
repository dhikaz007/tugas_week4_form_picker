// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

import '../../widget/elevated_button_widget.dart';
import '../../widget/label_text_widget.dart';
import '../../widget/scaffold_widget.dart';
import '../../widget/text_form_field_widget.dart';
import '../colorpicker/color_picker_page.dart';
import '../datepicker/date_picker_page.dart';
import '../filepicker/file_picker_page.dart';
import 'preview_post_page.dart';

class CreatePostPage extends StatefulWidget {
  late String nameController = TextEditingController().text;
  late String emailController = TextEditingController().text;
  CreatePostPage(
      {super.key, required this.nameController, required this.emailController});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  File? _displayFile;
  DateTime? _selectedDate;
  Color? _currentColor;

  final TextEditingController _fileController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AltaScaffold(
      title: 'Welcome, ${widget.nameController}',
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AltaLabelText(title: 'Cover'),
                const SizedBox(height: 4.0),
                AltaTextFormField(
                    controller: _fileController,
                    keyboardType: TextInputType.none,
                    hintText: 'Pilih cover file'),
                const SizedBox(height: 16.0),
                const AltaLabelText(title: 'Publish At'),
                const SizedBox(height: 4.0),
                AltaTextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.none,
                    hintText: 'Pilih tanggal'),
                const SizedBox(height: 16.0),
                const AltaLabelText(title: 'Color Theme'),
                const SizedBox(height: 4.0),
                AltaTextFormField(
                    controller: _colorController,
                    keyboardType: TextInputType.none,
                    hintText: 'Pilih warna',
                    suffixText: 'Warna : ',
                    suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                                color: _currentColor,
                                shape: BoxShape.circle)))),
                const SizedBox(height: 16.0),
                const AltaLabelText(title: 'Caption'),
                const SizedBox(height: 8.0),
                AltaTextFormField(
                    controller: _captionController,
                    keyboardType: TextInputType.text,
                    maxLines: 5),
                const SizedBox(height: 32.0),
                AltaElevatedButton(
                    minimumSize: MaterialStateProperty.all(const Size(160, 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    child: const Text('Simpan'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return PreviewPostPage(
                            pFile: _displayFile,
                            finalDate: _selectedDate,
                            finalColor: _currentColor,
                            caption: _captionController,
                            nameController: widget.nameController,
                            emailController: widget.emailController,
                          );
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data Tersimpan')));
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
      child: ListView(children: [
        UserAccountsDrawerHeader(
            accountName: Text(widget.nameController),
            accountEmail: Text(widget.emailController),
            currentAccountPicture: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter-logo.png'))),
        ListTile(
            leading: const Icon(Icons.attach_file_rounded),
            title: const Text('File'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) =>
                        FilePickerPage(fController: _fileController)))
                .then((updatedFile) => {
                      _displayFile = updatedFile,
                      debugPrint('$updatedFile'),
                      setState(() {}),
                    })),
        ListTile(
            leading: const Icon(Icons.calendar_today_rounded),
            title: const Text('Kalender'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) =>
                        DatePickerPage(dController: _dateController)))
                .then((updatedDate) => {
                      _selectedDate = updatedDate,
                      setState(() {}),
                    })),
        ListTile(
            leading: const Icon(Icons.color_lens_rounded),
            title: const Text('Warna'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) =>
                        ColorPickerPage(cController: _colorController)))
                .then((updatedColor) => {
                      _currentColor = updatedColor,
                      setState(() {}),
                    })),
        const Divider(thickness: 3),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AltaElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('SELESAI')),
        )
      ]),
    );
  }
}
