// ignore_for_file: constant_identifier_names

enum BlocStatus { initial, loading, success, failure }

enum PermissionType {
  LOCATION,
  STORAGE,
  NOTIFICATIONS,
}

enum ExceptionCode {
  UNKNOWN,
  LOCATION_SERVICE_DISABLED,
  LOCATION_PERMISSION_DENIED,
  LOCATION_PERMISSION_PERMADENIED,
}
