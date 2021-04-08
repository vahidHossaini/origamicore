class ResponseErrorModel
{
  String message;
  String code;
  dynamic data;
  ResponseErrorModel({this.code,this.data,this.message});
  dynamic toJson()
  {
    return{
      'message':message,
      'code':code,
      'data':data,
    };
  }
}
class ResponseDataModel
{
  bool isDone=false;
  dynamic data;
  ResponseDataModel({this.data, this.isDone});
  dynamic toJson()
  {
    return{
      'isDone':isDone,
      'data':data,
    };
  }
  
}
class RouteResponse
{
  ResponseErrorModel error;
  ResponseDataModel response;
  RouteResponse({this.response,this.error});
  dynamic toJson()
  {
    return{
      'error':error?.toJson(),
      'response':response?.toJson()
    };
  }
}