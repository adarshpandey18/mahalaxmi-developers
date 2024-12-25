import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/firebase_options.dart';
import 'package:mahalaxmi_developers/provider/admin_auth_provider.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/provider/categories_provider.dart';
import 'package:mahalaxmi_developers/provider/chat_provider.dart';
import 'package:mahalaxmi_developers/provider/property_provider.dart';
import 'package:mahalaxmi_developers/screen/about/about.dart';
import 'package:mahalaxmi_developers/screen/admin/admin.dart';
import 'package:mahalaxmi_developers/screen/admin/authentication/admin_authentication.dart';
import 'package:mahalaxmi_developers/screen/admin/chat/admin_user_list.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/add%20property/add_property.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/delete%20property/delete_property.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth%20landing/auth_landing.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth_wrapper.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20in/sign_in.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20up/sign_up.dart';
import 'package:mahalaxmi_developers/screen/agents/agents.dart';
import 'package:mahalaxmi_developers/screen/categories/categories_screen.dart';
import 'package:mahalaxmi_developers/screen/contact/contact.dart';
import 'package:mahalaxmi_developers/screen/home/home_screen.dart';
import 'package:mahalaxmi_developers/screen/splash%20screen/splash_screen.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).catchError((e) {
    print(e.toString());
  });
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
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
        ChangeNotifierProvider(create: (context) => PropertyProvider()),
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
          '/add_property': (context) => const AddPropertyScreen(),
          '/delete_property': (context) => const DeleteProperty(),
          '/admin_userlist': (context) => const AdminUserList(),
          '/categories': (context) => const CategoriesScreen(),
        },
      ),
    );
  }
}
