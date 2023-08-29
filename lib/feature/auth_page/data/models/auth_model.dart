part of 'entities.dart';

@JsonSerializable()
class UserAuthModel extends AuthEntities {
  const UserAuthModel({
    required super.user,
    required super.tokens,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => _$UserAuthModelFromJson(json);
}
