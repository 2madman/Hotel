/*import 'package:flutter/material.dart';

class OffDuty extends StatefulWidget {
  const OffDuty({super.key});

  @override
  State<OffDuty> createState() => _OffDutyState();
}

class _OffDutyState extends State<OffDuty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 350,
            width: 250,
            child: ListView.builder(
                itemCount: houseWorkers.length,
                itemBuilder: (_, index) {
                  return LinkedLabelCheckbox2(
                    label: houseWorkers[index].name,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    value: houseWorkers[index].cleaningRooms,
                    onChanged: (bool? newValue) {
                      setState(() {
                        houseWorkers[index].cleaningRooms = !houseWorkers[index].cleaningRooms; 
                      }); 
                    },
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text("Assign"),
              onPressed: () {
                for(int j=0;j<houseWorkers.length;j++){
                  if(houseWorkers[j].cleaningRooms == true){                                    
                    log(houseWorkers[j].name.toString());                                
                  }
                }
                int a=0;
                for(int i=0;i<liste.length;i++){
                  if(liste[i].housemen == false && liste[i].someoneCleaning == true){
                    Rooms
                    .doc(liste[i].uid)
                    .update
                      ({
                        'housemen': true,
                      });
                    
                    for(int j=0;j<houseWorkers.length;j++){
                        if(houseWorkers[j].cleaningRooms == true){                                    
                          log(houseWorkers[j].whichRooms.toString());
                          a=j;
                          houseWorkers[j].whichRooms.add(liste[i].roomNumber);                                                                     
                          log(liste[i].roomNumber.toString());
                        }
                    }
                    
                  }
                }
                houseWorkers[a].cleaningRooms = false;
                Users
                  .doc(houseWorkers[a].name)
                  .update
                    ({
                      'whichRooms':houseWorkers[a].whichRooms,
                    });
                
                
                Navigator.of(context, rootNavigator: true).pop('dialog');
                showDialog
                ( 
                  context: context,
                  builder:(context) =>AlertDialog(
                  title: const Text("Operation is succesfull"),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context, 'OK');
                        Navigator.of(context).pushAndRemoveUntil
                          (MaterialPageRoute(
                            builder: (context)=> const ManagerView()
                          ),(route)=>false
                        );
                        log("asdad");
                        await refresh();
                        notCleanedRoom();
                      },
                      child: const Text('OK'),
                    ),
                  ],                                      
                ));
              },
            ),
          )
        ],
      ),
    
    
    );  
  }
}*/