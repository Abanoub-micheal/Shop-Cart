class GeneralFailures{
  String? errorMessage;
  GeneralFailures({required this.errorMessage});

}
class NetWorkError extends GeneralFailures{

  NetWorkError({required super.errorMessage});
}
class ServerError extends GeneralFailures{
  ServerError({required super.errorMessage});
}
