import 'package:first_app/Classes/worker.dart';

class HouseKeeper extends Worker{
  
  var whichRooms = [];
  bool cleaningRooms = false;
  HouseKeeper(super.name, super.id, super.work);
  
}


