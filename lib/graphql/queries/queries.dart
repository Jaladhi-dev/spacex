class SpaceXQueries {
  static const String launches = r'''
    query Launches {
     launches {
        details
        id
        launch_date_utc
        launch_success
        launch_year
        mission_id
        mission_name
        links {
            mission_patch
        }
        rocket {
            rocket {
                name
                id
            }
            rocket_type
        }
    }
    }
  ''';
}
