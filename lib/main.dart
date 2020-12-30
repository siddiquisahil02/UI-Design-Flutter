import 'package:avtaar_education/pages/Design_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController pageController = PageController();
  int page = 0;

  List<String> categories = ['Design','Environment','Technology','Research','Literature','Economics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 25,),
          onPressed: (){},
        ),
        title: Text("Lessons",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: InkWell(
              child: Stack(
                children: [
                  Image.asset('assets/bg.png',height: 27,width: 27,),
                  Positioned(
                    top: 6,
                    left: 5,
                    child: Text("10",style: TextStyle(color: Colors.white,fontSize: 13.5),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.circle,size: 8,color: Color.fromRGBO(175,175,175, 1),),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, int index){
                  bool isblue = false;
                  if(index == page)
                    {
                      isblue = !isblue;
                    }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            pageController.animateToPage(index,duration: Duration(milliseconds: 250),curve: Curves.bounceInOut);
                          },
                          child: Text(categories[index],
                            style: TextStyle(fontWeight: FontWeight.bold,color: page==index?Colors.black:Color.fromRGBO(215, 215, 215, 1)),
                          ),
                        ),
                        SizedBox(height: 10,),
                        isblue?Container(
                          width: 25,
                          height: 3,
                          color: Color.fromRGBO(99, 11, 255, 1),
                        ):SizedBox(height: 3,)
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: PageView(
                onPageChanged: (index){
                  setState(() {
                    page = index;
                  });
                },
                pageSnapping: true,
                controller: pageController,
                children: [
                  Design_page(),
                  Container(alignment: Alignment.center,child: Text(categories[page],
                    style:TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
                  Container(alignment: Alignment.center,child: Text(categories[page],
                    style:TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
                  Container(alignment: Alignment.center,child: Text(categories[page],
                    style:TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
                  Container(alignment: Alignment.center,child: Text(categories[page],
                    style:TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
                  Container(alignment: Alignment.center,child: Text(categories[page],
                    style:TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
