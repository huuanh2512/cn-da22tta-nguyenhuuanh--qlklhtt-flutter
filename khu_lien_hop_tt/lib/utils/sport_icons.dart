import 'package:flutter/material.dart';

/// Map mã môn thể thao sang icon gần đúng để hiển thị nhất quán.
IconData sportIcon(String? code) {
  switch ((code ?? '').toUpperCase()) {
    case 'SOCCER':
    case 'FOOTBALL':
      return Icons.sports_soccer;
    case 'VOLLEYBALL':
      return Icons.sports_volleyball;
    case 'BADMINTON':
      return Icons.sports_tennis; // vợt cầu lông
    case 'TENNIS':
      return Icons.sports_tennis;
    case 'PICKLEBALL':
      return Icons.sports_baseball; // dùng vợt gỗ, icon gậy bóng chày tương đồng
    case 'BASKETBALL':
      return Icons.sports_basketball;
    default:
      return Icons.sports;
  }
}
