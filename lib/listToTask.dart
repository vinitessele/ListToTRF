import 'package:flutter/material.dart';

List<Task> listaTask = [];

class listtoTask extends StatefulWidget {
  @override
  _listtoTaskState createState() => _listtoTaskState();
}

class _listtoTaskState extends State<listtoTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de TRF'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listaTask.length,
        itemBuilder: (BuildContext context, int index) {
          String descricao = listaTask[index].descricao;
          String data = listaTask[index].data;
          String hora = listaTask[index].hora;
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
               listaTask.removeAt(index);
            },
            child: ListTile(
              leading: const Icon(Icons.list),
              //leading: CircleAvatar(child: Text(index.toString())),
              trailing: const Text(
                "GFG",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text("TRF $descricao"),
              subtitle: Text("Data $data" + "-" + "Horas $hora"),
            ),
          );
        },
      ),
    );
  }
}

class Task {
  String descricao;
  String data;
  String hora;

  Task(this.descricao, this.data, this.hora);
}
