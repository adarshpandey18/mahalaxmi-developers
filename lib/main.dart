import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/firebase_options.dart';
import 'package:mahalaxmi_developers/provider/admin_auth_provider.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/screen/about/about.dart';
import 'package:mahalaxmi_developers/screen/admin/admin.dart';
import 'package:mahalaxmi_developers/screen/admin/authentication/admin_authentication.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth%20landing/auth_landing.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth_wrapper.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20in/sign_in.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20up/sign_up.dart';
import 'package:mahalaxmi_developers/screen/chat/agents.dart';
import 'package:mahalaxmi_developers/screen/contact/contact.dart';
import 'package:mahalaxmi_developers/screen/home/home_screen.dart';
import 'package:mahalaxmi_developers/screen/splash%20screen/splash_screen.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AdminAuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        debugShowMaterialGrid: false,
        title: 'Mahalaxmi Developers',
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: '/splash_screen',
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          );
        },
        routes: {
          '/auth_wrapper': (context) => const AuthWrapper(),
          '/splash_screen': (context) => const SplashScreen(),
          '/auth_landing': (context) => const AuthLanding(),
          '/sign_in': (context) => const SignIn(),
          '/sign_up': (context) => const SignUp(),
          '/home': (context) => const HomeScreen(),
          '/about': (context) => const AboutScreen(),
          '/contact': (context) => const ContactScreen(),
          '/agents': (context) => const AgentsScreen(),
          '/admin': (context) => const AdminScreen(),
          '/admin_authentication': (context) => const AdminAuthentication(),
        },
      ),
    );
  }
}
