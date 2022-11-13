import 'package:first_app/widget/linked_check2.dart';
import 'package:flutter/material.dart';
import '../Classes/rooms.dart';

Future <void> PopOut(BuildContext context,Room room )
{
  String a = room.roomNumber.toString();
  return showDialog(context: context, builder: (context){
    return AlertDialog(
        title: Text("Room $a"),
        content: Stack(
          clipBehavior: Clip.none, children: <Widget>[
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  LinkedLabelCheckbox2(
                    label: "Need initial cleaning",
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    value: room.initialCleaning,
                    onChanged: (bool newValue) {
                      /*setState(() {
                        room.initialCleaning = newValue;
                      });*/
                    },
                  ),
                  LinkedLabelCheckbox2(
                    label: "Room is cleaned",
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    value: room.roomCleaned,
                    onChanged: (bool newValue) {
                      /*setState(() {
                        //room1.roomCleaned = newValue;
                      });*/
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
  },);
}


/*class PopOut extends StatefulWidget {

  const PopOut({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<PopOut> createState() => _PopOutState();
}

class _PopOutState extends State<PopOut> {
  @override
  Widget build(BuildContext context) {
    String a = widget.room.roomNumber.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AlertDialog(
        title: Text("Room $a"),
        content: Stack(
          clipBehavior: Clip.none, children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  LinkedLabelCheckbox2(
                    label: "Need initial cleaning",
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    value: widget.room.initialCleaning,
                    onChanged: (bool newValue) {
                      setState(() {
                        widget.room.initialCleaning = newValue;
                      });
                    },
                  ),
                  LinkedLabelCheckbox2(
                    label: "Room is cleaned",
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    value: widget.room.roomCleaned,
                    onChanged: (bool newValue) {
                      setState(() {
                        widget.room.roomCleaned = newValue;
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
      ),
    );
  }
}*/