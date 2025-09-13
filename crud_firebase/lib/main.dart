import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:crud_firebase/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Stream<User?> _authStateChanges;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _authStateChanges = _auth.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<User?>(
        stream: _authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !_isInitialized) {
            // Show loading indicator on first load
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final bool isLoggedIn = snapshot.hasData;
          _isInitialized = true;

          return MaterialApp(
            title: 'Crud Firebase',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: isLoggedIn ? '/' : '/login',
            routes: {
              // Public routes
              '/login': (context) => const Login(),
              '/register': (context) => const Register(),

              // Protected routes - wrapped in a builder to handle redirection
              '/': (context) => _buildProtectedRoute(context, const Home()),
              '/add': (context) =>
                  _buildProtectedRoute(context, const AddData()),
              '/edit': (context) =>
                  _buildProtectedRoute(context, const EditData()),
            },
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (context) => const Page404());
            },
          );
        },
      ),
    );
  }

  Widget _buildProtectedRoute(BuildContext context, Widget page) {
    final user = _auth.currentUser;

    if (user == null) {
      // Redirect to login if not authenticated
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/login');
      });
      // Return empty container while redirecting
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return page;
  }
}
