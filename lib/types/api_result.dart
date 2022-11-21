class ApiResult<T> {
  ApiResult(this.success, this.data, {this.error});
  bool success;
  T? data;
  String? error;
}
