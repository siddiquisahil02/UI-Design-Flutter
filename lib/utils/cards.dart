import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {

  String assetadd;
  String title;
  String subtile;
  int progress;

  Cards(this.assetadd, this.title, this.subtile,this.progress);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {

  bool isBook = false;
  bool isgreen;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Container(
      height: 90,
      width: 340,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 7,
              offset: Offset(0, 3)
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(widget.assetadd,
                      height: 55,
                      width: 50,
                      fit: BoxFit.fitHeight,
                    )
                ),
              ),
              Container(
                width: 215,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(widget.subtile,
                        style: TextStyle(color: Colors.grey,fontSize: 16),
                        overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 10,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,int ind){
                if(widget.progress > ind)
                  {
                    isgreen = true;
                  }
                else
                  {
                    isgreen = false;
                  }
                return Container(
                  margin: EdgeInsets.only(left: 9,bottom: 3),
                  height: 7,
                  width: 100,
                  decoration: BoxDecoration(
                      color: isgreen?Color.fromRGBO(119, 176, 72, 1):Color.fromRGBO(243, 237, 255, 1),
                      borderRadius: BorderRadius.circular(10)
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
