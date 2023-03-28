import 'dart:developer';

import 'package:logging/logging.dart';

void main() {
  // 创建Logger对象
  Logger log = Logger('myapp');

  // 输出日志
  log.log(Level.INFO, 'debug message');
}