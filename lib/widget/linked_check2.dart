import 'package:flutter/material.dart';

class LinkedLabelCheckbox2 extends StatelessWidget {
  const LinkedLabelCheckbox2({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,

  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blueAccent
              ),
              ),
            ),
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}