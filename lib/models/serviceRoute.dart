
import 'package:origamicore/models/externalService.dart';
import 'package:origamicore/models/messageModel.dart';
import 'package:origamicore/routing/routeResponse.dart';

typedef DefaultFunction = Future<RouteResponse> Function(MessageModel message);

class ServiceRoute
{
  Map<String,DefaultFunction> services;
  Map<String,ExtrnalService> externalServices;
  ServiceRoute({this.services});
}