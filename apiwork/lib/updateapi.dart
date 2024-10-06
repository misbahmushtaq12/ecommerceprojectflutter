import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureData = getPostApi();
  }
  Future<List<PostModel>> getPostApi() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for(Map i in data){
        postlist.add(PostModel.fromJson(i));
      }
      return postlist;
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<void> addProduct() async {
    final int productId = int.tryParse(idController.text) ?? 0;
    final response = await http.put(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': 'test product',
        'price': 13.5,
        'description': 'lorem ipsum set',
        'image':'https://i.pravatar.cc',
        'category': 'electronic',
      }),
    );
    if (response.statusCode == 200) {
      print('Product added successfully');
      var data=jsonDecode(response.body);
      final newProduct = PostModel.fromJson(data);

      setState(() {
        postlist.insert(productId, newProduct);
        print('Image added');
      });
    } else {
      print('Failed to add product. Status code: ${response.statusCode}');
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
            controller: idController,
            decoration: InputDecoration(labelText: 'Product id'),
          ),
          ElevatedButton(
            onPressed: (){addProduct();
            idController.clear();
            },
            child: Text('Add Product'),

          ),
          Expanded(
            child: FutureBuilder(
              future: futureData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('loading');
                } else{
                  postlist = snapshot.data as List<PostModel>;
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
//updationoneiswrong check flutter documentation "updata data over internet"
