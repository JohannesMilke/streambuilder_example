import 'package:flutter/material.dart';

class BitcoinWidget extends StatelessWidget {
  final String bitcoins;

  const BitcoinWidget({
    Key key,
    @required this.bitcoins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 30,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/bitcoin.png',
                width: 240,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                '\$ $bitcoins',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
