import 'package:flutter/material.dart';
import 'package:pandemicmonitor/widgets/indicator.dart';
import 'package:pandemicmonitor/widgets/separator.dart';

class IndicatorPanel extends StatelessWidget {
  const IndicatorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(children: const [
          Text('Indicadores', style: TextStyle(fontSize: 32)),
          Separator(),
          Indicator(title: 'Casos ativos', qtd: '252', bgColor: Colors.yellow),
          Separator(),
          Indicator(title: 'Curados', qtd: '2627', bgColor: Colors.green),
          Separator(),
          Indicator(title: 'Óbitos', qtd: '52', bgColor: Colors.red),
          Separator(flex: 2)
        ]));
  }
}
