import 'package:spacex/features/launches/domain/entities/launch_entity.dart';


class LaunchModel extends LaunchEntity {
  LaunchModel({
    required super.id,
    required super.missionName,
    required super.launchDateUtc,
    super.launchSuccess,
    required super.launchYear,
    super.details,
    required super.missionId,
    super.missionPatch,
    required super.rocket,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      id: json['id'],
      missionName: json['mission_name'],
      launchDateUtc: json['launch_date_utc'],
      launchSuccess: json['launch_success'],
      launchYear: json['launch_year'],
      details: json['details'],
      missionId: json['details'] ,
      missionPatch: json['links']?['mission_patch'],
      rocket: RocketModel.fromJson(json['rocket']),
    );
  }
}



class RocketModel extends RocketEntity {
  RocketModel({
    required super.rocketType,
    required super.rocket,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      rocketType: json['rocket_type'],
      rocket: RocketInfoModel.fromJson(json['rocket']),
    );
  }
}

class RocketInfoModel extends RocketInfoEntity {
  RocketInfoModel({
    required super.id,
    required super.name,
  });

  factory RocketInfoModel.fromJson(Map<String, dynamic> json) {
    return RocketInfoModel(
      id: json['id'] ,
      name: json['name'],
    );
  }
}
