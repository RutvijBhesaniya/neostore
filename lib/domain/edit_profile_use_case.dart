import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/edit_profile_repository/edit_profile_repository.dart';

class EditProfileUseCase extends BaseUseCase<dynamic> {
  late EditProfileRepository _editProfileRepository;

  EditProfileUseCase(EditProfileRepository _editProfileRepository) {
    this._editProfileRepository = _editProfileRepository;
  }

  @override
  Future callApi([email, dob, phoneNumber, profilePic]) {
    return _editProfileRepository.getEditProfileRepository(
        email, dob, phoneNumber, profilePic);
  }
}
