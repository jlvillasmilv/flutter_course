import 'package:crud_firebase/pages/register.dart';
import 'package:crud_firebase/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController(text: '');
  final FirebaseAuthService authService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.purple,
      ),
      drawer: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                await authService.changePassword(passwordController.text).then((
                  value,
                ) {
                  handleRegisterResult(value, context);
                });
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
