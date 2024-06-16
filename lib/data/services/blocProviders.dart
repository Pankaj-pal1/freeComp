
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freecomp/bloc/login_bloc/login_bloc_cubit.dart';

import '../../bloc/internet_bloc/internet_checker_cubit.dart';
import 'get_it_service.dart';

List <BlocProvider> blockProvidersList =[

  BlocProvider<InternetCheckerCubit>(create: (BuildContext context) => getIt<InternetCheckerCubit>(),),
  BlocProvider<LoginBlocCubit>(create: (BuildContext context) => getIt<LoginBlocCubit>(),),


];