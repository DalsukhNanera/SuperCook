

import 'package:flutter/material.dart';
import'./registration_screen.dart';
import './login_screen.dart';
import './meal.dart';

import './roundbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static const routename = '/welcomescreen';

    final List<Meal> favouriteitem;

  WelcomeScreen(this.favouriteitem);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                 
                Text(
                  'Super Cook',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // roundbutton(color: Colors.blueAccent,title: 'Log In', controller: (){
            //   Navigator.of(context).pushNamed(LoginScreen.routename);
            // }),
            // roundbutton(color: Colors.blueAccent, title:'Register' ,controller: (){
            //   Navigator.of(context).pushNamed(RegistrationScreen.routename);
            // }),
            Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () { Navigator.of(context).pushNamed(RegistrationScreen.routename, arguments: widget.favouriteitem);},
          minWidth: 200.0,
          height: 42.0,
          child: Text('Registration',),
        ),
      ),
    ),

    Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () { Navigator.of(context).pushNamed(LoginScreen.routename, arguments: widget.favouriteitem);},
          minWidth: 200.0,
          height: 42.0,
          child: Text('Login',),
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }
}


