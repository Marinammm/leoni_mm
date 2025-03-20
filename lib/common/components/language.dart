import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageViewModel with ChangeNotifier {
  bool _language = true;
  bool get language => _language;

  void switchLanguage() {
    _language = !_language;
    notifyListeners();
  }
}

class LanguageText {
  static String getBubbleText (lang) {
    if (lang) {
      return 'Olá, eu sou';
    } else {
      return 'Hello I am';
    }
  }

  static String getTitleText (lang) {
    if (lang) {
      return 'Desenvolvedor Front-End';
    } else {
      return 'Frontend developer';
    }
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageViewModel>(create: (_) => LanguageViewModel(),
      child: Consumer<LanguageViewModel>(builder: (context, model, child) =>
        Row(
          children: [
            Image.asset(
              'assets/eua.png',
              height: 15.0,
            ),
            SizedBox(
              height: 20.0,
              width: 35.0,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                  value: model.language,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.redAccent[100],
                  onChanged: (bool value) {
                    model.switchLanguage();
                  }),
              ),
            ),
            Image.asset(
              'assets/brasil.png',
              height: 15.0,
            ),
          ],
        )
      )
    );
  }
}

