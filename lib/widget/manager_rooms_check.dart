import 'package:first_app/widget/pop_out_manager.dart';
import 'package:flutter/material.dart';
import '../Classes/rooms.dart';

class ManagerCheckbox extends StatefulWidget {

   const ManagerCheckbox({
    super.key,
    required this.room,

  });

  final Room room;
  
  @override
  State<ManagerCheckbox> createState() => _ManagerCheckboxState();
}

class _ManagerCheckboxState extends State<ManagerCheckbox> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () async {
                PopOutManager(context,widget.room);
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
        ],
      ),
    );
  }
}