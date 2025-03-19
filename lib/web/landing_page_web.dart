import 'package:flutter/material.dart';
import 'package:leoni_mm/common/components/drawers.dart';
import 'package:leoni_mm/common/components/form.dart';
import 'package:leoni_mm/common/components/tabs.dart';
import '../common/components/animations.dart';
import '../common/components/texts.dart';

class LandingPageWeb extends StatefulWidget {
  final GlobalKey? section;
  const LandingPageWeb({super.key, this.section});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: TabsWebList(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Home
            SizedBox(
              key: homeKey,
              height: deviceHeight - 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                            )),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold('Hello I am', 15),
                      ),
                      SizedBox(height: 15.0),
                      SansBold('Leoni Moreira', 55.0),
                      SizedBox(
                        height: 15.0,
                      ),
                      Sans('Flutter developer', 30.0),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(
                            width: 10.0,
                          ),
                          Sans('leonimm@gmail.com', 15.0),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.call),
                          SizedBox(
                            width: 10.0,
                          ),
                          Sans('+55 31 99795-7177', 15.0),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          SizedBox(
                            width: 10.0,
                          ),
                          Sans('Belo Horizonte, MG Brasil', 15.0),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 147.0,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 143.0,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 140.0,
                        backgroundImage: AssetImage('assets/image-circle.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //About
            SizedBox(
              key: aboutKey,
              height: deviceHeight / 1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/web.jpg',
                    height: deviceWidth / 1.9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SansBold('About me', 40.0),
                      SizedBox(
                        height: 15.0,
                      ),
                      Sans(
                          'Hello! I am Leoni Moreira I specialize in flutter development',
                          15.0),
                      Sans(
                          'I strive to ensure astounding performance with state of',
                          15.0),
                      Sans(
                          'the art security for Android, Ios, Web, Linux, Mac and Windows',
                          15.0),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans('Flutter', 15.0),
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans('Firebase', 15.0),
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans('Android', 15.0),
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans('Ios', 15.0),
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans('Linux', 15.0),
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            //About 2
            SizedBox(
              height: deviceHeight / 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold('What I do?', 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCard(
                          imagePath: 'assets/webL.png', text: 'Web development'),
                      AnimatedCard(
                        imagePath: 'assets/app.png',
                        text: 'App development',
                        fit: BoxFit.contain,
                        reverse: true,
                      ),
                      AnimatedCard(
                          imagePath: 'assets/firebase.png',
                          text: 'Back-end development'),
                    ],
                  )
                ],
              ),
            ),
            //Contact
            SizedBox(
              key: contactKey,
              height: deviceHeight,
              child: ContactFormWeb(),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
