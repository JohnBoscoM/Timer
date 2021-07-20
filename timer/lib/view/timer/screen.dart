import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/service/timer_service.dart';
import 'package:timer/view/timer/neu_digital_clock.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final timeService = TimerService();
    return ChangeNotifierProvider<TimerService>(
      create: (_) => timeService,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Timer",
            style: GoogleFonts.manrope(
                fontSize: 25,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.grey.shade900,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 20, top: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [])),
              // Switch(value: true, onChanged: (value) {}),
              //SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Text("Round 1",
                          style: GoogleFonts.rajdhani(fontSize: 23)),
                      NeuDigitalClock(
                        key: null,
                      ),
                    ],
                  )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    duration: Duration.zero,
                    child: Icon(
                      Icons.more_time,
                      size: 30,
                    ),
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.grey.shade800,
                      child: Icon(
                        Icons.play_arrow,
                        size: 35,
                      ),
                      onPressed: () {}),
                  AnimatedContainer(
                    duration: Duration.zero,
                    child: Icon(
                      CupertinoIcons.delete_simple,
                      size: 30,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey.shade300))),
                width: width,
                child: ListTile(
                  leading: Container(
                    width: 100,
                    // height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        image: DecorationImage(
                            image: AssetImage("images/golden_roses.jpeg"))),
                  ),
                  title: Text(
                    'Golden Roses',
                    style: GoogleFonts.actor(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rick Ross ft Drake',
                    style:
                        GoogleFonts.actor(color: Colors.black.withOpacity(0.6)),
                  ),
                  trailing: Icon(
                    CupertinoIcons.volume_up,
                    size: 35,
                  ),
                ),
              )
              // Text(
              //   "v.100.1",
              //   style: GoogleFonts.actor(
              //       color: Colors.grey.shade500, fontSize: 19),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
