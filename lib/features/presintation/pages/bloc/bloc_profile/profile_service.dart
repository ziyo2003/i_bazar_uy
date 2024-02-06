import 'dart:io';
import 'package:hive/hive.dart';

class ProfileService {
  Future<Map<String, dynamic>> loadProfile() async {
    var nameBox = Hive.box("profile_name");
    var locationBox = Hive.box("profile_location");
    var avatarBox = Hive.box("profile_avatar");
    String name = nameBox.get(1, defaultValue: 'Name not set');
    String location = locationBox.get(1, defaultValue: 'Location not set');
    String? avatarPath = avatarBox.get('avatar_path');
    File? avatar = avatarPath != null ? File(avatarPath) : null;
    return {'name': name, 'location': location, 'avatar': avatar};
  }

  Future<void> updateProfile(String name, String location, String? avatarPath) async {
    Hive.box("profile_name").put(1, name);
    Hive.box("profile_location").put(1, location);
    if (avatarPath != null) {
      Hive.box("profile_avatar").put('avatar_path', avatarPath);
    }
  }
}
