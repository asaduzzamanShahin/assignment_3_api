import 'package:flutter/material.dart';

class PhotoDetailsScreen extends StatefulWidget {
  const PhotoDetailsScreen({
    super.key,
    this.Title,
    this.Imageurl,
    this.id,
  });

  final Title;
  final Imageurl;
  final id;

  @override
  State<PhotoDetailsScreen> createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 100),
          Image.network(widget.Imageurl),
          const SizedBox(height: 20),
          Text(widget.Title.toString()),
          Text("ID : ${widget.id.toString()}"),
        ]),
      ),
    );
  }
}
