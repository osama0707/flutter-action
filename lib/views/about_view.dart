import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "عن التطبيق",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}