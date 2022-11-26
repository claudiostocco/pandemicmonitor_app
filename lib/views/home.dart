import 'package:flutter/material.dart';
import 'package:pandemicmonitor/widgets/separator.dart';

import '../widgets/drawer_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _menuItem = -1;

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _setMenuItem(int item) {
    setState(() => _menuItem = item);
  }

  Widget _drawer() {
    return Column(
      children: [
        // DrawerItem(userData: AppController.instance.userData, anonymous: AppController.instance.userData == null),
        DrawerItem(icon: Icons.list, title: 'Indicadores', onTap: () => _setMenuItem(0)),
        const DrawerItem(separator: true),
        DrawerItem(icon: Icons.list, title: 'Informações', onTap: () => _setMenuItem(1)),
        DrawerItem(icon: Icons.list, title: 'Locais de atendimento', onTap: () => _setMenuItem(2)),
        DrawerItem(icon: Icons.list, title: 'Funcionamento do Comercio', onTap: () => _setMenuItem(3)),
        const DrawerItem(separator: true),
        DrawerItem(icon: Icons.logout, title: 'Sair', onTap: () => {_logout()}),
      ],
    );
  }

  Widget _indicator(String title, String qtd, Color backColor) {
    return Container(
      color: backColor,
      width: 190,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      child: Column(
        children: [
          Text(style: const TextStyle(color: Colors.black, fontSize: 28), title),
          const SizedBox(height: 10),
          Text(style: const TextStyle(color: Colors.black, fontSize: 40), qtd)
        ],)
    );
  }

  Widget _indicatorsPanel() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Expanded(
        flex: 1, 
        child: Column(children: [
            const Text('Indicadores', style: TextStyle(fontSize: 32)),
            const Separator(),
            _indicator('Casos ativos', '252', Colors.yellow),
            const Separator(),
            _indicator('Curados', '2626', Colors.green),
            const Separator(),
            _indicator('Óbitos', '52', Colors.red),
            const Separator(flex: 2)
          ]
        )  
      )
    );
  }

  Widget _listingBills() {
    switch (_menuItem) {
      case 0:
        return _indicatorsPanel();
      case 1:
        return const Text('Informações');
      case 2:
        return const Text('Locais de atendimentos');
      case 3:
        return const Text('Define regras para o funcionamento do comercio, como horário, restrições, distanciamento minimo, etc.');
      default:
        return _indicatorsPanel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: _drawer(),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Monitor de pandemia'),
      ),
      body: Center(
        child: _listingBills(),
      ),
    );
  }
}
