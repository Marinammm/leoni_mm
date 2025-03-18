import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../components/texts.dart';

class AddDataFirestore {
  var logger = Logger();
  CollectionReference response = FirebaseFirestore.instance.collection('messages');
  Future<bool> addResponse (final firstName, final lastName, final email, final phone, final message) async{
    return response.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone': phone,
      'message': message,
    }).then((value) {
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    });
  }
}

Future<void> dialogError (BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: SansBold(title, 20.0),
      ));
}