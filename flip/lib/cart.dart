import 'dart:math';

import 'package:flip/page1.dart';
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
    print(item);
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
              height: 65,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Text("My Cart",style: TextStyle(fontSize: 25,letterSpacing: 1.5,
              fontWeight: FontWeight.bold),),
            ),
            Container(
              // height: 800,
              height: 630,
              width: double.infinity,
              padding: EdgeInsets.only(left: 8,right: 8),
              child: Card(
                child: Expanded(child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 155,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 5,),
                          Column(
                            children: [
                              Container(
                                height: 20,
                                width: 170,
                                child: Text(
                                  item[index]["title"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                        SizedBox(height: 2,),
                             Container(
                              width: 170,
                              // height: 20,
                              // width: double.infinity,
                              alignment: Alignment.center,
                              // padding: EdgeInsets.only(left: 18, right: 15),
                              child:item[index]["brand"]!=null? Text(item[index]["brand"]):
                              Text("Food Materials",style: TextStyle(),)),
                        SizedBox(height: 3,),
                              Row(
                              children: [
                                // Icon(Icons.currency_rupee_rounded,size: 17,),
                                Text(
                                  "\$ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18.5),
                                ),
                                Text(
                                  item[index]["price"].toString(),
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12.5,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 60,
                                    child: Text(
                                      "${item[index]["price"] / item[index]["discountPercentage"]}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17, fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                        SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text("Minimum Order Quatity: ",style: TextStyle(fontSize: 12),),
                                    Text(item[index]["minimumOrderQuantity"].toString()),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Text("Qty:"),

                                    Container(
                                      height: 45,
                                      // width: 155,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Card(
                                              child: IconButton(padding: EdgeInsets.only(bottom: 6),
                                                onPressed: () {
                                                
                                              }, icon: Icon(Icons.minimize_sharp)),
                                            ),
                                            Text("1"),
                                            Card(
                                              child: IconButton(padding: EdgeInsets.only(bottom: 2),
                                                onPressed: () {
                                                
                                              }, icon: Icon(Icons.add)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                            ],
                          ),
        SizedBox(width: 10,),
                          Container(
                            height: 135,
                            width: 105,
                            child: Image.network(item[index]["images"][0],fit: BoxFit.cover,),
                          ),
                          // Text("data")
                        ],
                      ),
                    ),
                  );
                },)),
              ),
            ),
            Container(
              height: 85,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Card(color: Colors.greenAccent[300],
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent[300]
                  ),
                  onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return Card(
                      child: AlertDialog(
                        title: Text("Thank You"),
                        content:Row(
                          children: [
                            Text("You Purchased For Rs:100"),
                          ],
                        ),
                        actions: [
                           TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("CANCEL")),

                          TextButton(onPressed: () {
                          List l=[];
                          mybox.put(11, l);
                          Navigator.popUntil(context, ModalRoute.withName("pro"));
                        }, child: Text("OK"))
                        
                        ],
                      ),
                    );
                  },);
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BUY OUT",style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(width: 5,),
                    Icon(Icons.shop_two_outlined),
                    SizedBox(width: 2,)
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}