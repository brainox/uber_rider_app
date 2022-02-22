import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_rider_app/AllScreens/main_screen.dart';
import 'package:uber_rider_app/AllScreens/registration_screen.dart';
import 'package:uber_rider_app/Utilities/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String idScreen = "login";

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 390,
                      width: 250,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    const Text(
                      "Login as Rider",
                      style:
                          TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 14.0),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) =>
                                Validator.validateEmail(email: value!),
                            style: TextStyle(fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 14.0),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) =>
                                Validator.validatePassword(password: value!),
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("Logged in clicked");
                            },
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Brand Bold",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegistrationScreen.idScreen, (route) => false);
                      },
                      child: Text("Do not have an account, Register here"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
