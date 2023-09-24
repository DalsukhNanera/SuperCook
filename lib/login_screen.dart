
import 'package:supercook/tabs_screen.dart';
import './toastmessage.dart';
import 'package:flutter/material.dart';
import './roundbutton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './meal.dart';



class LoginScreen extends StatefulWidget {
  static const routename = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  List<Meal> favouriteitem = [];

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  Widget build(BuildContext context) {
     final List<Meal> favouriteitem = ModalRoute.of(context)!.settings.arguments as List<Meal> ;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
         Padding(
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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: ktextfielddecoration.copyWith(
                    hintText: 'Enter your PassWord',
                    prefixIcon: Icon(Icons.lock_open)),
              ),
              SizedBox(
                height: 24.0,
              ),
              // roundbutton(
              //   title: 'Log In',
              //   color: Colors.blueAccent,
              //   controller: () async {
              //     setState(() {
              //       showspinning = true;
              //     });
              //     try {
              //       final user = await _auth
              //           .signInWithEmailAndPassword(
              //               email: email, password: password);
              //       if (user != null) {
              //         Navigator.of(context).pushNamed(tabs_screen.routename , arguments: favouriteitem);
              //       }
              //       setState(() {
              //         showspinning = false;
              //       });

              //       if(user == null)
              //       {
              //         toastmessage.errormessage('invalid credetails');
              //         print("i am here");
              //       }
              //     }
              //      catch (e) {
              //       setState(() {
              //         showspinning = false;
              //       });
              //       toastmessage.errormessage(e.toString());
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
                    final user = await _auth
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    if (user != null) {
                      Navigator.of(context).pushNamed(tabs_screen.routename , arguments: favouriteitem);
                    }
                    if(user == null)
                    {
                      toastmessage.errormessage('invalid credetails');
                      print("i am here");
                    }
                  }
                   catch (e) {
                    toastmessage.errormessage(e.toString());
                  }
                },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Login',
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
