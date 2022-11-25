import 'package:first_app/widget/pop_out.dart';
import 'package:flutter/material.dart';
import '../Classes/rooms.dart';


class LinkedLabelCheckbox3 extends StatefulWidget {

   const LinkedLabelCheckbox3({
    super.key,
    required this.room,

  });

  final Room room;
  
  @override
  State<LinkedLabelCheckbox3> createState() => _LinkedLabelCheckbox3State();
}

class _LinkedLabelCheckbox3State extends State<LinkedLabelCheckbox3> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            " Room       ${widget.room.roomNumber}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.blueAccent
            ),
          ),
          Checkboxx(widget.room),
        ],
      ),
    );
  }

  Widget Checkboxx(Room room ){

    return Checkbox(
      value: room.someoneCleaning,
      onChanged: (bool? newValue) {
        setState(() {
          room.someoneCleaning = newValue!;
        });
      },
    );

  }
}