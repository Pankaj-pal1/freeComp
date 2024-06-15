import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freecomp/ui/screens/pinCodeVerificationScreen.dart';
import 'package:freecomp/ui/widgets/noInternetWidget.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';
import 'bloc/internet_bloc/internet_checker_cubit.dart';
import 'bloc/internet_bloc/internet_checker_state.dart';
import 'data/services/blocProviders.dart';
import 'data/services/get_it_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    runApp(const MyApp());
  }, onError: (error, stackTrace) {
    debugPrint('Caught exception: $error');
  });
  setupGetIt();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: blockProvidersList,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ToastificationWrapper(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                appBarTheme: const AppBarTheme(color: Colors.black,),
                useMaterial3: true,
              ),
              home:  PinCodeVerificationScreen(),
            ),
          ),
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getIt<InternetCheckerCubit>().checkConnectivityStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<InternetCheckerCubit, InternetCheckerState>(
        builder: (BuildContext context, InternetCheckerState state) {
          if (state is InternetConnectionLost) {
            return const Center(child: NoInternetAnimation());
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
