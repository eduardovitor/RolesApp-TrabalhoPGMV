import 'package:rolesapp/create_role.dart';
import 'package:rolesapp/feed.dart';
import 'package:rolesapp/perfil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences loginData;
  late SharedPreferences email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      email = loginData.getString('email') as SharedPreferences;
    });
  }

  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      Feed(),
      CreateRole(),
      Text('Página3'),
      Perfil()
    ];
    return Scaffold(
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.purple,
        unselectedItemColor: CustomColors.DimGray,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.now_wallpaper),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Rolês',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Amigos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          )
        ],
      ),
    );
  }

//logindata.setBool('login', true);
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
