import 'package:flutter/material.dart';
import 'package:crud_firebase/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Firebase', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    await deleteData(snapshot.data![index]['id']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;

                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Confirmar eliminación'),
                          content: Text(
                            '¿Estás seguro de eliminar a ${snapshot.data![index]['name']}?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text(
                                'Cancelar',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Eliminar'),
                            ),
                          ],
                        );
                      },
                    );

                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  key: Key(snapshot.data![index]['id']),
                  child: ListTile(
                    title: Text(snapshot.data![index]['name']),
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: {
                          'id': snapshot.data![index]['id'],
                          'name': snapshot.data![index]['name'],
                        },
                      );
                      setState(() {});
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
