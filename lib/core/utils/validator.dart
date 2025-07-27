class Validator {
  // Name validation: at least 2 characters, only letters and spaces
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s]{2,}$");
    if (!nameRegex.hasMatch(value.trim())) {
      return 'Enter a valid name (letters only)';
    }

    return null;
  }

  // Email validation using a basic regex
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  // Password validation: at least 6 characters
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }
}
