import 'package:origamicore/models/serviceRoute.dart';

class ExtrnalService
{
  DefaultFunction function; 
  bool isPublic=true;
  List<String> requireProp;
  ExtrnalService({this.function,this.isPublic,this.requireProp});
}