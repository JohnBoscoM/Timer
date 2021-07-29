import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/service/timer_service.dart';
import 'package:timer/view/timer/neu_digital_clock.dart';
import 'package:provider/provider.dart';

import 'custom/widgets/play_button.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;
  bool isRunning = false;
  late Timer timer;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(duration, (Timer t) {
      handleTick();
    });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: Text(
          "Timer",
          style: GoogleFonts.manrope(fontSize: 21, fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            size: 30,
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
                    mainAxisAlignment: MainAxisAlignment.start, children: [])),
            // Switch(value: true, onChanged: (value) {}),
            //SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Text("Round 1", style: GoogleFonts.rajdhani(fontSize: 23)),
                    Container(
                      height: 145,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          // BoxShadow(
                          //   blurRadius: 15,
                          //   offset: Offset(-5, -5),
                          //   color: Colors.white,
                          // ),
                          // BoxShadow(
                          //   blurRadius: 15,
                          //   offset: Offset(10.5, 10.5),
                          //   color: Color.fromRGBO(214, 223, 230, 1),
                          // )
                        ],
                      ),
                      // Digital green background
                      child: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) => Container(
                            height: constraints.maxHeight * 0.87,
                            width: constraints.maxWidth * 0.95,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(203, 211, 196, 1),
                                Color.fromRGBO(176, 188, 163, 1)
                              ]),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromRGBO(168, 168, 168, 1),
                                width: 2,
                              ),
                            ),
                            child: DigitalClock(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              seconds: seconds,
                              minutes: minutes,
                              hours: hours,
                              key: null,
                            ),
                          ),
                        ),
                      ),
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
                PlayButton(
                  pauseIcon: Icon(Icons.pause, color: Colors.black, size: 40),
                  playIcon:
                      Icon(Icons.play_arrow, color: Colors.black, size: 40),
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                ),
                // FloatingActionButton(
                //     backgroundColor: Colors.greenAccent.shade400,
                //     foregroundColor: Colors.white,
                //     child: AnimatedIcon(
                //       progress: controller,
                //       icon: AnimatedIcons.play_pause,
                //       size: 35,
                //     ),
                //     onPressed: () {
                //       tooglePlayPauseIcon();
                //       setState(() {
                //         isActive = !isActive;
                //       });
                //     }),
                AnimatedContainer(
                  duration: Duration.zero,
                  child: Icon(
                    CupertinoIcons.delete_simple,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            //SizedBox(height: 90),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: width,
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage("images/spotify_green.png"))),
                  ),
                  title: Text(
                    'Golden Roses',
                    style: GoogleFonts.actor(
                        // color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rick Ross ft Drake',
                    style: GoogleFonts.actor(
                        // color: Colors.black.withOpacity(0.6)
                        ),
                  ),
                  trailing: Icon(
                    CupertinoIcons.volume_up,
                    size: 35,
                  ),
                ),
              ),
            ),
            //   SizedBox(height: 10),

            // Text(
            //   "v.100.1",
            //   style: GoogleFonts.actor(
            //       color: Colors.grey.shade500, fontSize: 19),
            // )
          ],
        ),
      ),
    );
  }

  void tooglePlayPauseIcon() => setState(() {
        isRunning = !isRunning;
        isRunning ? controller.forward() : controller.reverse();
      });
}
