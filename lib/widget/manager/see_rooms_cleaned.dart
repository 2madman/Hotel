import 'package:flutter/material.dart';
import '../../Classes/rooms.dart';

class Checkboxxx extends StatefulWidget {
  const Checkboxxx({
    super.key, 
    required this.room
  });

    final Room room;

  @override
  State<Checkboxxx> createState() => _CheckboxxxState();
}

class _CheckboxxxState extends State<Checkboxxx> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            "Room  ${widget.room.roomNumber}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
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
      value: room.roomCleaned,
      onChanged: (bool? newValue) {
      },
    );
  }
}