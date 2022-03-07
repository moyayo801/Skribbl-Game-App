import 'package:drawme/create_room_screen.dart';
import 'package:flutter/material.dart';

import 'join_room_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 174, 209, 250),
      body: Row(
        children: [
          SizedBox(width: 74,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Image.asset("asset/Boy.png", scale: 1.8,),
                SizedBox(width: 30,),
                Image.asset("asset/rock.png"),
                  SizedBox(width: 30,),
                Image.asset("asset/Girl.png", scale: 3.5,),
              

              ],),  SizedBox(height: 30,),
              const Text("SKRIBBL GAME",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateRoomScreen(),
                        ),
                        ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 218, 97)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width / 1.5, 50)),
                    ),
                    child: const Text(
                      "Create Room",
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed:  () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const JoinRoomScreen(),
                        ),
                        ),

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 218, 97)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width / 1.5, 50)),
                    ),
                    child: const Text(
                      "Join Room",
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
