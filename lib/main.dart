import 'package:aitakata_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aitakata_app/utils/firebase_api_key_option.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      projectId: 'aitakata-app',
      appId: '1:289449706588:android:01f5543a3d4d88f0cfd299',
      apiKey: FirebaseOptionAPIKEY.currentPlatform,
      messagingSenderId: '289449706588',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          seedColor: const Color.fromRGBO(253, 95, 182, 1),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
