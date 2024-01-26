// ignore_for_file: unused_import, file_names, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:vekotekbarkod/Network/network.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class StokGor extends StatefulWidget {
  const StokGor({super.key});

  @override
  State<StokGor> createState() => _StokGorState();
}

class MyItem {
  final String text;
  final int value;

  MyItem(this.text, this.value);
}

final barcodeController = TextEditingController();
final miktarController = TextEditingController();

String _urunKodu = "";
int _depoStok = 0;
int _aracStok = 0;
String _aciklama = "";
String _ekleyenKullanici = "";
String _eklenenDepo = "";

var getResult = 'QR Code Result';
bool? verigel = false;

class _StokGorState extends State<StokGor> {
  MyItem? selectedValue;

  void scanQRCode() async {
    barcodeController.text = "";
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      barcodeController.text = qrCode;
      fetchPosts();
    } on PlatformException {
      getResult = 'Barkod Okuma Hatalı.';
    }
  }

  void fetchPosts() async {
    try {
      if (barcodeController.text == "4008") {
        setState(() {
          verigel = true;
          _urunKodu = "0000008";
          _aciklama = "Araç Yağ Filtresi";
          _depoStok = 10;
          _aracStok = 7;
          _ekleyenKullanici = "Arjiyan";
          _eklenenDepo = "Adana";
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Hatalı Barkod!",
          ),
        ));
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      verigel = false;
    });

    //fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 45,
                  color: Colors.blue.shade900,
                  child: Center(
                    child: Text(
                      "VEKOTEK Stok Durum",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  )),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Geri Dön",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Stok Durum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 30,
                                child: Icon(
                                  Icons.document_scanner,
                                  size: 30,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textInputAction: TextInputAction.go,
                                onSubmitted: (value) {
                                  fetchPosts();
                                },
                                controller: barcodeController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Barkod Girin',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 13),
          GestureDetector(
            onTap: () {
              scanQRCode();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      scanQRCode();
                    },
                    child: Text(
                      "BARKOD OKU",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    /*  HizliSayfaGit(
                        context, MakineBarkodParcalar(makineID: _makineID)); */
                  },
                  child: verigel == true
                      ? Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ürün Kodu:",
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    "${_urunKodu}",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(height: 1, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Açıklama:",
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    "${_aciklama}",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(height: 1, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Depo Stok:",
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    "${_depoStok} Adet",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(height: 1, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Araç Stok:",
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    "${_aracStok} Adet",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(height: 1, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ekleyen Kişi:",
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    "${_ekleyenKullanici}",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(height: 1, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Eklenen Bölge:",
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    "${_eklenenDepo}",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
