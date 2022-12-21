import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/views/housekeeper/rooms_view.dart';
import 'package:flutter/material.dart';
import '../manager/manager_view.dart';

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