import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:timer/view/timer/custom/widgets/play_button.dart';
import 'package:timer/view/timer/screen.dart';
import 'package:timer/view/timer_settings/timer_settings.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<NavigationPage> {
  int _selectedIndex = 0;
  void changeTab() {
    if (mounted) setState(() {});
  }

  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  SnakeShape snakeShape = SnakeShape.indicator;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;
  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
  );
  EdgeInsets padding =
      const EdgeInsets.only(top: 2, bottom: 16, right: 12, left: 12);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<dynamic> _widgetOptions = [
    TimerPage(),
    // PlayButton(
    //   pauseIcon: Icon(Icons.pause, color: Colors.black, size: 40),
    //   playIcon: Icon(Icons.play_arrow, color: Colors.black, size: 40),
    //   onPressed: () {},
    // ),
    Center(
      child: Text("No Playlist found"),
    ),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //backgroundColor: themeProvider.themeMode().blendBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(fontFamily: 'avenir'),

        selectedItemColor: Colors.greenAccent.shade400,
        //  unselectedItemColor: Colors.grey.shade800,

        //configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.time,
                size: 30,
              ),
              label: 'Timer'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_albums, size: 30),
              label: 'Playlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined, size: 30), label: 'Settings'),
        ],
      ),
    );
  }
}
