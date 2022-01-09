import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mal/widgets/login_form.dart';
import '../services/auth_service.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('App Settings'),
          ),
          StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return GestureDetector(
                  child: const ListTile(
                    leading: Icon(
                      Icons.login,
                      color: Colors.green,
                    ),
                    title: Text('Login'),
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
                return GestureDetector(
                  onTap: () {
                    signOut();
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: Text('Logout'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
