class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]): super(message, 'No internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]): super(message, 'Request time out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]): super(message, 'Internal server error');
}

class InvalideUrlException extends AppExceptions {
  InvalideUrlException([String? message]): super(message, 'Invalid url');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]): super(message, '');
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
}