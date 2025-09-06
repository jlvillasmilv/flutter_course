import 'package:crud_sqlite/pages/add_contact.dart';
import 'package:crud_sqlite/pages/home_page.dart';
import 'package:crud_sqlite/pages/page_404.dart';
import 'package:flutter/material.dart';
import 'package:crud_sqlite/database/course_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ContactDatabase.instance.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routes = {
    '/': (context) => const Home(),
    '/add': (context) => const AddData(),
    '/edit': (context) => const AddData(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite Crud',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Page404());
      },
    );
  }
}
