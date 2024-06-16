import 'package:get_it/get_it.dart';

import '../../bloc/internet_bloc/internet_checker_cubit.dart';
import '../../bloc/login_bloc/login_bloc_cubit.dart';
import '../../bloc/otp_verification_bloc/otp_verification_cubit.dart';
import '../repositories/common_repo.dart';

final getIt = GetIt.instance;

void  setupGetIt() {

  /// repositories....
  getIt.registerSingleton<CommonRepository>(CommonRepository());


  /// cubits.....
  getIt.registerSingleton<InternetCheckerCubit>(InternetCheckerCubit());
  getIt.registerSingleton<LoginBlocCubit>(LoginBlocCubit(getIt()));
  getIt.registerSingleton<OtpVerificationCubit>(OtpVerificationCubit(getIt()));
}