import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/edit_profile_repository/edit_profile_repository.dart';
import 'package:neostore/presentation/model/edit_profile_item.dart';

class EditProfileUseCase extends BaseUseCase<dynamic> {
  late EditProfileRepository _editProfileRepository;

  EditProfileUseCase(EditProfileRepository _editProfileRepository) {
    this._editProfileRepository = _editProfileRepository;
  }

  @override
  Future<Either<EditProfileItem,ApiError>> callApi([email, dob, phoneNo, profilePic, firstName, lastName]) {
    return _editProfileRepository.getEditProfileRepository(
        email, dob, phoneNo, profilePic, firstName, lastName).then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
