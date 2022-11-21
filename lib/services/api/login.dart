import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../types/api_result.dart';
import '../../types/user_data.dart';

Future<ApiResult<UserData>> login(String user, String pass) async {
  //var url = Uri.parse(kUrlapi + 'login/' + user + '/' + pass);
  var url = Uri.parse(kUrlapi + 'users/' + user.replaceAll('.', '-') + '.json');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    /* Código necessário somente para o Firebase, se o BackEnd tiver metódo de validção não precisa. */
    if (jsonResponse == null || jsonResponse['password'] != pass) {
      return Future(
        () => ApiResult(false, null, error: 'Usuário não encontrado ou senha inválida!'),
      );
    }

    return Future(
      () => ApiResult(
        true,
        UserData(
          user,
          jsonResponse['name'],
          userImage: jsonResponse['avatar'],
        ),
      ),
    );
  } else {
    return Future(
      () => ApiResult(false, null, error: 'Usuário não encontrado ou senha inválida!'),
    );
  }
  // return Future(
  //   () => UserData(
  //     'claudiostocco@gmail.com',
  //     'Claudio Marcio Stocco',
  //     userImage: 'https://avatars.githubusercontent.com/u/47143084?v=4',
  //   ),
  // );
}
