import 'package:fire_todo_app/controllers/register_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterLoginPage extends StatelessWidget {
  final controller = Get.put(LoginRegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: GetBuilder<LoginRegisterController>(
        init: LoginRegisterController(),
        builder: (_) {
          return Form(
            key: controller.formKey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      textCapitalization: TextCapitalization.none,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Email',
                        labelText: 'Email',
                        //icon: Icon(Icons.account_circle),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    //PASWORD
                    TextFormField(
                      textCapitalization: TextCapitalization.none,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Password',
                        labelText: 'Password',
                        //icon: Icon(Icons.account_circle),
                        suffixIcon:
                            Icon(Icons.no_encryption_gmailerrorred_outlined),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: StadiumBorder(),
                        child: Text('Register'),
                        onPressed: () async {
                          _.register();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(controller.success == null
                          ? ''
                          : (controller.success
                              ? 'Successfully registered ' +
                                  controller.userEmail
                              : 'Registration failed')),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
