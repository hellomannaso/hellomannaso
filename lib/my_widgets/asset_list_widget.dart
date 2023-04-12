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
        ? ListView.builder(
            itemCount: _files.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final fileName = _files[index];
              return ListTile(
                title: Text(fileName),
                onTap: () {
                  // do something with the selected file
                  widget.onItemTap(fileName);
                },
              );
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
