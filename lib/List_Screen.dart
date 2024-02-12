import 'dart:convert';
import 'package:http/http.dart';

import 'Model_Class.dart';
import 'Photo_Details_Screen.dart';
import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

List<Photos> PhotosList = [];

bool Loding = false;

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    GetListFormApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Photo Gallery"),
        backgroundColor: Colors.orangeAccent,

      ),
      body: PhotosList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: PhotosList.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailsScreen(
                            Title: PhotosList[index].title,
                            Imageurl: PhotosList[index].url,
                            id: PhotosList[index].id),
                      ));
                },
                title: Text(PhotosList[index].title ?? ""),
                leading: Image.network(PhotosList[index].thumbnailUrl ?? ""),
              ),
            ),

    );
  }


  Future<void> GetListFormApi() async {
    setState(() {
      Loding = true;
    });
    Uri MyUrl = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    Response response = await get(MyUrl);
    if (response.statusCode == 200) {
      var ResponseDecode = jsonDecode(response.body);
      for (var i in ResponseDecode) {
        setState(() {
          Photos MyApiList = Photos.fromJson(i);
          PhotosList.add(MyApiList);
        });
      }
    } else {
      setState(() {
        Loding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Product created successfully",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }
  }
}

