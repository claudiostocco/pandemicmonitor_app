import 'package:flutter/material.dart';

import '../types/user_data.dart';
import './separator.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key, this.title, this.icon, this.separator = false, this.onTap, this.userData, this.anonymous = false})
      : assert((title != null && icon != null && onTap != null) || separator || userData != null || anonymous),
        super(key: key);

  final String? title;
  final IconData? icon;
  final bool separator;
  final GestureTapCallback? onTap;
  final UserData? userData;
  final bool anonymous;

  @override
  Widget build(BuildContext context) {
    if (separator) {
      return const LineSeparator(
        thickness: 2,
      );
    } else if (userData != null || anonymous) {
      UserData? _userData;
      if (anonymous) {
        _userData = UserData('', 'Usuário Anônimo (Dev)');
      } else {
        _userData = userData;
      }
      if (_userData!.userImage != null && userData!.userImage!.isNotEmpty) {
        return UserAccountsDrawerHeader(
          accountEmail: Text(_userData.userEmail),
          accountName: Text(_userData.userName),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(_userData.userImage ?? ''),
          ),
        );
      } else {
        return UserAccountsDrawerHeader(
          accountEmail: Text(_userData.userEmail),
          accountName: Text(_userData.userName),
        );
      }
    } else {
      return ListTile(
        leading: Icon(icon),
        title: Text(title ?? ''),
        onTap: onTap,
      );
    }
  }
}
