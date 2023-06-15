import 'package:app_template/screens/widget/login_screen_widget/email_screen_widget.dart';
import 'package:app_template/screens/widget/login_screen_widget/password_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  bool secured = true;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.login,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  DefaultEmailTextFormField(
                      labelText: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      prefixIcon: Icons.alternate_email,
                      suffixIcon: Icons.email),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.password,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  DefaultPasswordTextFormField(
                    labelText: AppLocalizations.of(context)!.password,
                    secured: secured,
                    prefixIcon: Icons.password,
                    suffixIcon:
                        secured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    controller: passwordController,
                    onSecuredClicked: () {
                      setState(() {
                        secured = !secured;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.createAccount,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.signup,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                        decorationThickness: 4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
