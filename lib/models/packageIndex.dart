
abstract class PackageIndex
{ 
  Future jsonConfig(dynamic config);
  Future start();
  void restart();
  void stop();
}