import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List ls=[];
void getapi() async{

  var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  print(res);
setState(() {
    ls=json.decode(res.body);
});
  print(ls);

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Expanded(child: ListView.builder(
          itemCount: ls.length,
          itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10,left: 2,right: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(ls[index]['id'].toString(),style: TextStyle(color: const Color.fromARGB(255, 102, 2, 2)),),
                    Spacer(),
                    Text(ls[index]['title'],style: TextStyle(color: Colors.red.shade800),),
                    Spacer()
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("UserID: ${ls[index]["userId"]}"),
                    // Spacer(),
                    SizedBox(width: 50,),
                    Text(ls[index]["body"],style: TextStyle(fontSize: 10),),
                    Spacer(),
                    
                  ],
                )
              ],
            ),

          );
        },)),
      ),
    );
  }
}