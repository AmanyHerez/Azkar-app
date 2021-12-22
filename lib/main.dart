import 'package:azkar_app/screen/Pref_controller.dart';
import 'package:azkar_app/screen/launch_screen.dart';
import 'package:azkar_app/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefController().initPreController();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context)=>LaunchScreen(),
        '/main_screen':(context)=>MainScreen(),
      },

    );
  }
}

