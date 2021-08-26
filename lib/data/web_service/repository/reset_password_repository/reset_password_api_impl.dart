abstract class ResetPasswordRepository {
  Future<dynamic> getResetPasswordRepository(
      String oldPassword, String password, String confirmPassword);
}
