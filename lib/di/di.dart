import 'package:get/get.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/repository/data_repository_impl.dart';
import '../domain/repository/data_repository.dart';
import '../presentation/screens/home_screen/home_screen_controller.dart';
import '../presentation/screens/navigation_screen/navigation_screen_controller.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => NavigationScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);

  }
}
