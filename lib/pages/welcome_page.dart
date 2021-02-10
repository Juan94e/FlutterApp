import 'package:fire_todo_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DeliveryColors.green,
              DeliveryColors.purple,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 130,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset('assets/images/repairs.png'),
                ),
              ),
            ),
            // SizedBox(
            //   height: 30.0,
            // ),
            // Text('Bienvenido a Nito-App', textAlign),
            Container(
              //como ponerle un shadow del otro color
              child: SignInButtonBuilder(
                elevation: 8.0,
                shape: StadiumBorder(),
                icon: Icons.person_add,
                backgroundColor: Colors.blueAccent,
                text: 'Registrate',
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
      ),
    );
  }
}
