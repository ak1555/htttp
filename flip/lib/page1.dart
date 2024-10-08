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
  List items=[];
  void getdata()async{
    print("hi");
var res= await http.get(Uri.parse('https://dummyjson.com/products'));
// List l=json.decode(res.body);
ls.add(json.decode(res.body));
// ls=json.decode(res.body);
// print(ls[0]["products"]);
setState(() {
  items=ls[0]["products"];
});
print("k");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
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
              padding: EdgeInsets.only(left: 15,right: 15),
            decoration: BoxDecoration(
             
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 0.1)
                    ),
                    child: Icon(Icons.perm_identity_rounded,size: 35,),
                  ),
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
                 IconButton(onPressed: () {} , icon:  Icon(Icons.shop_outlined))
                ],
              ),
            ),

             Container(
                    height: 800,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 5,right: 5),
                    // color: Colors.red,
                    child: Expanded(child: GridView.builder(
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.1/3),
                     itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child: Image.network(items[index]["images"][0]),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 25,
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Text(items[index]["title"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                              )),
                              SizedBox(height: 10,),
                            
                              Container(
                                height: 27,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.currency_rupee_rounded,size: 17,),
                                    Text(items[index]["price"].toString(),style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 15,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),                              
                              Container(
                                height: 25,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Text("Discount:  ",style: TextStyle(
                                      fontSize: 13,letterSpacing: 0
                                    ),),
                                    Text(items[index]["discountPercentage"].toString(),style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800,
                                      fontSize: 16
                                    ),),
                                     Icon(Icons.arrow_downward,color: Colors.green,size: 15,),
                                  ],
                                ),
                              ),
                              Container(
                                height: 15,
                                width: double.infinity,
                                 padding: EdgeInsets.only(left: 10,right: 10),
                                child: Text("Stocks:  ${items[index]["stock"]}",style: TextStyle(
                                  fontSize: 13
                                ),),
                              ),
                               SizedBox(height: 10,),                             
                              Container(
                                height: 37,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10,right: 15),
                                child: Text("  ${items[index]["description"]}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(fontSize: 13),),
                              ),
                          ],
                        ),
                      );
                    },)),

                  )
          ],
        ),
      ),
    );
  }
}