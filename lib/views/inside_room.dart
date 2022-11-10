import 'package:flutter/material.dart';
import '../Classes/rooms.dart';
import '../widget/linked_check.dart';
import '../widget/linked_check2.dart';

class InsideRoom extends StatefulWidget {
  @override
  _InsideRoomState createState() => _InsideRoomState();
}

class _InsideRoomState extends State<InsideRoom> {
  final _formKey = GlobalKey<FormState>();

  Room room1 = Room(101,1);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Room 101"),
                    content: Stack(
                      clipBehavior: Clip.none, children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              LinkedLabelCheckbox2(
                                label: "Need initial cleaning",
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                value: room1.initialCleaning,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    room1.initialCleaning = newValue;
                                  });
                                },
                              ),
                              LinkedLabelCheckbox2(
                                label: "Room is cleaned",
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                value: room1.roomCleaned,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    room1.roomCleaned = newValue;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  child: const Text("Okay"),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true).pop('dialog');
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Text("Open Popup"),
        ),
      ),
    );
  }
}