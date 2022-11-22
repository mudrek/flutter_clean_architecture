abstract class Translations {
  // Login
  String get textUsernameFormFieldTitle;
  String get textPasswordFormFieldTitle;
  String get textButtonLogin;

  String get validatorRequiredUsername;
  String get validatorRequiredPassword;
  String get validatorMinLengthUsername;
  String get validatorMinLengthPassword;

  String get textLoginSuccess;
  String get textButtonLoginSuccess;
  String textLoginSuccessEmail(String email);
  String textLoginSuccessName(String name);

  // Movies
  String get textMoviesList;
  String get textGenericFailureMessage;
  String get textRating;
  String get textOverview;
}
