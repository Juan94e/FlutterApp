import 'package:fire_todo_app/pages/food_page.dart';
import 'package:fire_todo_app/pages/home_page.dart';
import 'package:fire_todo_app/pages/login_page.dart';
import 'package:fire_todo_app/pages/register_login_page.dart';
import 'package:fire_todo_app/pages/welcome_page.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(
          name: "/registration",
          page: () => RegisterLoginPage(),
          transition: Transition.zoom),
      GetPage(name: "/loginpage", page: () => LoginPage()),
      GetPage(name: "/logingoogle", page: () => LoginPage()),
      GetPage(name: "/welcomepage", page: () => WelcomePage()),
      GetPage(
          name: "/foodpage", //con p minus
          page: () => FoodPage(),
          transition: Transition.zoom),
    ];
