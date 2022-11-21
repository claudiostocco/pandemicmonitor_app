import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../types/api_result.dart';
import '../../types/bills_data.dart';

Future<ApiResult<List<BillsData>>> getBills(String? id) async {
  //var url = Uri.parse(kUrlapi + 'login/' + user + '/' + pass);
  Uri url;
  if (id == null || id.isEmpty) {
    url = Uri.parse(kUrlapi + '/my-manager/my-bills.json');
  } else {
    url = Uri.parse(kUrlapi + '/my-manager/my-bills/' + id + '.json');
  }

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    List<BillsData> listResponse = List.empty(growable: true);
    (jsonResponse as Map).forEach((key, value) {
      listResponse.add(
        BillsData(
          key,
          value['description'] ?? '',
          value['whereSpend'] ?? '',
          value['issuedDate'] ?? DateTime.now(),
          value['dueDate'] ?? DateTime.now(),
          value['paid'] ?? false,
          value['amount'] ?? 0,
        ),
      );
    });

    return Future(
      () => ApiResult(
        true,
        listResponse,
      ),
    );
  } else {
    return Future(
      () => ApiResult(false, null),
    );
  }
}
