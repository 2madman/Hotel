import 'package:flutter/material.dart';
import '../widget/appbar.dart';

class HouseKeeper extends StatefulWidget {
  const HouseKeeper({Key? key}) : super(key: key);

  @override
  State<HouseKeeper> createState() => _HouseKeeperState();
}

class _HouseKeeperState extends State<HouseKeeper> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("House Keeper"),
      ),
      backgroundColor: Colors.grey[300],
      drawer: NavigationDrawerWidget(),
    );


  }
}