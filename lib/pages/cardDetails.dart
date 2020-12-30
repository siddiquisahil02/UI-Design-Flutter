import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsDetails extends StatefulWidget {

  String title, subtitle;
  CardsDetails(this.title, this.subtitle);

  @override
  _CardsDetailsState createState() => _CardsDetailsState();
}

class _CardsDetailsState extends State<CardsDetails> {

  int radioValue=0;

  void handleRadioChange(int value){
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,size: 30,),
          onPressed: (){
            Navigator.pop(context,radioValue);
          },
        ),
        title: Text(widget.title,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text(widget.subtitle,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            SizedBox(height: 50,),
            Center(child: Text("Select your Progress",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: handleRadioChange,
                ),
                Text("0/3")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: handleRadioChange,
                ),
                Text("1/3")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: handleRadioChange,
                ),
                Text("2/3")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 3,
                  groupValue: radioValue,
                  onChanged: handleRadioChange,
                ),
                Text("3/3")
              ],
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              color: Colors.black,
              onPressed: (){
                Navigator.pop(context,radioValue);
              },
              child: Text("BACK",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
