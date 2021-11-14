import 'package:equatable/equatable.dart';

class CustomServerException extends Equatable implements Exception {
  final String? messageError;

  CustomServerException({this.messageError});

  @override
  List<Object?> get props => [];
}
