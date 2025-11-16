import 'package:email_validator/email_validator.dart';

String? isValidEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  }

  email = email.trim();

  if (!EmailValidator.validate(email)) {
    return 'Invalid email';
  } else if (email.length > 100) {
    return 'Email must be maximum 100 characters';
  } else {
    return null;
  }
}
