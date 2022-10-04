

import 'package:flutter/material.dart';
import 'package:kuis/game_store.dart';
import 'package:kuis/open_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:ListView.builder(
        itemBuilder: (context, index){
          final GameStore game = gameList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OpenScreen(Game: game);
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
              child: Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Image.network(game.imageUrls[0],),
                    Text(game.name,
                      style:TextStyle(
                        fontWeight: FontWeight.bold,fontFamily:'Calibri' ,
                        fontSize: 18,
                      ) ,
                    ),
                    Text(game.price,
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: gameList.length,
      ),
    );
  }

}
