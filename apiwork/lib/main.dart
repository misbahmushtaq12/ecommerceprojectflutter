import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'modules/PostModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostModel> postlist = [];
  late Future<List<PostModel>> futureData;
  TextEditingController titleController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureData = getPostApi();
  }

  Future<List<PostModel>> getPostApi() async {

      final response = await Dio().get('https://fakestoreapi.com/products');
      var data = response.data;
      if (response.statusCode == 200) {
        for(Map i in data){
          postlist.add(PostModel.fromJson(i));
        }
        return postlist;
      } else {
        return postlist;
      }

  }

  Future<void> addProduct() async {
    try {
      final response = await Dio().post(
        'https://fakestoreapi.com/products',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          'title': titleController.text,
          'price': 13.5,
          'description': 'lorem ipsum set',
          'image': imageController.text,
          'category': 'electronic',
        },
      );

      if (response.statusCode == 200) {
        print('Product added successfully');
        var data = jsonDecode(response.data);
        final newProduct = PostModel.fromJson(data);

        setState(() {
          postlist.insert(0, newProduct);
          print('Image added');
        });
      } else {
        print('Failed to add product. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API call'),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Product Title'),
          ),
          TextField(
            controller: imageController,
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
          ElevatedButton(
            onPressed: () {
              addProduct();
              titleController.clear();
              imageController.clear();
            },
            child: Text('Add Product'),
          ),
          Expanded(
            child: FutureBuilder(
              future: futureData,
              builder: (context, snapshot) {
             if (!snapshot.hasData ) {
                  return Text('loading');
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(postlist[index].title.toString()),
                          Image.network(postlist[index].image.toString()),
                        ],
                      );
                    },
                    itemCount: postlist.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

