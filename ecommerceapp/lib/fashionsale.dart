import 'dart:convert';

import 'package:ecommerceapp/productdetails1.dart';
import 'package:ecommerceapp/sametextstyle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'ProductDetails.dart';
import 'favouriteprovider.dart';
import 'modules/NewModel.dart';
import 'modules/PostModel.dart';

class FashionSale extends StatefulWidget {
  @override
  State<FashionSale> createState() => _FashionSaleState();
}

class _FashionSaleState extends State<FashionSale> {
  List<PostModel> Postlist = [];
  bool buttonpressed = false;
  Future<List<PostModel>> getpostapi() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Postlist.add(PostModel.fromJson(i));
      }
      return Postlist;
    } else {
      return Postlist;
    }
  }

  List<NewModel> newmodellist = [];
  Future<List<NewModel>> getnewmodel() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        newmodellist.add(NewModel.fromJson(i));
      }
      return newmodellist;
    } else {
      return newmodellist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Visibility(
                  visible: !buttonpressed,
                  child: Image.asset('assets/images/Big Banner.png',
                      height: 572, width: 450, fit: BoxFit.cover),
                ),
                Positioned(
                    top: 360,
                    child: Text(' Fashion', style: SameTextStyle.heading1)),
                Positioned(
                    top: 420,
                    child: Text(' sale', style: SameTextStyle.heading1)),
                Positioned(
                    left: 15,
                    top: 505,
                    child: SizedBox(
                      width: 190,
                      height: 45,
                      child: Visibility(
                        visible: !buttonpressed,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonpressed = !buttonpressed;
                            });
                          },
                          child: Text(
                            ' check',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              //      primary: Colors.red
                              ),
                        ),
                      ),
                    )),
                Visibility(
                    visible: buttonpressed,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Small banner.png',
                            width: 450,
                            height: 199,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Sale',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50),
                          ),
                          Text(
                            "Super Summer Sale",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 370,
                            child: FutureBuilder(
                                future: getnewmodel(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 250,
                                                  width: 150,
                                                  color: Colors
                                                      .grey, // Placeholder color
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 16,
                                                  width: 150,
                                                  color: Colors
                                                      .grey, // Placeholder color
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 16,
                                                  width: 100,
                                                  color: Colors
                                                      .grey, // Placeholder color
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 16,
                                                  width: 50,
                                                  color: Colors
                                                      .grey, // Placeholder color
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount:
                                            5, // You can adjust the number of shimmer items
                                      ),
                                    );
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        if (newmodellist[index].images !=
                                                null &&
                                            newmodellist[index].images!.length >
                                                1)
                                          return Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductDetails1(
                                                              Product:
                                                                  newmodellist[
                                                                      index],
                                                              Index: index,
                                                            )));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    newmodellist[index]
                                                        .images![1]
                                                        .toString(),
                                                    height: 250,
                                                    width: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Container(
                                                      width: 200,
                                                      child: Text(
                                                        newmodellist[index]
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  Text(
                                                    '\$:${newmodellist[index].price.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                      },
                                      itemCount: newmodellist.length,
                                    );
                                  }
                                }),
                          )
                        ],
                      ),
                    ))
              ]),
              SizedBox(
                height: 20,
              ),
              Text(
                'New',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                "You've never seen it before",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 550,
                child: FutureBuilder(
                    future: getpostapi(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 300,
                                      width: 200,
                                      color: Colors.grey, // Placeholder color
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 16,
                                      width: 200,
                                      color: Colors.grey, // Placeholder color
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 16,
                                      width: 150,
                                      color: Colors.grey, // Placeholder color
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 16,
                                      width: 100,
                                      color: Colors.grey, // Placeholder color
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount:
                                5, // You can adjust the number of shimmer items
                          ),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                                Product: Postlist[index],
                                                Index: index,
                                              )));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(children: [
                                      Image.network(
                                        Postlist[index].image.toString(),
                                        height: 300,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        right: 0,
                                        child: Consumer<FavouriteProvider>(
                                            builder: (context, value, child) {
                                          return Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: IconButton(
                                                onPressed: () {
                                                  if (value.selecteditem
                                                      .contains(index)) {
                                                    value.removeitem(index);
                                                  } else
                                                    value.additem(index);
                                                },
                                                icon: value.selecteditem
                                                        .contains(index)
                                                    ? Icon(Icons.favorite)
                                                    : Icon(Icons
                                                        .favorite_border_outlined)),
                                          );
                                        }),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Ratings:${Postlist[index].rating!.rate.toString()}'),
                                    Container(
                                        width: 200,
                                        child: Text(
                                          Postlist[index].title.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Text(
                                        'Category:${Postlist[index].category.toString()},'),
                                    Text(
                                      '\$:${Postlist[index].price.toString()}',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: Postlist.length,
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
