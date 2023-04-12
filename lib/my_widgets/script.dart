import 'package:flutter/material.dart';

class ScriptDisplayWidget extends StatelessWidget {
  final String text;
  final String audioFilePath;
  final String speakerName;

  ScriptDisplayWidget(this.text, this.audioFilePath, this.speakerName);

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 8),
        Text(
          speakerName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Text(text),
        SizedBox(width: 8),
        // ignore: unnecessary_null_comparison
        // if (audioFilePath != null) AudioPlayerWidget(audioFilePath: 'mypath'),
      ],
    );
  }
}
