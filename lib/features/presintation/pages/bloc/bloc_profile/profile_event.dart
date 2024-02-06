abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String location;
  final String? avatarPath;

  UpdateProfile({required this.name, required this.location, this.avatarPath});
}
