import 'package:flutter/material.dart';
import 'package:streambuilder_example/api/bitcoin_api.dart';
import 'package:streambuilder_example/main.dart';
import 'package:streambuilder_example/widget/bitcoin_widget.dart';

class StreamBuilderNetworkPage extends StatefulWidget {
  @override
  _StreamBuilderNetworkPageState createState() =>
      _StreamBuilderNetworkPageState();
}

class _StreamBuilderNetworkPageState extends State<StreamBuilderNetworkPage> {
  final bitcoinPrice = BitcoinApi.bitcoinPrice;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: StreamBuilder<double>(
          initialData: bitcoinPrice,
          stream: BitcoinApi.getPrice(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  final bitcoins = snapshot.data.toStringAsFixed(2);

                  return BitcoinWidget(bitcoins: bitcoins);
                }
            }
          },
        ),
      );

  Stream<double> getBitcoinPrice() => Stream<double>.periodic(
        Duration(seconds: 1),
        (count) => bitcoinPrice + count * 5,
      );
}
