import 'package:fire_todo_app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

const _logoSize2 = 70.0;

class LoginPage extends StatelessWidget {
  final _controller2 = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final _size2 = MediaQuery.of(context).size;
    final _width2 = _size2.width;
    final _moreSize2 = 50.0;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green[200],
      //   title: Text('Login Page'),
      //   elevation: 0.0,
      //   actions: [
      //     TextButton(
      //       style: TextButton.styleFrom(
      //           //textStyle: Colors.black,
      //           //backgroundColor: Colors.orange,
      //           ),
      //       child: const Text(
      //         'Pagina principal',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       onPressed: () => Get.toNamed("/welcomepage"),
      //     ),
      //   ],
      // ),
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Column(
            children: [
              //expanded para crear logo.
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    //positioned para el circulo decorativo
                    Positioned(
                      bottom: _logoSize2,
                      left: -_moreSize2,
                      right: -_moreSize2,
                      height: _width2 + _moreSize2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(200),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: _logoSize2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset('assets/images/repairs.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //expanded de los textfields
              Expanded(
                flex: 4,
                child: Form(
                  key: _controller2.formKey,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            //style para cambiar el color del input
                            style: TextStyle(color: Colors.black),
                            autofocus: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: _controller2.emailController,
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            validator: (String value) {
                              if (value.isEmpty)
                                return 'please enter some text';
                              return null;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: _controller2.passwordController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            validator: (String value) {
                              if (value.isEmpty)
                                return 'please enter some text';
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ], //children del column
          );
        },
      ),
    );
  }
}
