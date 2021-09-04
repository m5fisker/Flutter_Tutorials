import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: classTest(),
  ));
}

class classTest extends StatefulWidget {
  const classTest({Key? key}) : super(key: key);

  @override
  _classTestState createState() => _classTestState();
}

class _classTestState extends State<classTest> {
  List<Quote> quotes = [
    Quote(author: 'Soorya', q: 'WTF is going on'),
    Quote(author: 'Soorya', q: 'Ok getting the hang of it now'),
  ];

  Widget quoteFunction(quote,  {required Function() delete}) {
    return NewWidget(quote: quote, delete: delete,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Class Test'),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            child: Column(
          children: quotes.map((quote) => quoteFunction(
            quote,
            delete:()
            {
              setState(() {
                quotes.remove(quote);
              }); 
            }
          )).toList(),
        )));
  }
}

class NewWidget extends StatelessWidget {
  final Quote quote;
  final VoidCallback delete;
  NewWidget({required this.quote, required this.delete});
 

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.q!,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              quote.author!,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 8.0,),
            TextButton.icon(
              onPressed: delete,
               icon: Icon(Icons.delete) ,
                label: Text('Delete Quote'),
              ),
          ],
        ),
      ),
    );
  }
}
