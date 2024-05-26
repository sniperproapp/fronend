import 'package:injectable/injectable.dart';
import 'package:sniper_pro/src/data/dataSource/local/SharedPref.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/ProductService.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/UserServices.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/VideoServices.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/ZoomServices.dart';
import 'package:sniper_pro/src/data/repository/AuthRepositoryImpl.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/AuthService.dart';
import 'package:sniper_pro/src/data/repository/CategoryRepositoryImp.dart';
import 'package:sniper_pro/src/data/repository/ProductRepositoryImp.dart';
import 'package:sniper_pro/src/data/repository/UserRepositoryImpl.dart';
import 'package:sniper_pro/src/data/repository/VideoRepositoryImpl.dart';
import 'package:sniper_pro/src/data/repository/ZoomRepositoryImpl.dart';
import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';
import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart';
import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';
import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';
import 'package:sniper_pro/src/domain/Repository/VideoRepository.dart';
import 'package:sniper_pro/src/domain/Repository/ZoomRepository.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CreateCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/DeleteCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/GetCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/UpdateCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/auth/GetCategorySessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/GetUserSessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LoginidUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/RecuperarpassUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/SaveCategorySessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/SaveUserSessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/SaveUsertokenmessageCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProducrankingUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProducreportUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductByCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductByCategoryUseidCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductByCategorylikeUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/UpdateProductUseCasa.dart';
import 'package:sniper_pro/src/domain/useCases/products/activatetpProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/likeProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/GetUsersUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/UpdateUserUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/user/activateuserUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/descargoUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/inactivateuserUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/video/GetVideoUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/video/VideoUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/GetZoomUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/UpdateZoomUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/ZoomUseCases.dart';

@module
abstract class AppModule {
  @Injectable()
  SharedPref get sharedPref => SharedPref();

  @Injectable()
  AuthService get authService => AuthService(sharedPref);

  @Injectable()
  Future<String> get token async {
    String token = '';
    final usersession = await sharedPref.read('user');
    if (usersession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(usersession);
      token = authResponse.token;
    }
    return token;
  }

  @Injectable()
  UserServices get userServices => UserServices(token);

  @Injectable()
  ZoomServices get zoomServices => ZoomServices(token);

  @Injectable()
  ZoomRepository get zoomRepository => ZoomRepositoryImpl(zoomServices);

  @Injectable()
  ZoomUseCases get zoomUseCases => ZoomUseCases(
      getzoom: GetZoomUseCase(zoomRepository),
      update: UpdateZoomUseCase(zoomRepository));

  @Injectable()
  VideoServices get videoServices => VideoServices(token);

  @Injectable()
  VideoRepository get videoRepository => VideoRepositoryImpl(videoServices);

  @Injectable()
  VideoUseCases get videoUseCases => VideoUseCases(
        getvideo: GetVideoUseCase(videoRepository),
      );

  @Injectable()
  UsersRepository get userRepository => UserRepositoryImpl(userServices);

  @Injectable()
  AuthRepository get authRepository =>
      AuthRepositoryImpl(this.authService, this.sharedPref);

  @Injectable()
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      logout: LogoutUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      saveusersession: SaveUserSessionUserCase(authRepository),
      getusersession: GetUserSessionUserCase(authRepository),
      messagetoken: SaveUsertokenmessageCase(authRepository),
      enviarmail: RecuperarpassUseCase(authRepository),
      savelistcategory: SavecategorySessionUseCase(authRepository),
      getcategorysession: GetCategorySessionUserCase(authRepository),
      loginid: LoginidUseCase(authRepository));

  @Injectable()
  UsersUseCases get userUseCases => UsersUseCases(
      updateuser: UpdateUserUseCase(userRepository),
      getuser: GetUsersUseCase(userRepository),
      activate: activateuserUseCase(userRepository),
      descargo: descargoUseCase(userRepository),
      inactivate: inactivateuserUseCase(userRepository));

  @Injectable()
  CategoryService get categoryService => CategoryService(token);

  @Injectable() // primero inyectamos el servicio
  ProductService get productService => ProductService(token);

  @Injectable() //luego inyectamos el repositorio
  ProductRepository get productRepository =>
      ProductRepositoryImp(productService);

  @Injectable()
  CategoryRepository get categoryRepository =>
      CategoryRepositoryImp(categoryService);

  @Injectable()
  CategoriesUseCase get categoriesUseCase => CategoriesUseCase(
      create: CreateCategoryUseCase(categoryRepository),
      getcategory: GetCategoryUseCase(categoryRepository),
      update: UpdateCategoryUseCase(categoryRepository),
      delete: DeleteCategoryUseCase(categoryRepository));

  //luego inyectamos los casos de usos para generar el archivo ijectable.config con el comando
  //   flutter packages pub run build_runner build
  @Injectable()
  ProductsUseCase get productsUseCase => ProductsUseCase(
      create: CreateProductUseCase(productRepository),
      product: GetProductUseCase(productRepository),
      getProductByCategory: GetProductByCategoryUseCase(productRepository),
      update: UpdateProductUseCasa(productRepository),
      delete: DeleteProductUseCase(productRepository),
      getProductByCategoryuser:
          GetProductByCategoryUseidCase(productRepository),
      activatetp: ActivatetpProductUseCase(productRepository),
      like: LikeProductUseCase(productRepository),
      report: GetProducreportUseCase(productRepository),
      ranking: GetProducrankigUseCase(productRepository),
      getProductByCategorylikeUseCase:
          GetProductByCategorylikeUseCase(productRepository));
}
