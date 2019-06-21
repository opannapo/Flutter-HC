class APIThrowBody {
  dynamic error;
  String message;
  int code;

  APIThrowBody(this.error, this.message, this.code);

  @override
  String toString() {
    return 'APIThrowBody error:${error.toString()}, message: $message, code: ${code.toString()}}';
  }
}
