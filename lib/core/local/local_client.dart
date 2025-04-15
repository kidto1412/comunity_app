import 'package:get_storage/get_storage.dart';

class LocalClient {
  final GetStorage box;
  const LocalClient({required this.box});

  write(String key, value) {
    box.write(key, value);
  }

  read(String key) {
    box.read(key);
  }

  remove(String key) {
    box.remove(key);
  }
}
