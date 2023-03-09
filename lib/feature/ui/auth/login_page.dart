import 'package:flutter/material.dart';
import '../../widget/elevated_button_widget.dart';
import '../../widget/scaffold_widget.dart';
import '../../widget/text_form_field_widget.dart';
import '../post_page/create_post_page.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final auth = Authentication();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final fKey = GlobalKey<FormState>();

    return AltaScaffold(
      title: 'Login Screen',
      body: Form(
        key: fKey,
        child: Card(
          child: Column(
            children: [
              AltaTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  labelText: 'Username',
                  hintText: 'Andhika'),
              AltaTextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email address',
                  hintText: 'flutter@alta.com'),
              AltaTextFormField(
                  controller: passController,
                  keyboardType: TextInputType.text,
                  labelText: 'Password',
                  hintText: 'flutter123',
                  obscureText: true),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: AltaElevatedButton(
                            onPressed: () => {
                                  if (auth.fetchCredentials(
                                      nameController.text,
                                      passController.text,
                                      emailController.text))
                                    {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreatePostPage(
                                                    nameController:
                                                        nameController.text,
                                                    emailController:
                                                        emailController.text,
                                                  )),
                                          (route) => false),
                                    }
                                },
                            child: const Text('LOGIN')))
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
