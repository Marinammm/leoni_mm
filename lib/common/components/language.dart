import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageViewModel with ChangeNotifier {
  //As there are two languages alternated by a switch, decided to use bool value.
  //True for Portuguese ans False for English.
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

  static getTabsTitle (lang) {
    if (lang) {
      return ['Home', 'Sobre', 'Projetos', 'Contato'];
    } else {
      return ['Home', 'About', 'Works', 'Contact'];
    }
  }

  static String getAboutTitle (lang) {
    if (lang) {
      return 'Sobre mim';
    } else {
      return 'About me';
    }
  }

  static String getAboutText (lang) {
    if (lang) {
      return '''''';
    } else {
      return '''''';
    }
  }

  static String getSkillsTitle (lang) {
    if (lang) {
      return 'O que eu faço';
    } else {
      return 'What I do';
    }
  }

  static String getSkillsText (lang, web) {
    if (lang) {
      if (web) {
        return 'Desenvolvimento web';
      } else {
        return 'Desenvolvimento de apps';
      }
    } else {
      if (web) {
        return 'Web development';
      } else {
        return 'App development';
      }
    }
  }

  static String getWorksTitle (lang) {
    if (lang) {
      return 'Projetos';
    } else {
      return 'Works';
    }
  }

  static String getContactTitle (lang) {
    if (lang) {
      return 'Entre em contato';
    } else {
      return 'Contect me';
    }
  }

  static getContactText (lang) {
    return {
      'first': {
        'name': lang ? 'Nome' : 'First name',
        'error': lang ? 'Nome é obrigatório' : 'First name is required',
      },
      'last': {
        'name': lang ? 'Sobrenome' : 'Last name',
        'error': '',
      },
      'email': {
        'name': 'Email',
        'error': lang ? 'Email é obrigatório' : 'Email is required',
      },
      'phone': {
        'name': lang ? 'Telefone' : 'Phone number',
        'error': '',
      },
      'message': {
        'name': lang ? 'Mensagem' : 'Message',
        'hint': lang ? 'Digite aqui sua mensagem' : 'Please type your message',
        'error': lang ? 'Mensagem é obrigatória' : 'Message is required',
      }
    };
  }

  static String getDialogSuccessMessage (lang) {
    if (lang) {
      return 'Mensagem enviada com sucesso!';
    } else {
      return 'Message sent successfully';
    }
  }

  static String getDialogErrorMessage (lang) {
    if (lang) {
      return 'Ocorreu uma falha ao enviar a mensagem';
    } else {
      return 'Message failed to send';
    }
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Provider.of<LanguageViewModel>(context);

    return Row(
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
              value: languageViewModel.language,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.redAccent[100],
              onChanged: (bool value) {
                languageViewModel.switchLanguage();
              }),
          ),
        ),
        Image.asset(
          'assets/brasil.png',
          height: 15.0,
        ),
      ],
    );
  }
}

