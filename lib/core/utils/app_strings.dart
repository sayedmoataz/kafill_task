class AppStrings {
  static const String appName = 'Sayed Moataz';
  static const String accountLogin = 'Account Login';
  static const String emailAddress = 'Email Address';
  static const String password = 'Password';
  static const String noRoutesFound = 'No Routes Found';
  static const String loginString = 'login';
  static const String registerString = 'Register';
  static const String services = 'Services';
  static const String popularServices = 'Popular Services';
  static const String rememberMe = 'Remember me';
  static const String forgetPassword = 'Forgot Password?';
  static const String register = 'Register';
  static const String whoAmI = 'Who Am I';
  static const String countries = 'Countries';
  static const String submit = 'Submit';
  static const String next = 'next';
  static const String registerQuestion = 'Don\'t have an account? ';
  static const String requiredFields = 'Fill the required fields';
  static const String forgetPasswordError =
      'Forget Password not Supportted Yet.';

  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String registerPassword = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String about = 'About';
  static const String userType = 'User Type';
  static const String salary = 'Salary';
  static const String birthDate = 'Birth Date';
  static const String gender = 'Gender';
  static const String skills = 'Skills';
  static const String favouriteSocialMedia = 'Favourite Social Media';

  static const List<String> accountType = ['Seller', 'Buyer', 'Both'];
  static const List<String> genderType = ['Male', 'Female'];
  static const List<String> favSocialMedia = ['facebook', 'x', 'instagram'];
  static const List<String> selectedItemLable = [
    'Who Am I',
    'Countries',
    'Services'
  ];

  static const List<String> validType = [
    'First Name should has less than 50 character',
    'Last Name should has less than 50 character',
    'please type a Valid Email John@Doe.com',
    'password should has 8 characters al least\npassword should not as same as email',
    'confirm password should indentical with password',
    'Salary must be less than 1000',
    'Salary must be more than 100',
    'About Field requires 10 characters at least\n maximum characters is : 1000',
    'Date Of Birth should be before Today',
    'Select One Skill At least',
    'Select Your Favouirte Social Media',
    'Upload Your Photo',
  ];

  static RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  static Map<String, String> signUpData = {};
}
