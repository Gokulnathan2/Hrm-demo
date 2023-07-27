import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDb {
  static final storage = FlutterSecureStorage();
  static Future<void> storeid(String xaccountid) async {
    await storage.write(key: "xaccountid", value: xaccountid);
  }

  static Future<String?> getid() async {
    dynamic accid = await storage.read(key: "xaccountid");
    return accid;
  }
}
