import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

Widget listViewBuilder(List storeHistory){

    return Expanded(
      child: ListView.builder(
        itemCount: storeHistory.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
              color: const Color.fromARGB(255, 121, 111, 138),
              borderRadius: BorderRadius.circular(18),
              ),
              child:  Center(
                child: Text(
                  'Date: ${storeHistory[index].date} \nCleaned room number:${storeHistory[index].cleanedRooms}\n Uncleaned room number:${storeHistory[index].notCleanedRooms}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

class _HistoryState extends State<History> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      backgroundColor: Colors.grey[300],
      body: 
      Column(
        children: [
          const SizedBox(height: 15,),
          listViewBuilder(storeHistory),
        ],
      ),
    );
  }
}