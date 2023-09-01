import 'package:flutter/material.dart';
class cadastriTask extends StatefulWidget {
  @override
  _cadastriTaskState createState() => _cadastriTaskState();
}

class _cadastriTaskState extends State<cadastriTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegacao - DetailPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Voltar para HomePage'),
        ),
      ),
    );
  }
}