import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final mybox = Hive.box('mybox');
  List ls = [];
  List items = [];
  void getdata() async {
    print("hi");
    var res = await http.get(Uri.parse('https://dummyjson.com/products'));
// List l=json.decode(res.body);
    ls.add(json.decode(res.body));
// ls=json.decode(res.body);
// print(ls[0]["products"]);
    setState(() {
      items = ls[0]["products"];
    });
    mybox.put(1, items);
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
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  //  color: const Color.fromARGB(255, 112, 119, 114)
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 214, 211, 211),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 0.1)),
                    child: Icon(
                      Icons.perm_identity_rounded,
                      size: 35,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    child: Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 59, 92, 59))),
                          suffixIcon: Icon(Icons.mic),
                          // suffixText: "hiiiii",
                          prefixIcon: Icon(Icons.search),
                          labelText: "Search"),
                    )),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.shop_outlined))
                ],
              ),
            ),
            Container(
              height: 695,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10),
              // color: Colors.red,
              child: Expanded(
                  child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(index);
                      Navigator.pushNamed(context, "pro",
                          arguments: index.toString());
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: 103,
                            width: double.infinity,
                            // margin: EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.grey[50]
                            ),
                            child: Image.network(items[index]["images"][0]),
                          ),
                          // SizedBox(height: 5,),
                          Container(
                              height: 25,
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Text(
                                items[index]["title"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                          // SizedBox(height: 10,),
                          Container(
                            height: 18,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Category:  ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text("${items[index]["category"]}"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.9,
                          ),

                          Container(
                            height: 25,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                              children: [
                                // Icon(Icons.currency_rupee_rounded,size: 17,),
                                Text(
                                  "\$",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  items[index]["price"].toString(),
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 60,
                                    child: Text(
                                      "${items[index]["price"] / items[index]["discountPercentage"]}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.9,
                          ),
                          Container(
                            height: 18,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                              children: [
                                // Text("Discount:  ",style: TextStyle(
                                //   fontSize: 13,letterSpacing: .0
                                // ),),
                                Text(
                                  items[index]["discountPercentage"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800,
                                      fontSize: 14),
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.green,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  width: 72,
                                  child: items[index]["rating"] > 3
                                      ? Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.green,
                                              size: 17,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.green,
                                              size: 17,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.green,
                                              size: 17,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.green,
                                              size: 17,
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 18,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 13,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Text(
                              "Stock Left:  ${items[index]["stock"]}",
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 17,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 10, right: 15),
                            child: Text(
                              "  ${items[index]["shippingInformation"]}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
