import 'package:first_app/widget/manager/delete_pop.dart';
import 'package:flutter/material.dart';
import '../../Classes/housekeeper.dart';
import '../housekeeper/linked_check2.dart';


Future <dynamic> DeletePopOut2(BuildContext context,var housekeepers,String a)
{


  return showDialog(
    context: context,
    builder: (context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
            title: Text(a),
            insetPadding: EdgeInsets.zero,
            content: Stack(
              clipBehavior: Clip.none, children: <Widget>[
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 350,
                        width: 250,
                        child: 
                          ListView.builder(
                            itemCount: housekeepers.length,
                            itemBuilder: (_, index) {
                              return LinkedLabelCheckbox2(
                                label: housekeepers[index].name,
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                value: housekeepers[index].delete,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    housekeepers[index].delete = !housekeepers[index].delete; 
                                  }); 
                                },
                              );
                            }
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text("Fire employee"),
                          onPressed: () {      
                            HouseKeeper employee = HouseKeeper("","","","",[]);
                            for(int i=0;i<housekeepers.length;i++){
                              if(housekeepers[i].delete == true){
                                employee = housekeepers[i];
                              }
                            }  
                            DeletePopOut(context, employee,a);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
      },);
    }
  );
}

