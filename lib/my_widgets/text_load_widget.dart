import "dart:core";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

// ignore: must_be_immutable
class TextLoaderWidget extends StatelessWidget {
  late List<String> fileContents = [];

  TextLoaderWidget({required this.fileContents});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // children: [
      //   SizedBox(
      //     height: 100,
      //     child: Text('1'),
      //   ),
      //   SizedBox(
      //     height: 150,
      //     child: Text('2'),
      //   ),
      //   SizedBox(
      //     height: 80,
      //     child: Text('3'),
      //   ),
      // ],
      // ad
      // shrinkWrap: true,
      children: [
        Column(
          children: fileContents.asMap().entries.map((entry) {
            int index = entry.key;
            String line = entry.value;
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(children: [
                    Flexible(
                      child: Text(
                        '$index: $line',
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.robotoTextTheme(
                          Theme.of(context).textTheme,
                        ).displaySmall,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 5),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
