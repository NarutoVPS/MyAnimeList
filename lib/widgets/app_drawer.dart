import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mal/utils/colors.dart';
import 'package:mal/widgets/custom_text.dart';
import 'package:mal/widgets/settings.dart';
import 'package:provider/provider.dart';

import 'package:mal/widgets/login_form.dart';
import '../services/auth_service.dart';
import '../models/app_state_provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Ink(
        color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
            ? BACKGROUND_LIGHT
            : Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color:
                    Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
                        ? HEADER_LIGHT
                        : HEADER_DARK,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Account', 24),
                  StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CustomText(
                              FirebaseAuth.instance.currentUser!.uid, 14);
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Provider.of<AppStateProvider>(context, listen: false)
                //     .toggleTheme();
                showDialog(
                  context: context,
                  builder: (context) => const Settings(),
                );
              },
              child: const ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('App Settings'),
              ),
            ),
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return InkWell(
                    splashColor: Colors.green,
                    child: ListTile(
                      leading: Icon(
                        Icons.login,
                        color: Colors.green[800],
                      ),
                      title: const Text('Login'),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return LoginForm();
                        },
                      );
                    },
                  );
                } else {
                  return InkWell(
                    splashColor: Colors.red,
                    onTap: () {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.confirm,
                        confirmBtnColor: Colors.red,
                        showCancelBtn: true,
                        onConfirmBtnTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          await signOut();
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Provider.of<AppStateProvider>(context, listen: false)
                              .updateUserID("");
                        },
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red[800],
                      ),
                      title: const Text('Logout'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
