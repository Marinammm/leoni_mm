import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leoni_mm/common/components/language.dart';
import 'package:leoni_mm/firebase_options.dart';
import 'package:leoni_mm/routes.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  GoogleFonts.config.allowRuntimeFetching = true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageViewModel>(create: (_) => LanguageViewModel(),
      child: Consumer<LanguageViewModel>(builder: (context, model, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => Routes.generateRoute(settings),
            initialRoute: '/',
          ),
      ),
    );
  }
}
