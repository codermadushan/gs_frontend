String? isValidName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Name is required';
  }

  name = name.trim();
  if (name.length < 3) {
    return 'Name must be at least 3 characters';
  } else if (name.length > 20) {
    return 'Name must be maximum 20 characters';
  } else {
    return null;
  }
}
