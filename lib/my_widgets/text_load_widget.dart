import "dart:core";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// ignore: must_be_immutable
class TextLoaderWidget extends StatefulWidget {
  late List<String> fileContents = [];

  TextLoaderWidget({required this.fileContents});

  @override
  State<TextLoaderWidget> createState() => _TextLoaderWidgetState();
}

class _TextLoaderWidgetState extends State<TextLoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: widget.fileContents.asMap().entries.map((entry) {
            int index = entry.key; // Numbering
            String line = entry.value; // Actual Text (content)
            return Utterance(index: index, line: line);
          }).toList(),
        ),
      ],
    );
  }
}

class Utterance extends StatelessWidget {
  const Utterance({
    super.key,
    required this.index,
    required this.line,
  });

  final int index;
  final String line;

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtterance(index: index, line: line);
  }
}

// ignore: must_be_immutable
class ResponsiveUtterance extends StatefulWidget {
  var index;
  var line;
  bool status = true;

  ResponsiveUtterance({
    super.key,
    required this.index,
    required this.line,
  });

  @override
  State<ResponsiveUtterance> createState() => _ResponsiveUtteranceState();
}

class _ResponsiveUtteranceState extends State<ResponsiveUtterance> {
  var index1 = 0;
  String line1 = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.index);
        setState(() {
          widget.status = !widget.status;
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white54,
            ),
            child: Text(widget.status ? widget.index.toString() : '1004',
                style: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
                    .headlineMedium),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: !widget.line.toString().startsWith('http')
                    ? Text.rich(TextSpan(
                        text: widget.status ? widget.line : 'Clicked',
                        style: GoogleFonts.robotoTextTheme(
                                Theme.of(context).textTheme)
                            .headlineMedium,
                      ))
                    : Text.rich(TextSpan(
                        text: widget.status ? widget.line : 'Clicked',
                        style: GoogleFonts.robotoTextTheme(
                                Theme.of(context).textTheme)
                            .headlineMedium,
                      ))
                // InAppWebView(
                //     initialUrlRequest:
                //         URLRequest(url: Uri.parse(widget.line)),
                //     onWebViewCreated: (InAppWebViewController controller) {
                //       controller.loadUrl(
                //           urlRequest: URLRequest(
                //         url: Uri.parse(widget.line),
                //       ));
                //     }),

                ),
          ),
        ]),
      ),
    );
  }
}
