import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login View")),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "Enter your email"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
                hintText: "Enter your password"
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: email, password: password);
                print(userCredential);
                Navigator.of(context).pushNamedAndRemoveUntil('/notes/', (route) => false);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'invalid-email') {
                  print("please enter a valid email");
                } else {
                  print("Something bad happened");
                }
                print(e.code);
              }
            },
            child: const Text("Login"),
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil("/register/", (route) => false);
          }, child: const Text("Not registered yet? Register here!"))
        ],
      ),
    );
  }
}
