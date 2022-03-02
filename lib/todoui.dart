import 'package:flutter/material.dart';
import 'package:habit_up/dbhelper.dart';
import 'package:intl/intl.dart';

class TodoUi extends StatefulWidget {
  const TodoUi({ Key? key }) : super(key: key);

  @override
  _TodoUiState createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {

  final dbhelper = Databasehelper.instance;
   late DateTime _myDateTime;

  final texteditingcontroller = TextEditingController();
  bool validated = true;
  String errtext = "";
  String todoedited = "";
  // ignore: deprecated_member_use
  List<dynamic> myitems = [];
  // ignore: deprecated_member_use
  List<Widget> children = [];//new List<Widget>();

  void addtodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: todoedited,
    };
    final id = await dbhelper.insert(row);
    print(id);
    Navigator.pop(context);
    todoedited = "";
    setState(() {
      validated = true;
      errtext = "";
    });
  }

  Future<bool> query() async {
    myitems = [];
    children = [];
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      myitems.add(row.toString());
      children.add(Card(
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Expanded(
            child: ListTile(
              title: Text(
                row['todo'],
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Raleway",
                ),
              ),
              onLongPress: () {
                dbhelper.deletedata(row['id']);
                setState(() {});
              },
            ),
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  void showalertdialog() {
    texteditingcontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Add Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      todoedited = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Raleway",
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                512) {
                              setState(() {
                                errtext = "Too may Chanracters";
                                validated = false;
                              });
                            } else {
                              addtodo();
                            }
                          },
                          color: Colors.purple,
                          child: Text("ADD",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Raleway",
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
  //  late DateTime _myDateTime;
  String time = ' ';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text(
              "No Data",
            ),
          );
        } else {
          if (myitems.length == 0) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.purple,
              ),
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  " ",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Center(
                child: Text(
                  "No Task Avaliable",
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20.0),
                ),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.purple,
              ),
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  " ",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  SizedBox(height:20),
                   Text(
                    'HABITS',
                    style: TextStyle( color: Colors.pink,
                      fontSize: 25.0,
                      letterSpacing: 1.0,
       
                    ),
                  ),
                  SizedBox(height:20),
                  Text(
                               time,
                               style: TextStyle(fontSize: 20.0)
                             ),
                             SizedBox(height: 40.0),
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
                                child: Text('Choose your day'),
                                ),
                  SingleChildScrollView(
                    child: Column(children: children),
                  ),
                ],
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}

