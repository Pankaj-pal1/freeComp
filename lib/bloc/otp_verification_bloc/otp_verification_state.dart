part of 'otp_verification_cubit.dart';

abstract class OtpVerificationState extends Equatable {}

class OtpVerificationInitial extends OtpVerificationState {
  String otp = '';
  bool isLoading = false;

  OtpVerificationInitial({required this.isLoading, required this.otp});
  @override
  List<Object?> get props => [identityHashCode(this), isLoading, otp];
}
