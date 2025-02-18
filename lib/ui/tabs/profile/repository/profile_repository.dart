import '../../../../api/api_manager.dart';
import '../get_profile_model.dart';

class ProfileRepository {
  ApiManager apiManager;

  ProfileRepository({required this.apiManager});

  Future<GetProfileModel?> getProfileData() async {
    return await apiManager.getProfileData();
  }
}
