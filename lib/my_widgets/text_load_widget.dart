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
      shrinkWrap: true,
      children: [
        Column(
          children: fileContents.asMap().entries.map((entry) {
            int index = entry.key; // Numbering
            String line = entry.value; // Actual Text (content)
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white54,
                  ),
                  child: Text('$index',
                      style: GoogleFonts.robotoTextTheme(
                              Theme.of(context).textTheme)
                          .headlineMedium),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: '$line',
                        style: GoogleFonts.robotoTextTheme(
                                Theme.of(context).textTheme)
                            .bodyLarge,
                      ),
                    ),
                  ),
                ),
              ]),
            );
          }).toList(),
        ),
      ],
    );
  }
}
