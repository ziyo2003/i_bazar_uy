import 'dart:io';
import 'package:bloc/bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import 'profile_service.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;

  ProfileBloc({required this.profileService}) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      var profileData = await profileService.loadProfile();
      emit(ProfileLoaded(
          name: profileData['name'],
          location: profileData['location'],

      ));
    } catch (error) {
      emit(ProfileError('Failed to load profile data.'));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    try {
      await profileService.updateProfile(event.name, event.location, event.avatarPath);
      emit(ProfileLoaded(name: event.name, location: event.location));
    } catch (error) {
      emit(ProfileError('Failed to update profile.'));
    }
  }
}
