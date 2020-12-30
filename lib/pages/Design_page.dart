import 'package:avtaar_education/utils/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cardDetails.dart';

class Design_page extends StatefulWidget {
  @override
  _Design_pageState createState() => _Design_pageState();
}

class _Design_pageState extends State<Design_page> {

  List<int> progress = [0,0,0,0];
  List<bool> bookmarks = [false,false,false,false];
  List<bool> openlock = [false,false,false,false];
  List<String> assets = ['assets/bitmap.png','assets/uxDesign.png','assets/interactionDesign.png','assets/bitmap.png'];
  List<String> titles = ["UI Design","UX Design","Interaction Design","Industrial Design"];
  List<String> subTiles = ['Visual appearance of app sjd','Brain behind the design','Includes animations and effects','Visual appearance of app & design'];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: titles.length,
        itemBuilder: (context, int index){
          return InkWell(
            onTap: ()async{
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardsDetails(titles[index],subTiles[index]),
                  ));
              setState(() {
                if(result!=null)
                  progress[index] = result;
              });
            },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Cards(assets[index],titles[index],subTiles[index],progress[index]),
                      Positioned(
                          top: 10,
                          right: 15,
                          child: InkWell(
                              onTap: (){
                                setState(() {
                                  bookmarks[index] = !bookmarks[index];
                                });
                              },
                              child: bookmarks[index]?Icon(Icons.bookmark, size: 25,):Icon(Icons.bookmark_border, size: 25,)
                          )
                      ),
                    ],
                  ),
                  InkWell(
                    child: Icon(!openlock[index]?Icons.lock_outline:Icons.lock_open_outlined,
                    color: !openlock[index]?Colors.black:Color.fromRGBO(175,175,175, 1),),
                    onTap: (){
                      setState(() {
                        openlock[index]= !openlock[index];
                      });
                    },
                  )
                ],
              )
          );
        },
      )
    );
  }
}
