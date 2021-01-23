
import 'package:origamicore/models/messageModel.dart';
import 'package:origamicore/routing/routeResponse.dart';

typedef DefaultFunction = Future<RouteResponse> Function(MessageModel message);

class ServiceRoute
{
  Map<String,DefaultFunction> services;
  ServiceRoute({required this.services});
}