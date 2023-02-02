import 'package:flutter/material.dart';
import 'package:net_ninja/quotes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Quote> quotes = [
    Quote(text: 'This is first text', author: 'First Author', age: '23'),
    Quote(text: 'This is second text', author: 'Second Author', age: '23'),
    Quote(text: 'This is third text', author: 'Third Author', age: '23'),
    Quote(text: 'This is fourth text', author: 'Fourth Author', age: '23'),
    Quote(text: 'This is fifth text', author: 'Fifth Author', age: '23'),
    Quote(text: 'This is sixth text', author: 'Sixth Author', age: '23')
  ];

  Widget quoteTemplate(quote) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      elevation: .5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quote.text,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  quote.age,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                print('button');
              },
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar Demo'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('This is a snabkar'),
                ),
              );
            },
            icon: Icon(Icons.add_alert),
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
            icon: Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
          ),
        ],
      ),
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}
