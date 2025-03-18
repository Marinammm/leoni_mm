import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'tabs.dart';
import 'texts.dart';

urlLauncher(String imgPath, String url) {
  return IconButton(
    onPressed: () async{
      await launchUrl(Uri.parse(url));
    },
    icon: SvgPicture.asset(imgPath, width: 35.0,),
  );
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black)
                ),
                child: Image.asset('assets/image-circle.png'),
              )
          ),
          TabsMobile(text: 'Home', route: '/'),
          SizedBox(height: 20.0,),
          TabsMobile(text: 'Works', route: '/works'),
          SizedBox(height: 20.0,),
          TabsMobile(text: 'Blog', route: '/blog'),
          SizedBox(height: 40.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () async => await launch('https://www.instagram.com/marinamonteiromoreira'),
                  icon: SvgPicture.asset('assets/instagram2.svg', width: 35.0,)
              ),
              IconButton(
                  onPressed: () async => await launch('https://x.com'),
                  icon: SvgPicture.asset('assets/twitter.svg', width: 35.0,)
              ),
              IconButton(
                  onPressed: () async => await launch('https://github.com/Marinammm'),
                  icon: SvgPicture.asset('assets/github.svg', width: 35.0,)
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/photo_2025-01-14_17-23-01.jpg'),
            ),
          ),
          SizedBox(height: 15.0,),
          SansBold('Leoni Moreira', 30.0),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher('assets/instagram2.svg', 'https://www.instagram.com/marinamonteiromoreira'),
              urlLauncher('assets/twitter.svg', 'https://x.com'),
              urlLauncher('assets/github.svg', 'https://github.com/Marinammm')
            ],
          )
        ],
      ),
    );
  }
}
