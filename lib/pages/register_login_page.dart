import 'package:fire_todo_app/controllers/register_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const logoSize = 70.0;

class RegisterLoginPage extends StatelessWidget {
  final controller = Get.put(LoginRegisterController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register Page'),
      // ),
      body: GetBuilder<LoginRegisterController>(
        init: LoginRegisterController(),
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
                      bottom: logoSize,
                      left: -moreSize,
                      right: -moreSize,
                      height: width + moreSize,
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
                        radius: logoSize,
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
                  key: controller.formKey,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            //style para cambiar el color del input
                            style: TextStyle(color: Colors.black),
                            //modificar
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
                            style: TextStyle(color: Colors.black),
                            textCapitalization: TextCapitalization.none,
                            controller: controller.passwordController,
                            //keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: 'Password',
                              labelText: 'Password',
                              //icon: Icon(Icons.account_circle),
                              suffixIcon: Icon(
                                  Icons.no_encryption_gmailerrorred_outlined),
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
                            // boton registrar
                            padding: const EdgeInsets.only(top: 16.0),
                            alignment: Alignment.center,
                            //antes era un raisedbutton
                            child: ElevatedButton(
                              style: ButtonStyle(),
                              //color: Colors.white,
                              //elevation: 8.0,
                              //shape: StadiumBorder(),
                              child: Text('Registrarme'),
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
