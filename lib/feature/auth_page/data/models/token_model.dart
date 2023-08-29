
 part of 'entities.dart';
 @JsonSerializable()
class TokenModel extends TokenEntity {
  TokenModel({required super.accessToken, required super.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

}
