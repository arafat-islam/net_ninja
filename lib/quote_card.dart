import 'package:flutter/material.dart';
import './quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quote? quote;
  final VoidCallback? delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                  'Text: ${quote?.text}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Age: ${quote?.age}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Text(
              'Author: ${quote?.author}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton.icon(
              icon: Icon(Icons.delete),
              label: Text('Delete'),
              onPressed: delete,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
