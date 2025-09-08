import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:crud_firebase/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routes = {
    '/': (context) => const Home(),
    '/add': (context) => const AddData(),
    '/edit': (context) => const EditData(),
    '/login': (context) => const Login(),
    '/register': (context) => const Register(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Firebase',
      initialRoute: '/login',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Page404());
      },
    );
  }
}
