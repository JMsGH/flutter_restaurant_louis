import 'package:flutter/material.dart';

import 'item_list.dart';

class ItemDescription extends StatefulWidget {
  static const routeName = '/item-description';
  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.nameToPass),
      ),
      body: Column(
        children: [
          Image.network(arguments.urlToPass),
          Text(arguments.priceToPass.toString()),
        ],
      ),
    );
  }
}
