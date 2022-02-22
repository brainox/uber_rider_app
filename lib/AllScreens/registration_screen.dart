import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uber_rider_app/AllScreens/login_screen.dart';
import 'package:uber_rider_app/AllScreens/main_screen.dart';
import 'package:uber_rider_app/Authentication/fire_auth.dart';
import 'package:uber_rider_app/Utilities/validator.dart';
import 'package:uber_rider_app/main.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";
  final _formKey = GlobalKey<FormState>();

  RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _registerNewUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      User? user = await FireAuth.registerUsingEmailPassword(
        name: nameTextEditingController.text,
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      if (user != null) {
        Map userDataMap = {
          'name': nameTextEditingController.text.trim(),
          'email': emailTextEditingController.text.trim(),
          'password': passwordTextEditingController.text.trim(),
        };

        usersRef.child(user.uid).set(userDataMap);
        print("Congratutions! Your account have been created");
        Navigator.pushReplacementNamed(context, MainScreen.idScreen);
      } else {
        print("New user account cannot be created");
      }
    }
  }

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
                    "Register as Rider",
                    style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 1,
                        ),
                        TextFormField(
                          controller: nameTextEditingController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          validator: (value) =>
                              Validator.validateName(name: value!),
                          style: TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        TextFormField(
                          controller: emailTextEditingController,
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
                          controller: phoneTextEditingController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          validator: (value) => Validator.validatePhoneNumber(
                              phoneNumber: value!),
                          style: TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        TextFormField(
                          controller: passwordTextEditingController,
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
                            _registerNewUser(context);
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Register",
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.idScreen, (route) => false);
                    },
                    child: Text("Already have an account, Login here"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
