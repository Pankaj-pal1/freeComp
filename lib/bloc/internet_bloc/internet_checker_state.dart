
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class InternetCheckerState extends Equatable {}


class InternetCheckerInitialState extends InternetCheckerState{
  @override
  List<Object?> get props => [identityHashCode(this)];
}


class InternetIsConnected extends InternetCheckerState{
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class InternetConnectionLost extends InternetCheckerState{
  @override
  List<Object?> get props => [identityHashCode(this)];

}