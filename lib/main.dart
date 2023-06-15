import 'package:app_template/home_layout/home_layout.dart';
import 'package:app_template/provider/app_provider.dart';
import 'package:app_template/screens/login_screen.dart';
import 'package:app_template/screens/setting_screen.dart';
import 'package:app_template/screens/signUp_screen.dart';
import 'package:app_template/shared/style/myThemeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

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
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingScreen.routeName:(context) => SettingScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        SignUpScreen.routeName:(context) => SignUpScreen(),


      },
    );
  }
}
