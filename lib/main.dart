// ignore_for_file: non_constant_identifier_names, deprecated_colon_for_default_value, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:hello_mannaso_world/my_widgets/script.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:hello_mannaso_world/app/sign_in/sign_in_page.dart';

import 'my_widgets/asset_list_and_text_load_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mannaso English Hello Stella',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('2023-04-13 English Training'),
        ),
        body: AssetListAndTextLoaderWidget(),
      ),
    );
  }
}
