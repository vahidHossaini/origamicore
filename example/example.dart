
import 'dart:io';

import 'package:origamicore/origamiCore.dart';
import 'package:origamicore/routing/router.dart';

void main() { 
  var core = OrigamiCore(Directory.current.path + '/bin/config.json');
  Router();
}
