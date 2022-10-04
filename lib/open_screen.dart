import 'package:flutter/material.dart';
import 'package:kuis/game_store.dart';
import 'package:url_launcher/url_launcher.dart';


class OpenScreen extends StatefulWidget {
  final GameStore Game;

  const OpenScreen({Key? key, required this.Game}) : super(key: key);

  @override
  State<OpenScreen> createState() => _OpenScreenState();

}

class _OpenScreenState extends State<OpenScreen> {
  @override
  bool toggle = false;
  Color change_color = Colors.white;

    favorite(toggle){
      if(toggle=true) {
        setState(() {
          change_color = Colors.blueGrey;
        });
      }else{
        change_color = Colors.white;
      }

    }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: change_color,
      appBar: AppBar(
        title: Text("${widget.Game.name}"),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  toggle = !toggle;
                  favorite(toggle);
                });
              },
              icon: (toggle)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height)/3,
            child:  ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                scrollDirection: Axis.horizontal,
                itemCount: widget.Game.imageUrls.length,
                itemBuilder: (context, index){
                  return  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10
                      ),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(50)
                      // ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.Game.imageUrls[index],
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            fit: BoxFit.cover,)
                      )

                  );
                }
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Card(
              shape: ContinuousRectangleBorder(
                side: BorderSide(
                    color: Colors.blueGrey
                ),
              ),
              child: ListView(

                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                children: [
                  Text(widget.Game.name,
                    style: TextStyle(
                      fontSize: 27,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(widget.Game.about,
                      style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold,
                      ),),
                  ),
                  SizedBox(height: 30,),
                  Text("Tags  :  ${widget.Game.tags}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15,),
                  Text("Release   :  ${widget.Game.releaseDate}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15,),
                  Text("Reviews | Average : ${widget.Game.reviewAverage} | Count : ${widget.Game.reviewCount}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 40,),
                  Container(
                    padding: EdgeInsets.only(right: 100,left: 100,) ,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          _launchURL(widget.Game.linkStore);
                        },
                        child: Text("Go To Steam")),
                  )
                  // Text("Jam     :  ${widget.place.openTime}",
                  //   style: TextStyle(
                  //     fontSize: 20,fontWeight: FontWeight.bold,
                  //   ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _launchURL(_url) async{
    if(!await launch(_url)) throw 'could not launch $_url';
  }

  // void _favorite(toggle){
  //   if(toggle=true){
  //     backgroundcolor: Colors.white
  //   }
  // }
}