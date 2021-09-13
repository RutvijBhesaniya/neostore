import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/domain/repository/edit_profile_repository/edit_profile_repository.dart';

class EditProfileUseCase extends BaseUseCase<dynamic> {
  late EditProfileRepository _editProfileRepository;

  EditProfileUseCase(EditProfileRepository _editProfileRepository) {
    this._editProfileRepository = _editProfileRepository;
  }

  @override
  Future callApi([email, dob, phoneNo, profilePic, firstName, lastName]) {
    return _editProfileRepository.getEditProfileRepository(
        email, dob, phoneNo, profilePic, firstName, lastName);
  }
}
