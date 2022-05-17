import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:kayip/home.dart';

import 'kitap.dart';

class Begenilenler extends StatefulWidget {
  const Begenilenler({Key? key}) : super(key: key);

  @override
  _BegenilenlerState createState() => _BegenilenlerState();
}

class _BegenilenlerState extends State<Begenilenler> {
  var url = Uri.parse(
      "https://www.kitapyurdu.com/index.php?route=product/category/&filter_category_all=true&category_id=1&sort=purchased_365&order=DESC&filter_in_stock=1");
  List<Kitap> kitaplar = [];
  bool isLoading = false;

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    var response = document
        .getElementsByClassName("product-grid")[0]
        .getElementsByClassName("product-cr")
        .forEach((element) {
      setState(() {
        kitaplar.add(
          Kitap(
              image: element.children[2].children[0].children[0].children[0]
                  .attributes['src']
                  .toString(),
              kitapAdi: element.children[3].text.toString(),
              yayinEvi: element.children[4].text.toString(),
              yazar: element.children[5].text.toString(),
              fiyat: element.children[8].children[0].text.toString()),
        );
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xffe5ccd6),
        title: const Text('TOP 50',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black54),),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://img.freepik.com/free-vector/soft-texture-watercolor_1020-915.jpg?size=338&ext=jpg"),
            )
        ),
        child: isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : SafeArea(
          //ekrandaki boşlukları düzenliyor
          child: GridView.builder(
            padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 30,
                crossAxisSpacing: 10),
            itemCount: kitaplar.length,
            itemBuilder: (context, index) => SizedBox(
              width: 10,
              height: 100,
              child: Card(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 6,
                color: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Center(
                              child: Image.network(kitaplar[index].image,
                                  width: 170,height: 140),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              (index+1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Kitap İsmi: ${kitaplar[index].kitapAdi}",
                        style: _style,
                      ),
                      Text(
                        "Kitap YayınEvi: ${kitaplar[index].yayinEvi}",
                        style: _style,
                      ),
                      Text(
                        "Kitap Yazarı: ${kitaplar[index].yazar}",
                        style: _style,
                      ),
                      Text(
                        "${kitaplar[index].fiyat} ₺",
                        style: _style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final TextStyle _style = const TextStyle(color: Colors.black, fontSize: 15);
}
