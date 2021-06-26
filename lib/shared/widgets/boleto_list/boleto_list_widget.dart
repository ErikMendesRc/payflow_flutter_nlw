import 'package:boletos/shared/models/boleto_models.dart';
import 'package:boletos/shared/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:flutter/material.dart';

import 'boleto_list_controller.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  BoletoListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
        children: boletos.map((e) => BoletoTileWidget(data: e)).toList(),
      ),
    );
  }
}
