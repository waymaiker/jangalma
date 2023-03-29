import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';

import 'package:jangalma/app_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'mybeta',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if(kDebugMode){
    String host = "localhost";

    if(!kIsWeb){
      host = Platform.isAndroid ? "10.0.0.2" : "localhost";
    }

    FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  }

  runApp(
    const ProviderScope(
      child: AppWrapper()
    )
  );
}