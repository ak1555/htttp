import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  List item = [];
  final mybox = Hive.box('mybox');
  void gtdata(){
    setState(() {
      item= mybox.get(11);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gtdata();
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
              alignment: Alignment.center,
              child: Text("Your Cart",style: TextStyle(fontSize: 22,letterSpacing: 1.5,
              fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 800,
              width: double.infinity,
              padding: EdgeInsets.only(left: 8,right: 8),
              child: Card(
                child: Expanded(child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 155,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            height: 135,
                            width: 115,
                            child: Image.network(item[index]["images"][0],fit: BoxFit.cover,),
                          ),
                          // Text("data")
                        ],
                      ),
                    ),
                  );
                },)),
              ),
            )
          ],
        ),
      ),
    );
  }
}