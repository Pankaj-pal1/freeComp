import 'package:get_it/get_it.dart';

import '../../bloc/internet_bloc/internet_checker_cubit.dart';

final getIt = GetIt.instance;

void  setupGetIt() {

  getIt.registerSingleton<InternetCheckerCubit>(InternetCheckerCubit());
}