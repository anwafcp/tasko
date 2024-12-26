import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/application/authatication/controller/auth_countroller.dart';
import 'package:task_app/application/authatication/view/sign_up.dart';
import 'package:task_app/application/taks/view/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> formskey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final signins = Provider.of<AuthCountroller>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formskey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Do Your Task",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "e-mail  is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "enter youir email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(width: 3.0, color: Colors.black))),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: password,

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is empty";
                  } else if (value.length > 8) {
                    return "Password is too long";
                  } else if (value.length < 8) {
                    return "Password is too short";
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "enter your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(width: 3.0, color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "not a member?",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)))
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12,
                      minimumSize: Size(200, 50),
                      side: BorderSide(
                        width: 3,
                      )),
                  onPressed: () {
                    if (formskey.currentState!.validate()) {
                      signins.SignIn(email.text.trim(), password.text.trim());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }
                  },
                  child: Text("Sign In",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)))
            ],
          ),
        ),
      ),
    );
  }
}
