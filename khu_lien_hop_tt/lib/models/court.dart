import '../utils/json_utils.dart';

// Mô tả sân tại cơ sở, gắn với môn và trạng thái
class Court {
  final String id;
  final String name;
  final String? code;
  final String facilityId;
  final String sportId;
  final String? status; // 'active','maintenance','inactive'

  const Court({
    required this.id,
    required this.name,
    required this.facilityId,
    required this.sportId,
    this.code,
    this.status,
  });

  factory Court.fromJson(Map<String, dynamic> json) {
    return Court(
      id: JsonUtils.parseId(json['_id']),
      name: (json['name'] ?? '').toString(),
      code: json['code']?.toString(),
      facilityId: JsonUtils.parseId(json['facilityId']),
      sportId: JsonUtils.parseId(json['sportId']),
      status: json['status']?.toString(),
    );
  }
}
