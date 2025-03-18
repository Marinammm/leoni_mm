import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leoni_mm/common/components/drawers.dart';
import 'package:leoni_mm/common/components/form.dart';
import 'package:logger/logger.dart';
import '../common/components/animations.dart';
import '../common/components/texts.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.tealAccent, style: BorderStyle.solid, width: 2.0),
          borderRadius: BorderRadius.circular(5.0)
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0),),
    );
  }

  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
      ),
      endDrawer: DrawersMobile(),
      body: ListView(
        children: [
          //Intro, First section
          CircleAvatar(
            radius: 117.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 113.0,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/image-circle.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: SansBold('Hello I am', 15.0),
                    ),
                    SansBold('Leoni Moreira', 40.0),
                    SansBold('Flutter developer', 20.0),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 40.0,),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans('leonimm@gmail.com', 15.0),
                        Sans('31997957177', 15.0),
                        Sans('BH Brasil', 15.0),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 90.0,),
          //About me, Second section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold('About me', 35.0),
                Sans('Hello! I am Leoni Moreira I specialize in Flutter development', 15.0),
                Sans('I strive to ensure astounding performance with state of', 15.0),
                Sans('the art security for Android, Ios, Web, Mac and Linux', 15.0),
                SizedBox(height: 10.0,),
                Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: [
                    tealContainer('Flutter'),
                    tealContainer('Firebase'),
                    tealContainer('Android'),
                    tealContainer('Linux'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 60.0,),
          //What I do, Third section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold('What I do?', 35.0),
              AnimatedCard(imagePath: 'assets/webL.png', text: 'Web development', width: 300.0,),
              SizedBox(height: 35.0,),
              AnimatedCard(imagePath: 'assets/app.png', text: 'App development', width: 300.0, fit: BoxFit.contain, reverse: true,),
              SizedBox(height: 35.0,),
              AnimatedCard(imagePath: 'assets/firebase.png', text: 'Back-end development', width: 300.0,),
              SizedBox(height: 60.0,),
              //Contact, Fourth section
              ContactFormMobile(),
              SizedBox(height: 20.0,)
            ],
          )
        ],
      ),
    );
  }
}
