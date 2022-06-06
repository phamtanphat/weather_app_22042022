class DioClient {
  DioClient? _instance = null;

  // private constructor
  _DioClient() {

  }

  DioClient getInstance() {
    if (_instance == null) {
      _instance = _DioClient();
    }
    return _instance!;
  }
}