import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  
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
            //  color: const Color.fromARGB(255, 112, 119, 114)
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))
            ),
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
                      border: Border.all(width: 0.1)
                    ),
                    child: Icon(Icons.perm_identity_rounded,size: 35,),
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    child: Expanded(child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.grey)
                          ),
                          focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: const Color.fromARGB(255, 59, 92, 59))
                          ),suffixIcon: Icon(Icons.mic),
                          // suffixText: "hiiiii",
                          prefixIcon: Icon(Icons.search),
                          labelText: "Search"
                      ),
                    )),
                  ),
                 IconButton(onPressed: () {} , icon:  Icon(Icons.shop_outlined))
                ],
              ),
            ),
            ListView(
              children: [
                Container(
                  height: 250,
                width: double.infinity,
                 child: Image.network(items[index]["images"][0]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}