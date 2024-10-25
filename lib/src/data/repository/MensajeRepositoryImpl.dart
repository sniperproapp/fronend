 import 'package:sniper_pro/src/data/dataSource/remote/services/MensajeServices.dart';
import 'package:sniper_pro/src/domain/Repository/MensajeRepository.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class MensajeRepositoryImpl implements MensajeRepository {
  MensajeServices mensajeServices;

  MensajeRepositoryImpl(this.mensajeServices);

   
  @override
  Future<Resource<bool>> post(String titulo,String description) {
     
      return mensajeServices.post(titulo, description);
    }
}
