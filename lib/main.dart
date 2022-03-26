// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

import 'quotes_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am Rich',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int randomImage() {
    return Random().nextInt(13) + 1;
  }

  int randomQuote() {
    return Random().nextInt(quotes.length - 1) + 1;
  }

  int _quote = 1;
  int _image = 1;
  void chnageQuote() {
    setState(() {
      _quote = randomQuote();
      _image = randomImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            AppBar().preferredSize.height);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B1A2D),
        foregroundColor: Color(0xFFFFFFFF),
        title: const Text('I AM Rich!!!'),
      ),
      body: Container(
        height: h,
        color: Color(0xFF093944),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image(
                  height: h * 0.5,
                  image: AssetImage('images/p$_image.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'I AM Rich',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCD4B25),
                  ),
                ),
                Divider(),
                QuoteCard(quote: quotes[_quote], height: h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0B1A2D),
        foregroundColor: Colors.black,
        onPressed: () {
          chnageQuote();
          // Respond to button press
        },
        child: Icon(
          Icons.person_search,
          color: Colors.white,
        ),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Map<String, String> quote;
  final height;

  const QuoteCard({
    required this.quote,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: height * 0.3,
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        title: Text(
          '“${quote['quoteText'] ?? ''}”',
          style: TextStyle(
            // fontFamily: 'Lobster',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE4E1AA),
            fontFamily: 'fonts/Lobster',
          ),
        ),
        subtitle: Container(
          alignment: Alignment.topRight,
          child: Text(
            '-${quote['quoteAuthor'] ?? ''}',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9EA77B),
            ),
          ),
        ),
      ),
    );
  }
}
