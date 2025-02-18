import 'package:movies/ui/tabs/profile/get_profile_model.dart';

abstract class ProfileTabRemoteDataSource {
  Future<GetProfileModel?> getProfileData();
}
