import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streambuilder_example/api/bitcoin_api.dart';
import 'package:streambuilder_example/main.dart';
import 'package:streambuilder_example/widget/bitcoin_widget.dart';

class StreamBuilderControllerPage extends StatefulWidget {
  @override
  _StreamBuilderControllerPageState createState() =>
      _StreamBuilderControllerPageState();
}

class _StreamBuilderControllerPageState
    extends State<StreamBuilderControllerPage> {
  final controller = StreamController<double>();
  double bitcoinPrice = BitcoinApi.bitcoinPrice;

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: StreamBuilder<double>(
          initialData: bitcoinPrice,
          stream: controller.stream,
          builder: (context, snapshot) {
            final bitcoins = snapshot.data.toStringAsFixed(2);

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BitcoinWidget(bitcoins: bitcoins),
                  const SizedBox(height: 80),
                  buildBuyButton(),
                ],
              ),
            );
          },
        ),
      );

  Widget buildBuyButton() => RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: Colors.deepOrangeAccent,
        child: Text(
          'Buy Bitcoins',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        onPressed: () async {
          bitcoinPrice = bitcoinPrice + 50;
          controller.sink.add(bitcoinPrice);
        },
      );
}
