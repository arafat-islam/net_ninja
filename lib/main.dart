import 'package:flutter/material.dart';
import 'package:net_ninja/quotes.dart';
import './quote_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Quote> quotes = [
    Quote(text: 'This is first text', author: 'First Author', age: '23'),
    Quote(text: 'This is second text', author: 'Second Author', age: '23'),
    Quote(text: 'This is third text', author: 'Third Author', age: '23'),
    Quote(text: 'This is fourth text', author: 'Fourth Author', age: '23'),
    Quote(text: 'This is fifth text', author: 'Fifth Author', age: '23'),
    Quote(text: 'This is sixth text', author: 'Sixth Author', age: '24')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Demo'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a snabkar'),
                ),
              );
            },
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snakbar',
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
          ),
        ],
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                    print('Delete button pressed!');
                  });
                }))
            .toList(),
      ),
    );
  }
}
