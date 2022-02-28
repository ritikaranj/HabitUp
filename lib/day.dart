import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class day extends StatefulWidget {
  day({Key? key}) : super(key: key);

  @override
  State<day> createState() => _dayState();
}

class _dayState extends State<day> {
 late DateTime _myDateTime;
  String time = '?';
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //  appBar: new AppBar(
      //    title: new Text("day"),

      //  ),
        body: Center(
             child: Column(
                mainAxisSize: MainAxisSize.min,
               children: [
                 Text(
                   time,
                   style: TextStyle(fontSize: 20.0)
                 ),
                 SizedBox(height: 100.0),
                 ElevatedButton(
                   onPressed: ()async{
                        // setState(() {
                        //  final now = DateTime.now();
                        //  time = DateFormat('dd-MM-yyyy').format(now);
                        // });
                        
                    _myDateTime = (await showDatePicker(
                         context: context,
                          initialDate: DateTime.now(),
                           firstDate: DateTime(2010),
                            lastDate: DateTime(2025)))!;
                            setState(() {
                              time = DateFormat('dd-mm-yyyy').format(_myDateTime);
                            });
                   },
                    child: Text('Tell me the time'),
                    )
               ],
               
               )
        )
    );
  }
}