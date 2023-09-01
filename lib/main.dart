import 'package:flutter/material.dart';

import 'cadastroTask.dart';

main() {
  runApp(ListToTaskApp());
}

class ListToTaskAppState extends State<ListToTaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Vinicius'),
              accountEmail: Text('vinitessele@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("assets/images/DSC00006.JPG"),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Adicionar TRF"),
              subtitle: Text("Adicione aqui minhas Tarefas..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cadastriTask()));
              },
            ),
            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Veja suas Tarefas"),
                subtitle: Text("Aqui você pode visualizar suas trfs..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Ver');
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Lista de TRFs'),
      ),
      body: Center(child: Image.asset("assets/images/fundo.png")),
    );
  }
}

class ListToTaskApp extends StatefulWidget {
  ListToTaskAppState createState() {
    return ListToTaskAppState();
  }
}
