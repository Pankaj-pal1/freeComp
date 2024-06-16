part of 'login_bloc_cubit.dart';

 abstract class LoginBlocState extends Equatable {}

class LoginBlocInitial extends LoginBlocState {
 @override
 List<Object?> get props => [identityHashCode(this)];
}


class LoginState extends LoginBlocState {
  bool isLoading = false;
  bool isError =false;
  String MobileNumber ='';
  LoginState({required this.MobileNumber,required this.isError, required this.isLoading});
 @override
 List<Object?> get props => [identityHashCode(this),isLoading, isError, MobileNumber];
}


