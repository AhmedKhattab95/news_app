typedef HandleError = bool Function(dynamic);
typedef FutureCallback<T> = Future<T> Function();

Future<T?> doAction<T>(
  FutureCallback<T> futureCallback, {
  bool checkInternet = true,
  bool showProgress = false,
  String? progressText,
  HandleError? handleError,
}) async {
  try {
    //todo check internet
    if(checkInternet)
      _checkInternet();
    if(showProgress);
      //todo: show progress
    if (futureCallback != null) return await futureCallback();

  } catch (ex) {
    if (handleError != null) {
      if (handleError(ex) == true) return Future.value(null);
    }
  }
  finally{
    if(showProgress);
      //todo: hide progress
  }
}

void _checkInternet() {

}
