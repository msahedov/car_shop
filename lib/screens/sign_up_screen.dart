import 'package:car_shop/constants/page_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
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

  _logIn() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.black,
            statusBarColor: Colors.white //Color(0xFF344955),
            ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              "assets/icons/logo.jpg",
              height: 200,
            ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 3, bottom: 3),
                        child: TextFormField(
                          style: const TextStyle(fontFamily: descFont, fontSize: 20),
                          decoration: const InputDecoration(
                              labelText: "Repeat password",
                              labelStyle: TextStyle(
                                  fontFamily: descFont, fontSize: 20, color: Colors.grey)),
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
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), color: Colors.green),
                          child: const Center(
                              child: Text(
                            "Sign Up",
                            style:
                                TextStyle(fontFamily: descFont, fontSize: 20, color: Colors.white),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () => _logIn(),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
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
