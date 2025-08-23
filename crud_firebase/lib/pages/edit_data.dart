import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_service.dart';

class EditData extends StatefulWidget {
  const EditData({super.key});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String id = arguments['id'];
    nameController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(title: Text('Editar datos')),
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
                await updateData(id, nameController.text).then((_) {
                  Navigator.pop(context);
                });
              },
              child: Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
