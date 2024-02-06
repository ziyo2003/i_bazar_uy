import 'dart:html';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String location;


  ProfileLoaded({required this.name, required this.location});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
