import 'package:flutter/material.dart';

import '../di/di.dart';


setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
}
