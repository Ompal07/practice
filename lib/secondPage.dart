import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  

  @override
  Widget build(BuildContext context) {


    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hello there!'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue
              ]
            )
          ),
        ),
      ),

      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
              child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset('assets/image.jpg'),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Text('Dummy Text', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                    ),

                  ]
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 8),
                  child: Text("I didn't knew what to do with the image so i Just Clipped it from the edges and Overlayed a text using Stack.\n\n I could have done more with the list view but it might take more time."),
                ),

                

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      top: 20
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.tag_faces_rounded, color: Colors.black,size: 60,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text('THANK YOU!', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25)),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}