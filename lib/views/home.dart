import 'package:flutter/material.dart';
import 'package:pandemicmonitor/utils/alerts.dart';

import '../services/api/bills.dart';
import '../types/bills_data.dart';
import '../controllers/app_controller.dart';
import '../widgets/drawer_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _menuItem = -1;
  List<BillsData>? _listBills = null;

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _setMenuItem(int item) {
    setState(() => _menuItem = item);
    _getBills();
  }

  Widget _drawer() {
    return Column(
      children: [
        // DrawerItem(userData: AppController.instance.userData, anonymous: AppController.instance.userData == null),
        DrawerItem(icon: Icons.list, title: 'Indicadores', onTap: () => _setMenuItem(0)),
        const DrawerItem(separator: true),
        DrawerItem(icon: Icons.list, title: 'Informações', onTap: () => _setMenuItem(0)),
        DrawerItem(icon: Icons.list, title: 'Locais de atendimento', onTap: () => _setMenuItem(1)),
        DrawerItem(icon: Icons.list, title: 'Funcionamento do Comercio', onTap: () => _setMenuItem(2)),
        const DrawerItem(separator: true),
        DrawerItem(icon: Icons.logout, title: 'Sair', onTap: () => {_logout()}),
      ],
    );
  }

  void _getBills() async {
    var response = await getBills(null);
    if (response.success) {
      setState(() {
        _listBills = response.data;
      });
    } else {
      await alertError(context: context, title: 'Buscar contas', msg: response.error ?? 'Erro ao buscar contas');
    }
  }

  Widget _listingBills() {
    if (_listBills != null) {
      _listBills?.forEach((element) {
        print('${element.id} => ${element.description}, ${element.whereSpend}');
      });
    }

    switch (_menuItem) {
      case 0:
        return const Text('Todas as contas');
      case 1:
        return const Text('Contas a vencer');
      case 2:
        return const Text('Contas a vencidas');
      default:
        return const Text('Indefinido');
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
        title: const Text('Minhas Contas'),
      ),
      body: Center(
        child: _listingBills(),
      ),
    );
  }
}
