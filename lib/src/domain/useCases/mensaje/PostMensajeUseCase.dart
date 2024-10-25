
import 'package:sniper_pro/src/domain/Repository/MensajeRepository.dart';

class PostMensajeUseCase {
  MensajeRepository mensajeRepository;
  PostMensajeUseCase(this.mensajeRepository);

  run(String titulo, String description) => mensajeRepository.post(  titulo,   description);
}
