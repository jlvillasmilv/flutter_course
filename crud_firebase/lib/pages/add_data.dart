import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_service.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController(text: '');

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
            ElevatedButton(
              onPressed: () async {
                await addData(nameController.text).then((_) {
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
