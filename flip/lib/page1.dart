import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List ls =[];
  void getdata()async{
var res= await http.get(Uri.parse('https://dummyjson.com/products'));
ls=json.decode(res.body.["products"]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 85,
              width: double.infinity,
            decoration: BoxDecoration(
             
            ),
              child: Row(
                children: [
                  // Text("BRAND NEW"),
                  Container(
                    height: 50,
                    width: 200,
                    child: Expanded(child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    )),
                  ),
                ],
              ),
            ),

             Container(
                    height: 800,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Expanded(child: GridView.builder(
                      itemCount: 7,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.1/3),
                     itemBuilder: (context, index) {
                      return Card(

                      );
                    },)),

                  )
          ],
        ),
      ),
    );
  }
}