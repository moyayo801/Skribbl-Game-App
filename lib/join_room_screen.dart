import 'package:drawme/paint_screen.dart';
import 'package:flutter/material.dart';
import 'package:drawme/widgets/custom_text_field.dart';


class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();

  void joinRoom(){
    if (_nameController.text.isNotEmpty && _roomNameController.text.isNotEmpty) {
      Map<String, String> data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text,
      };
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
       PaintScreen(data: data, screenFrom: 'joinRoom')));
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
            "Join Room",
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
        
          
          SizedBox( height: 40),
          ElevatedButton(onPressed:joinRoom, 
           style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 218, 97)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(color: Color.fromARGB(255, 75, 67, 67))),
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width / 1.5, 50)),
                    ),
          child: Text("Join"),
          )
        ],
      ),
    );
  }
}
