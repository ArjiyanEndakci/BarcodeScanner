// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, unused_import

import 'package:flutter/material.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:http/http.dart';

import 'package:vekotekbarkod/Handler/ExceptionHandler.dart';
import 'package:vekotekbarkod/Network/network.dart';
import 'package:vekotekbarkod/Routes/BouncyPageRoute.dart';
import 'dart:convert';

import 'package:vekotekbarkod/screens/SayfalarYeni/AnasayfaYeni.dart';

final userNameController = TextEditingController();
final passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final url = "https://mentalsoft.net:46/api/ozlerionic";
  void fetchPosts(BuildContext context) async {
    if (userNameController.text == "" || passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            Text(
              "Lütfen Kullanıcı adı veya Şifre Giriniz!",
            ),
          ],
        ),
      ));
      return;
    }
    try {
      if (userNameController.text == "arjin" &&
          passwordController.text == "1234") {
        Navigator.push(
          context,
          BouncyPageRoute(
            //widget: UrunEkrani(),
            widget: AnasayfaYeni(
              username: userNameController.text,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Hatalı Kullanıcı Adı veya Şifre!!",
          ),
        ));
      }
    } catch (err) {
      print(ExceptionHandlers().getExceptionString(err));
      throw ExceptionHandlers().getExceptionString(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 61, 109, 243),
              Color.fromARGB(255, 2, 85, 133),
              Color.fromARGB(255, 0, 1, 17),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vekotek Barkod Sistemine",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hoşgeldiniz",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/vekoteklogo.jpg',
                          height: 64,
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]!),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: userNameController,
                                    decoration: InputDecoration(
                                      hintText: "Kullanıcı Adını Giriniz",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]!),
                                    ),
                                  ),
                                  child: TextField(
                                    textInputAction: TextInputAction.go,
                                    onSubmitted: (value) {
                                      fetchPosts(context);
                                    },
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        hintText: "Şifre giriniz",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            /*  Navigator.push(
                              context,
                              BouncyPageRoute(
                                widget: SecimEkrani(),
                              ),
                            ); */
                            fetchPosts(context);
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue[900],
                            ),
                            child: Center(
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Design by Arjiyan Yılmaz Endakci",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
