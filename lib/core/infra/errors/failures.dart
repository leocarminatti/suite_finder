abstract class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Internal Server Error']);
}

class NotFoundFailure extends Failure {
  NotFoundFailure([super.message = 'Resource not found']);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure([super.message = 'Unauthorized access']);
}

class BadRequestFailure extends Failure {
  BadRequestFailure([super.message = 'Bad request']);
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = 'Network connection error']);
}

class TimeoutFailure extends Failure {
  TimeoutFailure([super.message = 'Request timeout']);
}
