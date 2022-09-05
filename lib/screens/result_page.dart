import 'package:flutter/material.dart';
import 'package:karaca_katalog/reusable_widgets/reusable_widget.dart';
import 'dart:convert';
import 'package:karaca_katalog/Item/product_model.dart' hide Image;
import 'package:http/http.dart' as http;
import 'package:barcode_widget/barcode_widget.dart';

import 'search_screen.dart';

Future<Album> fetchAlbum() async {
  const String apiEndpoint = '';
  final Uri url = Uri.parse(apiEndpoint);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

late PageController _pageController;
int activePage = 1;

class _ResultPageState extends State<ResultPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        item.getImages()!.clear();
        item.setId("");
        item.setName(Text(""));
        item.setPrice(Text(""));
        item.setSku("");
        item.setModel(Text(""));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: 350.0,
                      width: 350.0,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: FutureBuilder<Album>(
                          future: fetchAlbum(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              snapshot.data?.data!.products!.forEach(
                                (element) {
                                  if (element.productId == item.getId() ||
                                      element.sku == item.getSku()) {
                                    item.setSku(element.sku);
                                    element.images!.forEach(
                                      (element) {
                                        item.images!.add(element.url!);
                                      },
                                    );
                                  }
                                },
                              );
                              return PageView.builder(
                                clipBehavior: Clip.antiAlias,
                                itemCount: 3,
                                pageSnapping: true,
                                controller: _pageController,
                                onPageChanged: (page) {
                                  setState(
                                    () {
                                      activePage = page;
                                    },
                                  );
                                },
                                itemBuilder: (context, pagePosition) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                          item.images![pagePosition],
                                          fit: BoxFit.cover),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(3, activePage),
                    )
                  ],
                ),
                SizedBox(
                  height: 100.0,
                  width: 400.0,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: FutureBuilder<Album>(
                      future: fetchAlbum(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          snapshot.data?.data!.products!.forEach(
                            (element) {
                              if (element.productId == item.getId() ||
                                  element.sku == item.getSku()) {
                                item.setSku(element.sku!);
                                item.name = Text(
                                  element.name ?? "",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              }
                            },
                          );
                          return item.name!;
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 60.0,
                      width: 400,
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child: FutureBuilder<Album>(
                          future: fetchAlbum(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              snapshot.data?.data!.products!.forEach(
                                (element) {
                                  if (element.productId == item.getId() ||
                                      element.sku == item.getSku()) {
                                    item.model = Text(
                                      "Model : ${element.model}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                },
                              );
                              return item.model!;
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 400.0,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: FutureBuilder<Album>(
                          future: fetchAlbum(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              snapshot.data?.data!.products!.forEach(
                                (element) {
                                  if (element.productId == item.getId() ||
                                      element.sku == item.getSku()) {
                                    item.price = Text(
                                      "Price : ${element.listPrice!.formattedValue}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    );
                                  }
                                },
                              );
                              return item.price!;
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: item.sku!,
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
