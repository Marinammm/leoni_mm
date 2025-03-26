import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../api/firestore.dart';
import 'language.dart';
import 'texts.dart';

final Logger logger = Logger();

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();
final formKey = GlobalKey<FormState>();

class TextForm extends StatelessWidget {
  final String heading;
  final double containerWidth;
  final String? hintText;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextForm(
      {super.key,
        required this.heading,
        required this.containerWidth,
        this.hintText,
        this.maxLines,
        required this.controller,
        this.validator
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(heading, 16.0),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            controller: controller,
            validator: validator,
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// A stateful widget for creating a contact form for the web
class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  _ContactFormWebState createState() => _ContactFormWebState();
}

// State class for ContactFormWeb
class _ContactFormWebState extends State<ContactFormWeb> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    LanguageViewModel languageViewModel = Provider.of<LanguageViewModel>(context);

    var texts = LanguageText.getContactText(languageViewModel.language);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          SansBold(LanguageText.getContactTitle(languageViewModel.language), 40.0),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    heading: texts['first']['name'],
                    containerWidth: 350.0,
                    controller: _firstNameController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return texts['first']['error'];
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    heading: texts['email']['name'],
                    containerWidth: 350.0,
                    controller: _emailController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return texts['email']['error'];
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                    heading: texts['last']['name'],
                    containerWidth: 350.0,
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    heading: texts['phone']['name'],
                    containerWidth: 350.0,
                    controller: _phoneController,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          TextForm(
            heading: texts['message']['name'],
            containerWidth: widthDevice / 1.5,
            hintText: texts['message']['hint'],
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text!.isEmpty) {
                return texts['message']['error'];
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  dialogError(
                    context,
                    LanguageText.getDialogSuccessMessage(languageViewModel.language)
                  );
                } else {
                  dialogError(
                    context,
                    LanguageText.getDialogErrorMessage(languageViewModel.language)
                  );
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: 200.0,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

// A stateful widget for creating a contact form for mobile devices
class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  _ContactFormMobileState createState() => _ContactFormMobileState();
}

// State class for ContactFormMobile
class _ContactFormMobileState extends State<ContactFormMobile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          const SansBold("Contact me", 35.0),
          TextForm(
            heading: "First name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type first name",
            controller: _firstNameController,
            validator: (text) {
              if (text!.isEmpty) {
                return "First name is required";
              }
              return null;
            },
          ),
          TextForm(
            heading: "Last name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type last name",
            controller: _lastNameController,
          ),
          TextForm(
            heading: "Phone number",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type phone number",
            controller: _phoneController,
          ),
          TextForm(
            heading: "Email",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type email address",
            controller: _emailController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Email is required";
              }
              return null;
            },
          ),
          TextForm(
            heading: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  dialogError(context, "Message sent successfully");
                } else {
                  dialogError(context, "Message failed to send");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
        ],
      ),
    );
  }
}
