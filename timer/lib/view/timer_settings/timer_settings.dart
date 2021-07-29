import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/view/spotify_auth_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1,
        //backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.manrope(
              fontSize: 21,
              // color: Colors.grey.shade900,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          // Icon(
          //   Icons.more_vert,
          //   size: 30,
          //   color: Colors.grey.shade900,
          // ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ListTile(
            leading: Container(
              width: 22,
              height: 27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  image: DecorationImage(
                      image: AssetImage("images/spotify_green.png"))),
            ),
            title: Text(
              'Get Playlist',
              style: GoogleFonts.actor(
                  //color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Connect to Spotify',
              style: GoogleFonts.actor(
                  //color: Colors.black.withOpacity(0.6)
                  ),
            ),
            trailing: TextButton(
              child: Text("Connect"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpotifyAuthPage()),
                );
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text(
              'Dark Mode',
              style: GoogleFonts.actor(
                  //  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Toogle theme',
              style: GoogleFonts.actor(
                  // color: Colors.black.withOpacity(0.6)
                  ),
            ),
            trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
