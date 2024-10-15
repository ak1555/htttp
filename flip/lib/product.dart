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
  List item =[];
  bool cart = false;
  bool shop = false;

  void getdata() {
    setState(() {
      product = mybox.get(1);
    });
  }
  void getcart(){
    if(mybox.get(11)!=null){
      setState(() {
        item=mybox.get(11);
      });
    }
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
        child: Card(
          child: Column(
            children: [
              Container(
                height: 80,
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
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 214, 211, 211),
                          color: Colors.teal[50],
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
                    IconButton(onPressed: () {
                       if(mybox.get(11)!=null){
                    Navigator.pushNamed(context, "cart");
                    }else{
                      showDialog(context: context, builder: (context) {
                        return Card(
                         child:  AlertDialog(
                          title: Text("OOPS!!!!"),
                          content: Text("Empty Cart"),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context); 
                            }, child: Text("OK"))
                          ],
                         )
                        );
                      },);
                    }
                    }, icon: Icon(Icons.shop_outlined))
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 8,),
                    Card(
                      child: Container(
                        height: 270,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 18, right: 15,bottom: 18),
                        margin: EdgeInsets.only(left: 15,right: 15),
                        // child: Image.network(product[indx]["thumbnail"]),
                         child: Expanded(child: ListView.builder(
                          itemCount: product[indx]["images"].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                          return Container(
                            height: 270,
                            width: 300,
                            color: Colors.white,
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child: Image.network(product[indx]["images"][index],fit: BoxFit.contain,),
                          );
                        },)),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Card(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
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
                          SizedBox(height: 20),
                          Container(
                            height: 32,
                            width: double.infinity,
                            // alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 18, right: 15),
                            child: Row(
                              children: [
                                // Icon(Icons.currency_rupee_rounded,size: 17,),
                                Text(
                                  "\$ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 23.5),
                                ),
                                Text(
                                  product[indx]["price"].toString(),
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14.5,
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
                                          fontSize: 20, fontWeight: FontWeight.bold),
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
                              padding: EdgeInsets.only(left: 18, right: 15),
                              child: Text(product[indx]["category"])),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 20,
                              width: double.infinity,
                              // alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 18, right: 15),
                              child:product[indx]["brand"]!=null? Text(product[indx]["brand"]):
                              Text("Food Materials",style: TextStyle(),)),
                               SizedBox(
                      height: 10,
                    ),
                        ],
                      ),
                    ),
                   SizedBox(height: 5,),
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
                                  // Icon(
                                  //   Icons.star,
                                  //   color: Colors.green,
                                  //   size: 23,
                                  // ),
                                     SizedBox(width: 5,),
                                           Text(product[indx]["rating"].toString(),
                                           style: TextStyle(fontWeight: FontWeight.bold,height: 2),)
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
                                      // Icon(
                                      //   Icons.star,
                                      //   color: Colors.amber,
                                      //   size: 23,
                                      // ),
                                        SizedBox(width: 5,),
                                           Text(product[indx]["rating"].toString(),
                                           style: TextStyle(fontWeight: FontWeight.bold,height: 2),)
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
                                          // Icon(
                                          //   Icons.star,
                                          //   color: Colors.orange,
                                          //   size: 23,
                                          // ),
                                          SizedBox(width: 5,),
                                           Text(product[indx]["rating"].toString(),
                                           style: TextStyle(fontWeight: FontWeight.bold,height: 2),)
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
                                              // Icon(
                                              //   Icons.star,
                                              //   color: Colors.red,
                                              //   size: 23,
                                              // ),
                                                SizedBox(width: 5,),
                                           Text(product[indx]["rating"].toString(),
                                           style: TextStyle(fontWeight: FontWeight.bold,height: 2),)
                                            ],
                                          )
                                        : product[indx]["rating"] > 0
                                            ? Row(
                                                children: [
                                                  Icon(Icons.star),
                                                    SizedBox(width: 5,),
                                           Text(product[indx]["rating"].toString(),
                                           style: TextStyle(fontWeight: FontWeight.bold,height: 2),)
                                                ],
                                              )
                                            : Icon(Icons.star)),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          product[indx]["availabilityStatus"],
                          style: TextStyle(fontSize: 13.5),
                          maxLines: 3,
                        )),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          product[indx]["description"],
                          style: TextStyle(fontSize: 13.5),
                          maxLines: 3,
                        )),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          "Stock Left: ${product[indx]["stock"].toString()}",
                          style: TextStyle(fontSize: 13.5),
                          maxLines: 3,
                        )),
                    SizedBox(height: 10,),
                    Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          "Return Policy: ${product[indx]["returnPolicy"]}",
                          style: TextStyle(fontSize: 13.5),
                          maxLines: 3,
                        )),
                    // SizedBox(height: 10),
                    // Text("   Related Images",style: TextStyle(fontSize: 18),),
                    // Container(
                    //   height: 210,
                    //   width: double.infinity,
                    //   // color: Colors.pink,
                     
                    // ),
                    SizedBox(height: 10,),
                     Text("   Reviews:",style: TextStyle(fontSize: 18),),
                     Container(
                        height: 250,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Card(
                          child: Expanded(
                            child: ListView.builder(
                            itemCount: product[indx]["reviews"].length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                            return Container(
                              width: 200,
                              margin: EdgeInsets.only(right: 10,left: 15),
                              padding: EdgeInsets.only(left: 10,right: 7,top: 7),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.02),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product[indx]["reviews"][index]["reviewerName"].toString(),
                                    style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 8,),
                                  Text(product[indx]["reviews"][index]["date"].toString(),
                                    style: TextStyle(fontSize: 12),),
                                    SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Text("Rating: ",style: TextStyle(fontSize: 13),),
                                      Text(product[indx]["reviews"][index]["rating"].toString(),
                                        style: TextStyle(fontSize: 15),),
                                    ],
                                  ),
                                    SizedBox(height: 8,),
                                  Text(product[indx]["reviews"][index]["comment"],
                                    style: TextStyle(fontSize: 15)),
                                    SizedBox(height: 8,),
                                  Text(product[indx]["reviews"][index]["reviewerEmail"].toString(),
                                    style: TextStyle(fontSize: 12)),
                                    SizedBox(height: 8,),
                                ],
                              ),
                            );
                          },)),
                        )),
                    // SizedBox(height: 15,)
                     SizedBox(height: 10,),
                    Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          "Warrenty Details: ${product[indx]["warrantyInformation"]}",
                          style: TextStyle(fontSize: 14.5),
                          maxLines: 3,
                        )),
                        SizedBox(height: 10,),
                    Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          "Created Deatils: ${product[indx]["meta"]["createdAt"]}",
                          style: TextStyle(fontSize: 13.5),
                          maxLines: 3,
                        )),
                         SizedBox(height: 8,),
                          Container(
                        // height: 57,
                        width: double.infinity,
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        child: Text(
                          "Created Deatils: ${product[indx]["meta"]["updatedAt"]}",
                          style: TextStyle(fontSize: 13.5),
                          maxLines: 3,
                        )),
                         SizedBox(height: 10,),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(75)),
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: cart?Colors.teal[100]:Colors.teal[50],
                            padding: EdgeInsets.only(top: 26,
                            bottom: 26)
                          ),
                            onPressed: () {
                              List ls =[];
                              if(mybox.get(11)!=null){
                                 ls=mybox.get(11);
                                //  product[indx].add({
                                //   "Qty":1
                                //  }
                                //  );
                                ls.add(product[indx]);
                                // ls[indx].add({"qty":1});
                                mybox.put(11, ls);
                              }else{
                                 ls.add(product[indx]);
                                mybox.put(11, ls);
                              }
                              
                              setState(() {
                                cart=true;
                                shop=false;
                              });
                            }, child: Text("Add to Cart"))),
                    Expanded(
                        child: TextButton(
                           style: TextButton.styleFrom(
                             backgroundColor: shop?Colors.teal[100]:Colors.teal[50],
                            padding: EdgeInsets.only(top: 26,
                            bottom: 26)
                          ),
                            onPressed: () {
                              print("shoped");
                              setState(() {
                                cart=false;
                              shop=true;
                              });
          
                            }, child: Text("Shop Now")))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
