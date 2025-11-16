import 'package:flutter/foundation.dart';

import '../enums/user_role.dart';

@immutable
class UserEntity {
  final String id;
  final String name;
  final String email;
  final UserRole role;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });
}
