import 'package:assistant_ai/ui/manager/auth/auth_provider.dart';
import 'package:assistant_ai/ui/pages/auth/login_page.dart';
import 'package:assistant_ai/ui/pages/auth/opt_page.dart';
import 'package:assistant_ai/ui/pages/auth/user_info_page.dart';
import 'package:assistant_ai/ui/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        scaffoldBackgroundColor: Colors.grey.shade200,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
        ),
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
      ),
      home: const UserInfoPage(),
    );
  }
}
