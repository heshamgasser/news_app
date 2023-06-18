
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/screens/widget/login_signup_screen_widget/email_screen_widget.dart';
import 'package:news_app/screens/widget/login_signup_screen_widget/name_screen_widget.dart';
import 'package:news_app/screens/widget/login_signup_screen_widget/password_screen_widget.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'Sign Up Screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  bool secured = true;
  bool securedConfirm = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

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
          AppLocalizations.of(context)!.signup,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    DefaultNameTextFormField(
                        labelText: AppLocalizations.of(context)!.name,
                        prefixIcon: CupertinoIcons.person,
                        suffixIcon: Icons.edit_note_outlined,
                        controller: nameController),
                    SizedBox(
                      height: 10,
                    ),
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
                      height: 10,
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
                      suffixIcon: secured
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      controller: passwordController,
                      onSecuredClicked: () {
                        setState(() {
                          secured = !secured;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.confirmPassword,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    DefaultPasswordTextFormField(
                      labelText: AppLocalizations.of(context)!.confirmPassword,
                      secured: securedConfirm,
                      prefixIcon: Icons.password,
                      suffixIcon: secured
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      controller: confirmedPasswordController,
                      onSecuredClicked: () {
                        setState(() {
                          securedConfirm = !securedConfirm;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signup,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.haveAccount,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.blueAccent,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
