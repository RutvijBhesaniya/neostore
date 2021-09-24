class RestResponse<T> {
  List<T> _data = [];
  List<T> getData (){
    return _data;
  }
}