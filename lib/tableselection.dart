import 'package:flutter/material.dart';
import 'package:minto/menuscreen.dart';
import 'package:minto/tablebooking.dart';

class TableSelection extends StatefulWidget {
  const TableSelection({Key? key}) : super(key: key);

  @override
  State<TableSelection> createState() => _TableSelectionState();
}

class _TableSelectionState extends State<TableSelection> {
  List<int> _tables = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; // list of tables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Selection"),
        backgroundColor: Color(0xFFE1B812),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: _tables.length,
            itemBuilder: (BuildContext context, int index) {
              bool isOccupied = false;
              // set to true if table is occupied
              return GestureDetector(
                onTap: () {
                  if (!isOccupied) {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuScreen()));
                    Navigator.pushNamed(context, "/taking Order");
                  } else {

                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isOccupied ? Colors.red : Colors.amber,
                    ),
                    child: Center(
                      child: Text(
                        "Table " + _tables[index].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
