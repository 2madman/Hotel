var liste = [];

class Room{

  int roomNumber;
  int floor;
  bool roomCleaned = false;
  bool initialCleaning = false;
  bool someoneCleaning = false;
  bool someoneAlreadyCleaning = false;
  bool housemen = false;
  bool roomFine = false;
  String roomNeeds = "";
  String uid;
  String whoCleans = "";
  Room(this.roomNumber,this.floor,this.uid);

}

Room room1 = Room(101,1,"1");
Room room2 = Room(102,1,"2");
Room room3 = Room(103,1,"3");
Room room4 = Room(104,1,"4");
Room room5 = Room(105,1,"5");
Room room6 = Room(106,1,"6");
Room room7 = Room(107,1,"7");
Room room8 = Room(108,1,"8");
Room room9 = Room(109,1,"9");
Room room10 = Room(110,1,"10");

void addListe(){

  if(liste.length<10){
    liste.add(room1);
    liste.add(room2);
    liste.add(room3);
    liste.add(room4);
    liste.add(room5);
    liste.add(room6);
    liste.add(room7);
    liste.add(room8);
    liste.add(room9);
    liste.add(room10);
  }
  
}




