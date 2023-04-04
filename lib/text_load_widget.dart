import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;

class TextLoaderWidget extends StatefulWidget {
  const TextLoaderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextLoaderWidgetState createState() => _TextLoaderWidgetState();
}

class _TextLoaderWidgetState extends State<TextLoaderWidget> {
  String _fileContents = "";

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  Future<void> loadAsset() async {
    String fileData = await rootBundle.loadString('text.txt');
    setState(() {
      _fileContents = fileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_fileContents),
      )),
    );
  }
}
