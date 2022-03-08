import 'package:flutter/material.dart';
import 'package:rolesapp/home.dart';
import 'package:rolesapp/login.dart';

import 'data/shared_preferences_helper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferencesHelper sharedPref = SharedPreferencesHelper();
    bool isLogged = await sharedPref.getUserData();

    await Future.delayed(const Duration(seconds: 3));
    if (isLogged) {
      pushNavigator(const Home());
    } else {
      pushNavigator(const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
            child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image(image: AssetImage('assets/qualrole.png')).image,
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        )),
      ),
    );
  }

  void pushNavigator(Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
