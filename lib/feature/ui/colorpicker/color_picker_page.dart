import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../widget/elevated_button_widget.dart';
import '../../widget/scaffold_widget.dart';
import '../../widget/text_form_field_widget.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key, this.cController});
  final TextEditingController? cController;

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return AltaScaffold(
      title: 'Pilih sebuah warna',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AltaTextFormField(
                controller: widget.cController ?? TextEditingController(),
                keyboardType: TextInputType.none,
                suffixText: 'Warna : ',
                suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                            color: _currentColor, shape: BoxShape.circle))),
                hintText: 'Pilih warna',
                onTap: () => pickColor(context)),
            const SizedBox(height: 16.0),
            AltaElevatedButton(
                onPressed: () => Navigator.pop(context, _currentColor),
                child: const Text('SIMPAN')),
          ],
        ),
      ),
    );
  }

  void pickColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorPicker(
                      pickerColor: _currentColor,
                      enableAlpha: false,
                      onColorChanged: (color) => _currentColor = color),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => {
                          Navigator.pop(context),
                          widget.cController?.text = _currentColor.toString(),
                          setState(() {}),
                        },
                    child: const Text('SIMPAN')),
              ],
            ));
  }
}
