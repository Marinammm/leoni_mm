import 'package:flutter/material.dart';
import '../common/components/animations.dart';
import '../common/components/drawers.dart';
import '../common/components/tabs.dart';
import '../common/components/texts.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    // Determine if the device is a web device based on its width
    bool isWeb = MediaQuery.of(context).size.width > 800;

    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawersWeb(),
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 500.0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/works.jpg',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
              title: Container(
                padding:
                EdgeInsets.symmetric(horizontal: isWeb ? 7.0 : 4.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  icon: Icon(Icons.arrow_back)
                ),
              ),
          )
        ];
      },
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30.0,),
                SansBold('Works', 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(imagePath: 'assets/portfolio-snippet.png', width: 300.0,),
                    SizedBox(
                      width: deviceWidth / 3,
                      child: Column(
                        children: [
                          SansBold('Portfolio', 30.0),
                          SizedBox(height: 15.0,),
                          Sans('Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.', 15.0),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
