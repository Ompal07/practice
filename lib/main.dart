import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practice_21/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Welcome!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<List> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            debugPrint('Error Occured');
            return Center(
              'Please check your internet connection!'
            )
          }
          if(snapshot.hasData){
            return Container(
              child: Users(usersList: snapshot.data,),
            );
          }
          else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => SecondScreen())
            );
          },
          child: Icon(Icons.message_rounded, ),

        ),
      
    );
  }
}

class Users extends StatelessWidget {
  List usersList;
  Users({this.usersList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usersList.length,
      itemBuilder: (context, i){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.cyan
              ])
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[

                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          // Colors.redAccent,
                          // Colors.pink
                          // Color(0x42A5F5),
                          // Color.fromRGBO(19,106,138, 1.0),
                          // Color.fromRGBO(38,120,113, 1),

                          Color.fromRGBO(67,206,162, 1),
                          Color.fromRGBO(24,90,157, 1),
                          // Color.fromRGBO(75,192,200, 1),
                        ]
                      )
                    ),
                    child: Center(child: Text('${usersList[i]['id']}', style: TextStyle(color: Colors.white, fontSize: 20),)),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width - 10,
                          child: Text('${usersList[i]['name']}', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
                        ),

                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.white,),
                            Container(
                              child: Text('${usersList[i]['username']}', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
