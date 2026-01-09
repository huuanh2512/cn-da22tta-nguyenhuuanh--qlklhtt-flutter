import 'dart:io';

/// Cấu hình tập trung cho ứng dụng.
class AppConfig {
  /// Thứ tự xác định API base URL:
  /// - Ưu tiên API_BASE truyền qua --dart-define
  /// - Nếu không có, dùng địa chỉ mặc định (cập nhật khi server đặt nơi khác)
  ///
  /// Dev nội bộ:
  /// - Android emulator: 'http://10.0.2.2:3000'
  /// - iOS simulator/khác: 'http://localhost:3000'
  ///
  /// Khi triển khai, thay bằng URL server thật (vd: https://your-server.com)
  /// Có thể ghi đè lúc chạy: flutter run --dart-define=API_BASE=http://your-server:3000
  static final String apiBase = _resolveApiBase();

  static String _resolveApiBase() {
    const env = String.fromEnvironment('API_BASE');
    if (env.isNotEmpty) return env;

    // Cập nhật thành địa chỉ server thật nếu khác mặc định Render
    // Nếu test trên thiết bị thật với server local, dùng IP LAN của máy (vd 192.168.x.x)
    const defaultServer = 'https://khu-lien-hop-tt.onrender.com';

    try {
      if (Platform.isAndroid) {
        const useAndroidEmulatorHost =
            bool.fromEnvironment('USE_ANDROID_EMULATOR_HOST');
        if (useAndroidEmulatorHost) {
          // For Android emulator, 10.0.2.2 maps to host machine's localhost
          return 'http://10.0.2.2:3000';
        }
      }
    } catch (_) {
      // Platform có thể không sẵn ở vài môi trường (vd build web); bỏ qua
    }
    return defaultServer;
  }
}
