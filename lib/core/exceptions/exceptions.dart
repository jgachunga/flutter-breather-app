import 'app_exceptions.dart';

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([message]) : super(message, 'Internal server error: ');
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, 'Not found: ');
}

class InvalidRequestException extends AppException {
  InvalidRequestException([message]) : super(message, 'Invalid Request: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, 'Invalid Input: ');
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, 'Error During Communication: ');
}
