import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  final FirebaseAuthService authService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock_outlined),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authService
                    .register(emailController.text, passwordController.text)
                    .then((value) {
                      handleRegisterResult(value, context);
                    });
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('You have an account?'),
            ),
          ],
        ),
      ),
    );
  }
}

void handleRegisterResult(result, BuildContext context) {
  print(result);
  const errorMessages = {
    1: 'Invalid email',
    2: 'weak-password',
    3: 'email-already-in-use',
  };

  if (result != null && errorMessages.containsKey(result)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessages[result]!),
        duration: const Duration(seconds: 2),
      ),
    );
  } else if (result != null) {
    Navigator.pushNamed(context, '/login');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An unexpected error occurred. Please try again.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
