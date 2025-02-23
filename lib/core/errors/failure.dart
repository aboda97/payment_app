import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeOut with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeOut with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeOut with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate timeOut with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request from Api is Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('ConnectionError timeOut with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('UnExpected Error, Please Try Later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        response['error']['message'],
      );
    } else if (statusCode == 404) {
      return ServerFailure('Request is Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Ops,, There is an Error, Please Try Later!');
    }
  }
}
