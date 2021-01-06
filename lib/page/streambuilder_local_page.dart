import 'dart:math';

import 'package:flutter/material.dart';
import 'package:streambuilder_example/api/bitcoin_api.dart';
import 'package:streambuilder_example/main.dart';
import 'package:streambuilder_example/widget/bitcoin_widget.dart';

class StreamBuilderLocalPage extends StatelessWidget {
  final bitcoinPrice = BitcoinApi.bitcoinPrice;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: StreamBuilder<double>(
          initialData: bitcoinPrice,
          stream: getBitcoinPrice(),
          builder: (context, snapshot) {
            final bitcoins = snapshot.data.toStringAsFixed(2);

            return BitcoinWidget(bitcoins: bitcoins);
          },
        ),
      );

  Stream<double> getBitcoinPrice() => Stream<double>.periodic(
        Duration(seconds: 1),
        (count) => bitcoinPrice + count * 5,
      );
}
