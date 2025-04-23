import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage box;
  const StorageService({required this.box});

  write(String key, value) {
    box.write(key, value);
  }

  dynamic read(String key) {
    return box.read(key);
  }

  remove(String key) {
    box.remove(key);
  }
}
