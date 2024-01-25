import 'package:flutter/material.dart';
import 'package:hogwarts/app/controllers/character_controller.dart';
//import 'package:hogwarts/app/views/home.dart';
import 'package:hogwarts/app/views/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>CharacterController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashScreen()
        //const MyHomePage(),
      ),
    );
  }
}
