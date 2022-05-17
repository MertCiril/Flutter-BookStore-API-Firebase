import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HaftalikYazar extends StatefulWidget {
  const HaftalikYazar({Key? key}) : super(key: key);
  @override
  _HaftalikYazarState createState() => _HaftalikYazarState();
}
class _HaftalikYazarState extends State<HaftalikYazar> {
  void main() async{
    WidgetsFlutterBinding.ensureInitialized();//firebase başlatıyor bu iki satır
    await Firebase.initializeApp();
  }
  late String email, metin, isim;

  emailAl(emailTutucu) {
    this.email = emailTutucu;
  }
  isimAl(isimTutucu) {
    this.isim = isimTutucu;
  }
  metinAl(metinTutucu) {
    this.metin = metinTutucu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Haftalık",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 25),),
        backgroundColor: Color(0xffe5ccd6),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://img.freepik.com/free-vector/soft-texture-watercolor_1020-915.jpg?size=338&ext=jpg"),
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white60,
                child: TextFormField(
                  onChanged: (String emailTutucu) {
                    emailAl(emailTutucu);
                  },
                  decoration: const InputDecoration(
                      labelText: "    İletişim için email adresinizi giriniz..",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54, width: 3),
                      )),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white60,
                child: TextFormField(
                  onChanged: (String isimTutucu) {
                    isimAl(isimTutucu);
                  },
                  decoration: const InputDecoration(
                      labelText: "    Hikayenin başlığını yazın..",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54, width: 3),
                      )),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white60,
                child: TextFormField(
                  onChanged: (String metinTutucu) {
                    metinAl(metinTutucu);
                  },
                  maxLines: 23,
                  decoration: const InputDecoration(
                      labelText: "    Metninizi bu alana yazınız..",
                      labelStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54, width: 3),
                      )),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 150,

              child: ElevatedButton(
                onPressed: () {gonder();},
                child: const Text("Gönder",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                style: ElevatedButton.styleFrom(

                    primary: Colors.black, onPrimary: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }
  void gonder(){
    DocumentReference veriYolu = FirebaseFirestore.instance.collection("Metinler").doc(email);
    Map<String,dynamic>Yazilar= {
      "Mail":email,
      "Baslik":isim,
      "Yazi":metin,

    };
    veriYolu.set(Yazilar).whenComplete((){
      Fluttertoast.showToast(msg: isim+" başlıklı metin gönderildi.");
    });

  }
}
