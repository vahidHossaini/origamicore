
import 'package:origamicore/routing/routeResponse.dart';

abstract class RouteMudule
{
  Future<RouteResponse> run();
}