class Reservation {
  final String? id;
  final String? spaceId;
  final DateTime? startTm;
  final DateTime? endTm;
  final int? invitedCount;
  final int? acceptedCount;
  final int? capacity;
  final List<String>? amenities;
  final bool? isCancelled;
  final String? userId;
  final String? locationId;
  final String? spaceName;
  final String? spaceType;
  final String? floorName;
  final String? buildingId;
  final String? buildingName;
  final String? city;
  final String? campusName;
  final String? emailId;
  final String? userName;
  final String? userTitle;
  final String? floorId;

  Reservation({
    this.id,
    this.spaceId,
    this.startTm,
    this.endTm,
    this.invitedCount,
    this.acceptedCount,
    this.capacity,
    this.amenities,
    this.isCancelled,
    this.userId,
    this.locationId,
    this.spaceName,
    this.spaceType,
    this.floorName,
    this.buildingId,
    this.buildingName,
    this.city,
    this.campusName,
    this.emailId,
    this.userName,
    this.userTitle,
    this.floorId,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json['ID'] as String?,
        spaceId: json['SPACE_ID'] as String?,
        startTm:
            json['START_TM'] != null ? DateTime.parse(json['START_TM']) : null,
        endTm: json['END_TM'] != null ? DateTime.parse(json['END_TM']) : null,
        invitedCount: json['INVITED_COUNT'] as int?,
        acceptedCount: json['ACCEPTED_COUNT'] as int?,
        capacity: json['CAPACITY'] as int?,
        amenities: json['AMENITIES'] != null
            ? List<String>.from(json['AMENITIES'].map((x) => x as String))
            : null,
        isCancelled: json['IS_CANCELLED'] as bool?,
        userId: json['USER_ID'] as String?,
        locationId: json['LOCATION_ID'] as String?,
        spaceName: json['SPACE_NAME'] as String?,
        spaceType: json['SPACE_TYPE'] as String?,
        floorName: json['FLOOR_NAME'] as String?,
        buildingId: json['BUILDING_ID'] as String?,
        buildingName: json['BUILDING_NAME'] as String?,
        city: json['CITY'] as String?,
        campusName: json['CAMPUS_NAME'] as String?,
        emailId: json['EMAIL_ID'] as String?,
        userName: json['USER_NAME'] as String?,
        userTitle: json['USER_TITLE'] as String?,
        floorId: json['FLOOR_ID'] as String?,
      );
}
