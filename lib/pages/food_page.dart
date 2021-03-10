import 'package:fire_todo_app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Network'),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            //era un flatbutton
            return TextButton(
              style: TextButton.styleFrom(
                  //textStyle: Colors.black,
                  //backgroundColor: Colors.orange,
                  ),
              child: const Text(
                'Sign out',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                controller.signOut();
              },
            );
          })
        ],
      ),
      body: Center(
        child: Text(
          'Food Page',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
        ),
      ),
    );
  }
}
