import 'package:first_app/widget/pop_out.dart';
import 'package:flutter/material.dart';
import '../Classes/rooms.dart';



class LinkedLabelCheckbox extends StatefulWidget {

   const LinkedLabelCheckbox({
    super.key,
    required this.room,

  });

  final Room room;
  
  @override
  State<LinkedLabelCheckbox> createState() => _LinkedLabelCheckboxState();
}

class _LinkedLabelCheckboxState extends State<LinkedLabelCheckbox> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () async {
                print(widget.room.roomCleaned);
                PopOut(context,widget.room);
              },
              child: Text(
                widget.room.roomNumber.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blueAccent
                ),
                ),
              ),
          ),
          Checkbox(
            value: widget.room.roomCleaned,
            onChanged: (bool? newValue) {
              setState(() {
                widget.room.roomCleaned = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}