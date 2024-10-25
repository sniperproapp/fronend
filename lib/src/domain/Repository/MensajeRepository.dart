import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

abstract class MensajeRepository {
  
  Future<Resource<bool>> post(String titulo,String description);
}
