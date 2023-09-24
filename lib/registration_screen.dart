import 'package:firebase_core/firebase_core.dart';
import 'package:supercook/tabs_screen.dart';
import './toastmessage.dart';
import './welcome_screen.dart';
import 'package:flutter/material.dart';
import './roundbutton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './meal.dart';

class RegistrationScreen extends StatefulWidget {
  static const routename = '/registretion_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  List<Meal> favouriteitem = [];
  @override
  Widget build(BuildContext context) {
    final List<Meal> favouriteitem =
        ModalRoute.of(context)!.settings.arguments as List<Meal>;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: ktextfielddecoration.copyWith(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.alternate_email)),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: ktextfielddecoration.copyWith(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.lock_open)),
            ),
            SizedBox(
              height: 24.0,
            ),
            // roundbutton(
            //   title: 'Register',
            //   color: Colors.blueAccent,
            //   controller: () async {
            //     try {
            //       final newuser = await _auth.createUserWithEmailAndPassword(
            //           email: email, password: password);
            //       if (newuser != null) {
            //         Navigator.of(context).pushNamed(tabs_screen.routename,
            //             arguments: favouriteitem);
            //       }
            //     } catch (e) {
            //       toastmessage.errormessage(e.toString());
            //       //Navigator.of(context).pushNamed(WelcomeScreen.routename);
            //     }
            //   },
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final newuser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newuser != null) {
                        Navigator.of(context).pushNamed(tabs_screen.routename,
                            arguments: favouriteitem);
                      }
                    } catch (e) {
                      toastmessage.errormessage(e.toString());
                      //Navigator.of(context).pushNamed(WelcomeScreen.routename);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Registration',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
