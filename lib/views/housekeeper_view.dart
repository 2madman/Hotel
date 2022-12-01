import 'package:first_app/views/rooms_view.dart';
import 'package:flutter/material.dart';

class HouseKeeperView extends StatefulWidget {
  const HouseKeeperView({super.key});

  @override
  State<HouseKeeperView> createState() => _HouseKeeperViewState();
}

class _HouseKeeperViewState extends State<HouseKeeperView> {
  @override
  Widget build(BuildContext context) {
    return const RoomsView();

  }
}