import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leoni_mm/common/components/language.dart';

final homeKey = GlobalKey();
final aboutKey = GlobalKey();
final contactKey = GlobalKey();

class TabsWeb extends StatefulWidget {
  final String title;
  final String route;
  final GlobalKey? navigationKey;
  const TabsWeb({
    super.key,
    required this.title,
    required this.route,
    this.navigationKey,
  });

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.navigationKey != null) {
          Scrollable.ensureVisible(
              widget.navigationKey!.currentContext!,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut
          );
        } else {
          Navigator.of(context).pushNamed(widget.route);
        }
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          style: isSelected
              ? GoogleFonts.oswald(
            fontSize: 25.0,
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: Colors.tealAccent,
          )
              : GoogleFonts.oswald(color: Colors.black, fontSize: 20.0),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

class TabsWebList extends StatelessWidget {
  const TabsWebList({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Provider.of<LanguageViewModel>(context);
    var tabNames = LanguageText.getTabsTitle(languageViewModel.language);

    return Row(children: [
      Spacer(
        flex: 3,
      ),
      TabsWeb(title: tabNames[0], route: '/', navigationKey: homeKey,),
      Spacer(),
      TabsWeb(title: tabNames[1], route: '/', navigationKey: aboutKey,),
      Spacer(),
      TabsWeb(title: tabNames[2], route: '/works',),
      Spacer(),
      TabsWeb(title: tabNames[3], route: '/', navigationKey: contactKey,),
      Spacer(),
      LanguageButton(),
      SizedBox(width: 40.0,),
    ]);
  }
}


class TabsMobile extends StatefulWidget {
  final String text;
  final String route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}