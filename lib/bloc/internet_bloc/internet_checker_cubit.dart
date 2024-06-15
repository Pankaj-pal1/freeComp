import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_checker_state.dart';

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  InternetCheckerCubit() : super(InternetCheckerInitialState());

  final Connectivity connectivity = Connectivity();

  checkConnectivityStatus() {
    connectivity.checkConnectivity().then((value) => {
          if (value == ConnectivityResult.none)
            {emit(InternetConnectionLost())}
          else
            {emit(InternetIsConnected())}
        });
  }
}
