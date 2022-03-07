import 'package:drawme/paint_screen.dart';
import 'package:drawme/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRoundsValue;
  late String? _roomSizeValue;

void CreateRoom(){
  
if(_nameController.text.isNotEmpty && 
_roomNameController.text.isNotEmpty && 
_maxRoundsValue != null && 
_roomSizeValue != null ){
   Map<String, String> data ={
     "nickname": _nameController.text,
     "name": _roomNameController.text,
     "occupancy": _maxRoundsValue!,
     "maxRounds": _roomSizeValue!
   };
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data, screenFrom: 'createRoom')));
}

}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 174, 209, 250),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create Room",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              Controller: _nameController,
              hintText: "NICKNAME",
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              Controller: _roomNameController,
              hintText: "Room Name",
            ),
          ),
          SizedBox( height: 20),
          DropdownButton<String>(
            items: <String>["2","5","10","15"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                        .toList(),
                        hint: Text("Rounds"),
                        onChanged:(String? value){
                          setState(() {
                            _maxRoundsValue= value;
                          });
                        } ,
          ),
          SizedBox( height: 20),
                    DropdownButton<String>(
            items: <String>["2","3","4","5","6","7","8"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                        .toList(),
                        hint: Text("Players"),
                        onChanged:(String? value){
                          setState(() {
                            _roomSizeValue= value;
                          });
                        } ,
          ),
          SizedBox( height: 40),
          ElevatedButton(onPressed: CreateRoom ,
          style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 218, 97)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(color: Color.fromARGB(255, 75, 67, 67))),
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width / 1.5, 50)),
                    ), 
          child: Text("Create"),
          )
        ],
      ),
    );
  }
}
