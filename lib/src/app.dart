import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'widgets/image-list.dart';
import 'models/image-model.dart';

class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int count = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    count += 1;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$count');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        body: ImageList(images),
        appBar: AppBar(
          title: Text("Let's see some images"),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
