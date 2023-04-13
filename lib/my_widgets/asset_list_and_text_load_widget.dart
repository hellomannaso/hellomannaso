import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'asset_list_widget.dart';
import 'text_load_widget.dart';

class AssetListAndTextLoaderWidget extends StatefulWidget {
  const AssetListAndTextLoaderWidget({super.key});

  @override
  State<AssetListAndTextLoaderWidget> createState() =>
      _AssetListAndTextLoaderWidgetState();
}

class _AssetListAndTextLoaderWidgetState
    extends State<AssetListAndTextLoaderWidget> {
  String fileName = '';
  late List<String> _fileContents = [];

  void _update(String fileName) async {
    if (!fileName.contains('assets')) {
      fileName = 'assets/' + fileName;
    }
    String fileData = await rootBundle.loadString(fileName);

    List<String> textLines = fileData.split('\n\n');

    setState(() {
      _fileContents = textLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // width: MediaQuery.of(context).size.width / 4,
          // height: MediaQuery.of(context).size.height / 2,
          TextLoaderWidget(
            // I deleted SingleChildScrollView here
            // Well this is a listview
            fileContents: _fileContents,
          ),

          // SizedBox(
          // width: MediaQuery.of(context).size.width / 4,
          // height: MediaQuery.of(context).size.height / 2,r
          AssetListWidget(
            onItemTap: _update,
          ),
        ],
      ),
    );
  }
}
