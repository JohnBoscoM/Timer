import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotifyAuthPage extends StatefulWidget {
  @override
  _SpotifyAuthPageState createState() => _SpotifyAuthPageState();
}

class _SpotifyAuthPageState extends State<SpotifyAuthPage> {
  bool isSwitched = false;
  String connectingText = "Connect your Spotify account";
  String allowence = "The application will be able to gain access to:";
  String description = "Your playlists and albums";
  String agreeTerms =
      "You agree that The App is responsible for its use of your information in accordance with its privacy policy, and that your information may be transferred outside the EEA";
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
            "Authorize",
            style: GoogleFonts.manrope(
                fontSize: 17,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    image: DecorationImage(
                        image: AssetImage("images/spotify_logo_green.png"))),
              ),
            ]),
            Text(connectingText,
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    fontSize: 23, fontWeight: FontWeight.bold)),
            Text(allowence,
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    fontSize: 19, fontWeight: FontWeight.bold)),
            Text(description,
                textAlign: TextAlign.left,
                style: GoogleFonts.manrope(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            Text(agreeTerms,
                textAlign: TextAlign.left,
                style: GoogleFonts.manrope(
                    fontSize: 12, fontWeight: FontWeight.bold)),
            Row(
              children: [],
            )
          ],
        ));
  }
}
