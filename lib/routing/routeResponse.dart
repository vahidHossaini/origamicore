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
  String session;
  ResponseDataModel({this.data, this.isDone,this.session});
  dynamic toJson()
  {
    return{
      'isDone':isDone,
      'data':data,
      'session':session,
    };
  }
  
}
class RouteResponse
{
  dynamic session;
  ResponseErrorModel error;
  ResponseDataModel response;
  RouteResponse({this.response,this.error,this.session});
  dynamic toJson()
  {
    return{
      'error':error?.toJson(),
      'response':response?.toJson(),
      'session':session
    };
  }
}