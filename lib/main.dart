import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/screens/setting_screen.dart';
import 'package:news_app/screens/signUp_screen.dart';
import 'package:news_app/shared/style/myThemeData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'home_layout/home_layout.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: NewsApp()));
}

class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    appProvider.getSharedPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: appProvider.themeMode,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(appProvider.language),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }



}
