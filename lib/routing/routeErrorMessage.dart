
import 'package:origamicore/routing/routeResponse.dart';

class RouteErrorMessage
{
  static ResponseErrorModel domainNotExist = ResponseErrorModel(code:'route001' ,message: 'Domain Not Exist' );
  static ResponseErrorModel serviceNotExist = ResponseErrorModel(code:'route003' ,message: 'Service Not Exist' );
  static ResponseErrorModel timeout = ResponseErrorModel(code:'route002' ,message: 'Timeout' );
}