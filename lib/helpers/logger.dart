import 'package:talker/talker.dart';

abstract class AppLogger {
  static final _logger = Talker();

  static void log(dynamic message, {String? tag}) {
    switch (tag) {
      case 'error':
        _logger.error(message);
        break;
      case 'warning':
        _logger.warning(message);
        break;
      case 'info':
        _logger.info(message);
        break;
      case 'debug':
        _logger.debug(message);
        break;
      case 'critical':
        _logger.critical(message);
        break;
      default:
        _logger.verbose(message);
        break;
    }
  }
}
