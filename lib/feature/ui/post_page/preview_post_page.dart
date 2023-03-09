// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../widget/elevated_button_widget.dart';
import '../../widget/list_tile_widget.dart';
import '../../widget/scaffold_widget.dart';
import '../../widget/text_form_field_widget.dart';
import '../main/main_page.dart';

class PreviewPostPage extends StatelessWidget {
  PreviewPostPage(
      {super.key,
      required this.pFile,
      required this.finalDate,
      required this.finalColor,
      required this.caption,
      required this.nameController,
      required this.emailController});

  final File? pFile;
  final DateTime? finalDate;
  final Color? finalColor;
  final TextEditingController? caption;
  late String nameController = TextEditingController().text;
  late String emailController = TextEditingController().text;

  late String formatDate;

  @override
  Widget build(BuildContext context) {
    TextEditingController dController = TextEditingController();

    if (finalDate != null) {
      formatDate =
          'Published: ${DateFormat('EEE, M/d/y').format(finalDate ?? DateTime.now())}';
      dController.text = formatDate;
    }

    return AltaScaffold(
      title: 'Preview State',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (pFile != null) Image.file(pFile!),
            const SizedBox(height: 8.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AltaTextFormField(
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                    keyboardType: TextInputType.none,
                    controller: dController,
                    enabledBorder: InputBorder.none,
                    suffixText: 'Color : ',
                    suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: finalColor,
                            ))))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AltaTextFormField(
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                    controller: caption!,
                    enabledBorder: InputBorder.none,
                    onChanged: (value) => Text('$caption'))),
            AltaElevatedButton(
                onPressed: () => goToMainPage(context), child: Text('Go To Home'))
          ],
        ),
      ),
      child: ListView(children: [
        UserAccountsDrawerHeader(
            accountName: Text(nameController),
            accountEmail: Text(emailController),
            currentAccountPicture: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter-logo.png'))),
        ListTile(
          leading: const Icon(Icons.attach_file_rounded),
          title: const Text('Cover'),
          subtitle: Text('$pFile'),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_rounded),
          title: const Text('Calender'),
          subtitle: Text(formatDate),
        ),
        ListTile(
          leading: const Icon(Icons.color_lens_rounded),
          title: const Text('Color'),
          subtitle: Text('$finalColor'),
        ),
        const Divider(thickness: 3),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: AltaElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('SELESAI'))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AltaListTile(
              title: 'Exit Application'.toUpperCase(),
              icon: Icons.exit_to_app_rounded,
              onTap: () => _closeAppUsingSystemPop()),
        ),
      ]),
    );
  }

  goToMainPage(context) {
    final route = MaterialPageRoute(builder: (context) => const MainPage());
    Navigator.pushReplacement(context, route);
  }

  _closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
