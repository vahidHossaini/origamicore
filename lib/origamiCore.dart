
import 'dart:convert';
import 'dart:io';

import 'models/packageIndex.dart'; 

class OrigamiCore
{
  String path;
  OrigamiCore(this.path);
  void start(List<PackageIndex> packages) async
  {
    var data = json.decode( File(path).readAsStringSync());
    for(var a in packages)
    { 
      await a.jsonConfig(data['packageConfig']);
    }
    
    for(var a in packages)
    {
      await a.start();
    }
  }
}