import 'package:origamicore/models/messageModel.dart';
import 'package:origamicore/models/serviceRoute.dart';
import 'package:origamicore/routing/routeErrorMessage.dart';
import 'package:origamicore/routing/routeResponse.dart';

class Router
{
  static Map<String,ServiceRoute> routes= {};
  static void addRoute(String domain,ServiceRoute route)
  {
    routes[domain]=route;
  }
  static Future<RouteResponse> run(String domain,String service,MessageModel message)async
  {
    if(domain==null || !routes.containsKey(domain))
    {
      return RouteResponse(error: RouteErrorMessage.domainNotExist);
    }
    // ignore: null_aware_in_logical_operator
    if(service==null || routes[domain]==null || !routes[domain]?.services?.containsKey(service))
    {
      return RouteResponse(error: RouteErrorMessage.serviceNotExist);
    }
    var d=routes[domain];
    var s= d?.services[service];
    if(s==null) return RouteResponse(error: RouteErrorMessage.serviceNotExist);
    var res=await  s(message);
    return res;
  }
  static Future<RouteResponse> runExternal(String domain,String service,MessageModel message)async
  {
    if(domain==null || !routes.containsKey(domain))
    {
      return RouteResponse(error: RouteErrorMessage.domainNotExist);
    }
    // ignore: null_aware_in_logical_operator
    if(service==null || routes[domain]==null || !routes[domain]?.externalServices?.containsKey(service))
    {
      return RouteResponse(error: RouteErrorMessage.serviceNotExist);
    }
    var d=routes[domain];
    var s= d?.externalServices[service];
    if(s==null) return RouteResponse(error: RouteErrorMessage.serviceNotExist);
    if(!s.isPublic)
    {
      if(message.session==null)
      {
            return RouteResponse(error: RouteErrorMessage.access);
      }
      if(s.requireProp!=null)
      {
        for(var prop in s.requireProp )
        {
          if(message.session['data'][prop]==null)
          {
            return RouteResponse(error: RouteErrorMessage.access);
          }
        }
      }
    }
    var res=await  s.function(message);
    return res;
  }
}