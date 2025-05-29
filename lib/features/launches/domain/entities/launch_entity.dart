class LaunchEntity {
  final String? id;
  final String? missionName;
  final String? launchDateUtc;
  final bool? launchSuccess;
  final String? launchYear;
  final String? details;
  final String? missionId;
  final String? missionPatch;
  final RocketEntity? rocket;

  LaunchEntity({
    this.id,
    this.missionName,
    this.launchDateUtc,
    this.launchSuccess,
    this.launchYear,
    this.details,
    this.missionId,
    this.missionPatch,
    this.rocket,
  });
}

class RocketEntity {
  final String? rocketType;
  final RocketInfoEntity? rocket;

  RocketEntity({this.rocketType, this.rocket});
}

class RocketInfoEntity {
  final String? id;
  final String? name;

  RocketInfoEntity({this.id, this.name});
}
