import 'package:dio/dio.dart';
import 'package:walkzero/src/utils/constants/constants.dart';

import '../../data/datasources/local/local_storage.dart';
import '../models/custom_error.dart';

class AuthRepository {
  Dio dio = Dio();

  Future<dynamic> prelogin({
    required String email,
  }) async {
    String query = r'''query ($input: PreLoginInput!) {
  preLogin(input: $input) {
     id,
    domains{
      url
    }
  }
}''';
    //String email = emailcontroller.text;
    Map<String, dynamic> variables = {
      'input': {'email': email}
    };
    try {
      Response response = await dio.post('${baseUrl}/graphql',
          data: {'query': query, 'variables': variables});
      if (response.statusCode == 200) {
        print("Response data: ${response.data}");
      } else {
        print("Error: ${response.statusCode} - ${response.data}");
      }
      return response.data;
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<dynamic> postlogin({
    required String email,
    required String password,
  }) async {
    var xaccountid = await LocalDb.getid();
    String query = r'''mutation login ($input: LoginInput!) {
  login(input: $input) {
    token,
    profile {
      id,
      first_name,
      last_name,
      fullname
      superuser,
      photo,
      type
    },
    org {
      id,
      domain,
      logo
    }
  }
}''';
    //String email = emailcontroller.text;
    Map<String, dynamic> variables = {
      'input': {'email': email, "password": password}
    };
    final options = Options(
      headers: {'x-account-id': '${xaccountid.toString()}'},
    );
    try {
      Response response = await dio.post(
        '${baseUrl}/graphql',
        data: {
          'query': query,
          'variables': variables,
        },
        options: options,
      );
      if (response.statusCode == 200) {
        print("Response data: ${response.data}");
      } else {
        print("Error: ${response.statusCode} - ${response.data}");
      }
      return response.data;
    } catch (e) {
      print(xaccountid.toString());
      print(e);
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
