import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'listToTask.dart';
import 'package:table_calendar/table_calendar.dart';

class cadastroTask extends StatefulWidget {
  @override
  _cadastroTaskState createState() => _cadastroTaskState();
}

class _cadastroTaskState extends State<cadastroTask> {
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _dateInput = TextEditingController();
  TextEditingController _timeinput = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final _firstDay = DateTime(1950);
  final _lastDay = DateTime(2100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de TRF'),
      ),
      body: Stack(
        children: <Widget>[
          ListView(children: <Widget>[
            sizedBox(),
            fieldDescricaoTRF(),
            sizedBox(),
            fieldDataTRF(),
            sizedBox(),
            fieldHoraTRF(),
            sizedBox(),
            fieldCalendario()
          ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          addListaTRF(
              _descricaoController.text, _dateInput.text, _timeinput.text);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget fieldCalendario() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: Colors.black87, width: 2.0),
      ),
      child: TableCalendar(
        firstDay: _firstDay,
        lastDay: _lastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }

  Widget sizedBox() {
    return SizedBox(
      height: 30,
    );
  }

  Widget fieldDescricaoTRF() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _descricaoController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Informe a tarefa',
        ),
      ),
    );
  }

  Widget fieldDataTRF() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _dateInput,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.calendar_today),
            labelText: "Insira a data"),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100));
          if (pickedDate != null) {
            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
            setState(() {
              _dateInput.text = formattedDate;
            });
          }
        },
      ),
    );
  }

  Widget fieldHoraTRF() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _timeinput,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.timer),
            labelText: "Qual a hora da sua TRF"),
        readOnly: true,
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );
          if (pickedTime != null) {
            setState(() {
              _timeinput.text = pickedTime.format(context);
            });
          }
        },
      ),
    );
  }

  void addListaTRF(String descricao, String data, String hora) {
    Task t = Task(descricao, data, hora);
    listaTask.add(t);
  }
}
