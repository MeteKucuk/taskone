import 'package:get_storage/get_storage.dart';

class LocalStorage {
  Future openBox(parsed) async {
    if (GetStorage().read('openBox') == null) {
      await GetStorage().write("apiData", parsed as List<dynamic>);
    }

    return;
  }
}
