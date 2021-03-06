import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:mal/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';
import '../models/app_state_provider.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10.0),
      backgroundColor:
          Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
              ? BACKGROUND_LIGHT
              : HEADER_DARK.withOpacity(0.7),
      elevation: 10.0,
      scrollable: true,
      content: SizedBox(
        height: 500,
        width: 500,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -1.0,
              top: -1.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/hello.png',
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(
                          color: Provider.of<AppStateProvider>(context)
                                      .themeMode ==
                                  'LIGHT'
                              ? TEXT_LIGHT
                              : TEXT_DARK),
                      controller: emailController,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(
                          color: Provider.of<AppStateProvider>(context)
                                      .themeMode ==
                                  'LIGHT'
                              ? TEXT_LIGHT
                              : TEXT_DARK),
                      controller: passwordController,
                      obscureText: true,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: const Text(
                            "Login",
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            final res = await signIn(
                                emailController.text, passwordController.text);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            if (res == 'Signed In') {
                              Provider.of<AppStateProvider>(context,
                                      listen: false)
                                  .updateUserID(
                                      FirebaseAuth.instance.currentUser!.uid);
                              Navigator.of(context).pop();
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Successfully Signed In!",
                              );
                            } else {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                text: res,
                              );
                            }
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: const Text(
                            "Sign Up",
                          ),
                          onPressed: () async {
                            final res = await signUp(
                                emailController.text, passwordController.text);
                            if (res == 'Signed In') {
                              Provider.of<AppStateProvider>(context,
                                      listen: false)
                                  .updateUserID(
                                      FirebaseAuth.instance.currentUser!.uid);
                              Navigator.of(context).pop();
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Successfully Signed In!",
                              );
                            } else {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                text: res,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
