// ignore_for_file: prefer_const_constructors, file_names, library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:vekotekbarkod/Routes/SayfaGecis.dart';
import 'package:vekotekbarkod/screens/SayfalarYeni/StokDurum/StokGor.dart';

class AnasayfaYeni extends StatefulWidget {
  final String username;
  const AnasayfaYeni({Key? key, required this.username}) : super(key: key);

  @override
  _AnasayfaYeniState createState() => _AnasayfaYeniState();
}

class _AnasayfaYeniState extends State<AnasayfaYeni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      //drawer: DrawerMenu(),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
              width: double.infinity,
              height: 45,
              color: Colors.blue.shade900,
              child: Center(
                child: Text(
                  "VEKOTEK",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              )),
          //TopBar(),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              padding: EdgeInsets.only(right: 15),
              width: MediaQuery.of(context).size.width - 30.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        //BouncyPageRoute(context, GunlukAlis(gelen: 'Alış'));
                        HizliSayfaGit(context, StokGor());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Hero(
                              tag: "assets/warehouse.png",
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/warehouse.png"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Stok Durum",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        //BouncyPageRoute(context, GunlukAlis(gelen: 'Alış'));
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Hero(
                              tag: "assets/paper.png",
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/paper.png"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Çıkış Yap",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
