import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AssetListWidget extends StatefulWidget {
  final Function(String) onItemTap;

  AssetListWidget({required this.onItemTap});

  @override
  _AssetListWidgetState createState() => _AssetListWidgetState();
}

class _AssetListWidgetState extends State<AssetListWidget> {
  List<String> _files = [];

  @override
  void initState() {
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    List<String> files = [];
    final assetDir = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetDir);

    for (String key in manifestMap.keys) {
      if (key.contains('.txt')) {
        files.add(key);
      }
    }

    setState(() {
      _files = files;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _files.isNotEmpty
        ? Column(children: <Widget>[
            Wrap(
                children: _files.map((fileName) {
              if (fileName.contains('assets/')) {
                fileName = fileName.replaceAll('assets/', '');
              }
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.onItemTap(fileName);
                      },
                      child: Text(
                        fileName,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    )
                    // other widgets
                  ],
                ),
              );
            }).toList())
          ])
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return _files.isNotEmpty
  //       ? ListView.builder(
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: _files.length,
  //           shrinkWrap: true,
  //           itemBuilder: (context, index) {
  //             String fileName = _files[index];
  //             if (fileName.contains('assets/')) {
  //               fileName = fileName.replaceAll('assets/', '');
  //             }
  //             return ListTile(
  //               title: Text(fileName),
  //               onTap: () {
  //                 // do something with the selected file

  //                 widget.onItemTap(fileName);
  //               },
  //             );
  //           },
  //         )
  //       : Center(
  //           child: CircularProgressIndicator(),
  //         );
  // }
}
