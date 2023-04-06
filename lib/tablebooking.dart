import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minto/confirmorder.dart';
import 'package:minto/menuscreen.dart';
import 'package:minto/tableselection.dart';

class Tablebooking extends StatefulWidget {
  const Tablebooking({Key? key}) : super(key: key);

  @override
  State<Tablebooking> createState() => _TablebookingState();
}

class _TablebookingState extends State<Tablebooking> {
  String _selectedTable = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectPeople = '';

  void _showTableDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Table'),
          backgroundColor: Color(0xFFE1B812),
          content: Container(
            height: 150,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Table ${index + 1}'),
                  onTap: () {
                    setState(() {
                      _selectedTable = 'Table ${index + 1}';
                    });
                    Navigator.pop(context);
                  },

                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final backgroundImage = AssetImage('asset/bg1.jpg');
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: backgroundImage,
        //   fit: BoxFit.cover,
        ),
      // ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber, // set the background color to amber
          title: Text('Table Booking'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 20),
          Text(
            'Select a Table:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableSelection()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.amber, // set the button color to amber
            ),
            child: Text(
              _selectedTable.isNotEmpty ? _selectedTable : 'Select a Table',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Select a Date:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 20),
                    Text(
                    'Select a Time:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                    onTap: () => _selectTime(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '${_selectedTime.hour}:${_selectedTime.minute}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                SizedBox(height: 50,width: 400,),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ConfirmOrderScreen()));
                          },
                          child: Container(
                            child: Center(child: Text('Confirm order')),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                               // color: Color(0xFFEEC11A),
                            ),
                            height: 50,
                            width: 200,
                        ),
                        ),
                      ),],
                    ),
                    ),
                    ),
                    );
                  }
                }