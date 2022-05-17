import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayip/begenilenler.dart';
import 'package:kayip/haftalik.dart';

import 'package:kayip/main.dart';

import 'Top50.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 34),),
          backgroundColor: Color(0xffe5ccd6),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://img.freepik.com/free-vector/soft-texture-watercolor_1020-915.jpg?size=338&ext=jpg"),
              )
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,26,13,13),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Begenilenler())),
                    child: Container(
                      height: 200,
                      width: 410,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(40),
                        ),
                        color: const Color(0xffe5ccd6),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Çok Satanlar",
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Image(image: AssetImage("images/bs.png"),
                              height: 160,width: 160,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Top50())),
                    child: Container(
                      height: 200,
                      width: 410,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(40),
                        ),
                        color: const Color(0xffe5ccd6),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Çocuklara\n     Özel",
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(35,0,0,0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image(image: AssetImage("images/kids.png"),
                                  height: 160,width: 160,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HaftalikYazar())),
                    child: Container(
                      height: 200,
                      width: 410,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(40),
                        ),
                        color: const Color(0xffe5ccd6),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Hikayenizi gönderin\nbasımını üstlenelim.",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Image(image: AssetImage("images/author.png"),
                                height: 140,width: 140,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
