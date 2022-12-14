import 'package:first_app/widget/linked_check2.dart';
import 'package:flutter/material.dart';

import '../../views/manager/manager_view.dart';

Widget listViewBuilder(List liste){
  var value = false;
  return Column(
    children: [
      SizedBox(
        height: 15,
        width: 222,
        child: ListView.builder(
          itemCount: nameStore.length,
          itemBuilder: (context,index){
            return LinkedLabelCheckbox2(
              label: nameStore[index],
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: false,
              onChanged: (bool? newValue) {
                value = !value;
              },
            );
          },
        ),
      ),
    ],
  );
}

Future <void> UserPopOut(BuildContext context)
{
  
  var valuee = false;
  var valueg = false;
  return showDialog(
    context: context,
    builder: (context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
            title: const Text("Housekeepers"),
            content: Stack(
              clipBehavior: Clip.none, children: <Widget>[
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      LinkedLabelCheckbox2(
                        label: nameStore[1],
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: valueg,
                        onChanged: (bool newValue) {
                          setState(() {
                            valueg = !valueg;
                          });
                        },
                      ),
                      LinkedLabelCheckbox2(
                        label: nameStore[2],
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: valuee,
                        onChanged: (bool newValue) {
                          setState(() {
                            valuee = !valuee;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text("Assign"),
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
  );
  
  /*return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Housekeepers"),
      content: Column(
        children: [
          listViewBuilder(nameStore),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Assign")),
      ],
    ),
  );*/  
      /*Expanded(
        child: ListView.builder(
          itemCount: nameStore.length,
          itemBuilder: (context,index){
            return LinkedLabelCheckbox2(
              label: nameStore[index],
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: false,
              onChanged:(value) => value = true,
            );               
          },
        ),
      ),*/
}
