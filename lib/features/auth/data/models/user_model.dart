import 'package:flutter/foundation.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/enums/user_role.dart';

@immutable
final class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      role: map['role'] == UserRole.admin.name ? UserRole.admin : UserRole.user,
    );
  }
}
