import 'package:flutter/material.dart';
import '../widget/appbar.dart';

class HouseKeeperView extends StatefulWidget {
  const HouseKeeperView({super.key});

  @override
  State<HouseKeeperView> createState() => _HouseKeeperViewState();
}

class _HouseKeeperViewState extends State<HouseKeeperView> {
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