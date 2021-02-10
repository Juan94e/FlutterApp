import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          // FloatingActionButton(
          //   onPressed: () => Get.toNamed("/welcomepage"),
          // ),
          Container(
            //como ponerle un shadow del otro color
            child: SignInButtonBuilder(
              elevation: 8.0,
              shape: StadiumBorder(),
              icon: Icons.person_add,
              backgroundColor: Colors.blueAccent,
              text: 'Registration',
              //con esto se navega entre rutas.
              onPressed: () => Get.toNamed("/registration"),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            //prueba
            child: SignInButtonBuilder(
              elevation: 8.0,
              shape: StadiumBorder(),
              icon: Icons.verified_user,
              backgroundColor: Colors.orange,
              text: 'Sign in',
              //con esto se navega entre rutas.
              onPressed: () => Get.toNamed("/loginpage"),
            ),
            padding: const EdgeInsets.all(26),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
