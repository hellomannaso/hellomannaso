import 'package:flutter/material.dart';
// import 'package:hello_mannaso_world/recording/recording.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            child: Text('Sign in with Google'),
            onPressed: () {
              print('button pressed');
            },
          ),
          ElevatedButton(
            onPressed: () async {
              print('Recording started');
            },
            child: Text('Start Recording'),
          ),
          ElevatedButton(
            onPressed: () async {
              print('Recording stopped');
            },
            child: Text('Stop Recording'),
          ),
        ],
      ),
    );
  }
}
