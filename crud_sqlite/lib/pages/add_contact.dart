import 'package:crud_sqlite/models/contacs.dart';
import 'package:flutter/material.dart';
import 'package:crud_sqlite/database/course_database.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingresa datos')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Ingrese nombre'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(hintText: 'Ingrese telefono'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Ingrese email'),
            ),
            ElevatedButton(
              onPressed: () async {
                await ContactDatabase.instance
                    .insertContact(
                      Contact(
                        id: 0,
                        name: nameController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                      ),
                    )
                    .then((_) {
                      Navigator.pop(context);
                    });
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
