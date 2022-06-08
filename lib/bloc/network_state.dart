part of 'network_bloc.dart';

@immutable
abstract class NetworkState {}

class NetworkSuccess extends NetworkState {}

class NetworkFailure extends NetworkState {}
