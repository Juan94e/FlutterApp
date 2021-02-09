import 'package:fire_todo_app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Form(
                key: controller.formKey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: const Text(
                            'Login Page',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (String value) {
                            if (value.isEmpty) return 'please enter some text';
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          validator: (String value) {
                            if (value.isEmpty) return 'please enter some text';
                            return null;
                          },
                          obscureText: true,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          alignment: Alignment.center,
                          child: SignInButton(
                            Buttons.Email,
                            //shape: StadiumBorder(),
                            text: "Sign In",
                            onPressed: () async {
                              _.signInWithEmailAndPassword();
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          alignment: Alignment.center,
                          child: SignInButton(
                            Buttons.GoogleDark,
                            text: "Sign in with Google",
                            onPressed: () async {
                              _.signInWithGoogle();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}