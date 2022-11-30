import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pandemicmonitor/widgets/indicator_panel.dart';

import '../widgets/drawer_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _menuItem = -1;

  void _logout() {
    exit(0);
    // Navigator.pushReplacementNamed(context, '/');
  }

  void _setMenuItem(int item) {
    setState(() => _menuItem = item);
    context.findAncestorStateOfType<ScaffoldState>()?.openEndDrawer();
    // Scaffold.of().closeDrawer();
  }

  Widget _drawer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
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
      ),
    );
  }

  Widget _listingBills() {
    switch (_menuItem) {
      case 0:
        return const IndicatorPanel();
      case 1:
        return const Text('Informações');
      case 2:
        return const Text('Locais de atendimentos');
      case 3:
        return const Text(
            'Define regras para o funcionamento do comercio, como horário, restrições, distanciamento minimo, etc.');
      default:
        return const IndicatorPanel();
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
