import "package:flutter/material.dart";
import "package:leoni_mm/common/components/tabs.dart";
import "package:leoni_mm/mobile/landing_page_mobile.dart";
import "package:leoni_mm/mobile/works_mobile.dart";
import "package:leoni_mm/web/landing_page_web.dart";
import "package:leoni_mm/web/works_web.dart";
import 'package:leoni_mm/common/blog.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                final argsSection = settings.arguments as GlobalKey;
                return LandingPageWeb(section: argsSection,);
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Blog()
        );
      case '/works':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return WorksWeb();
                  } else {
                    return WorksMobile();
                  }
                }
            )
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb(section: homeKey,);
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
