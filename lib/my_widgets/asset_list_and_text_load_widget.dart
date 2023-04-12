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
          SizedBox(
            // width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height,
            child: TextLoaderWidget(
              fileContents: _fileContents,
            ),
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width / 4,
            // height: MediaQuery.of(context).size.height,
            child: AssetListWidget(
              onItemTap: _update,
            ),
          ),
        ],
      ),
    );
  }
}
