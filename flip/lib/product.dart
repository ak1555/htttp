import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // int indx = 7;
  final mybox = Hive.box('mybox');
  List product = [];

  void getdata() {
    setState(() {
      product = mybox.get(1);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    int indx = int.parse(ModalRoute.of(context)?.settings.arguments as String);
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
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Image.network(product[indx]["images"][0]),
                  ),
                  Container(
                      height: 20,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        product[indx]["title"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  Container(
                    height: 30,
                    width: double.infinity,
                    // alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        // Icon(Icons.currency_rupee_rounded,size: 17,),
                        Text(
                          "\$ ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        Text(
                          product[indx]["price"].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 70,
                            child: Text(
                              "${product[indx]["price"] / product[indx]["discountPercentage"]}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 20,
                      width: double.infinity,
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(product[indx]["category"])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 20,
                      width: double.infinity,
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(product[indx]["brand"])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 20,
                      width: double.infinity,
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: product[indx]["rating"] > 4
                          ? Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 23,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 23,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 23,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 23,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 23,
                                ),
                              ],
                            )
                          : product[indx]["rating"] > 3
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 23,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 23,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 23,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 23,
                                    ),
                                  ],
                                )
                              : product[indx]["rating"] > 2
                                  ? Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 23,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 23,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 23,
                                        ),
                                      ],
                                    )
                                  : product[indx]["rating"] > 1
                                      ? Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.red,
                                              size: 23,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.red,
                                              size: 23,
                                            ),
                                          ],
                                        )
                                      : product[indx]["rating"] > 0
                                          ? Row(
                                              children: [
                                                Icon(Icons.star),
                                              ],
                                            )
                                          : Icon(Icons.star)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      // height: 57,
                      width: double.infinity,
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        product[indx]["availabilityStatus"],
                        style: TextStyle(fontSize: 13.5),
                        maxLines: 3,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      // height: 57,
                      width: double.infinity,
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        product[indx]["description"],
                        style: TextStyle(fontSize: 13.5),
                        maxLines: 3,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      // height: 57,
                      width: double.infinity,
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Stock Left: ${product[indx]["stock"].toString()}",
                        style: TextStyle(fontSize: 13.5),
                        maxLines: 3,
                      )),
                ],
              ),
            ),
            Container(
              height: 75,
              width: double.infinity,
              margin: EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(75)),
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                        // style: textbut,
                          onPressed: () {}, child: Text("Add to Cart"))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {}, child: Text("Shop Now")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
