import 'package:car_shop/constants/page_routs.dart';
import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => MyHomePage(
                    title: "Car store",
                  )));
    }
  }

  _signIn() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFd2d3d5),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 1,
            ),
            Image.asset('assets/icons/logo.jpg'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 3, bottom: 3),
                        child: TextFormField(
                          style: const TextStyle(fontFamily: descFont, fontSize: 20),
                          decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 20, fontFamily: descFont, color: Colors.grey)),
                          validator: (input) =>
                              !input!.contains("@") ? "Please enter a valid email" : null,
                          // ignore: avoid_print
                          onSaved: (input) => print(input),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 3, bottom: 3),
                        child: TextFormField(
                          style: const TextStyle(fontFamily: descFont, fontSize: 20),
                          decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 20, fontFamily: descFont, color: Colors.grey)),
                          validator: (input) =>
                              input!.isEmpty ? "Please enter a valid password" : null,
                          // ignore: avoid_print
                          onSaved: (input) => print(input),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      InkWell(
                        onTap: () => _submit(),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), color: Colors.blueAccent),
                          child: const Center(
                              child: Text(
                            "Login",
                            style:
                                TextStyle(fontFamily: descFont, fontSize: 20, color: Colors.white),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () => _signIn(),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: descFont,
                                  fontSize: 20,
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
