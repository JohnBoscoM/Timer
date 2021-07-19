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
    final timeService = TimerService();
    return ChangeNotifierProvider<TimerService>(
      create: (_) => timeService,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            size: 30,
            color: Colors.grey.shade900,
          ),
          elevation: 2,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Timer",
            style: GoogleFonts.roboto(
                fontSize: 25,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  leading: Icon(Icons.music_note),
                  title: const Text('Golden Roses'),
                  subtitle: Text(
                    'Rick Ross ft Drake',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  trailing: Icon(
                    Icons.volume_up,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(height: 20),
              NeuDigitalClock(
                key: null,
              ),
              SizedBox(height: 20),
              SizedBox(height: 25),
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
              Text(
                "v.100.1",
                style: GoogleFonts.actor(
                    color: Colors.grey.shade500, fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
