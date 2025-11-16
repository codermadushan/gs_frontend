bool isValidOTP(String otp) {
  final RegExp otpRegex = RegExp(r'^[0-9]{6}$');
  return otpRegex.hasMatch(otp);
}
