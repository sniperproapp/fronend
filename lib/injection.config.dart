// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sniper_pro/src/data/dataSource/local/SharedPref.dart' as _i381;
import 'package:sniper_pro/src/data/dataSource/remote/services/AuthService.dart'
    as _i1009;
import 'package:sniper_pro/src/data/dataSource/remote/services/CategoryService.dart'
    as _i216;
import 'package:sniper_pro/src/data/dataSource/remote/services/MensajeServices.dart'
    as _i386;
import 'package:sniper_pro/src/data/dataSource/remote/services/ProductService.dart'
    as _i591;
import 'package:sniper_pro/src/data/dataSource/remote/services/UserServices.dart'
    as _i859;
import 'package:sniper_pro/src/data/dataSource/remote/services/VideoServices.dart'
    as _i1067;
import 'package:sniper_pro/src/data/dataSource/remote/services/ZoomServices.dart'
    as _i786;
import 'package:sniper_pro/src/di/AppModule.dart' as _i398;
import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart' as _i922;
import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart'
    as _i857;
import 'package:sniper_pro/src/domain/Repository/MensajeRepository.dart'
    as _i538;
import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart'
    as _i625;
import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart' as _i355;
import 'package:sniper_pro/src/domain/Repository/VideoRepository.dart' as _i144;
import 'package:sniper_pro/src/domain/Repository/ZoomRepository.dart' as _i682;
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart' as _i645;
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart'
    as _i452;
import 'package:sniper_pro/src/domain/useCases/mensaje/MensajeUseCases.dart'
    as _i21;
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart'
    as _i233;
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart'
    as _i547;
import 'package:sniper_pro/src/domain/useCases/video/VideoUseCases.dart'
    as _i806;
import 'package:sniper_pro/src/domain/useCases/zoom/ZoomUseCases.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i381.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i1009.AuthService>(() => appModule.authService);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i859.UserServices>(() => appModule.userServices);
    gh.factory<_i386.MensajeServices>(() => appModule.mensajeServices);
    gh.factory<_i538.MensajeRepository>(() => appModule.mensajeRepository);
    gh.factory<_i21.MensajeUseCases>(() => appModule.mensajeUseCases);
    gh.factory<_i786.ZoomServices>(() => appModule.zoomServices);
    gh.factory<_i682.ZoomRepository>(() => appModule.zoomRepository);
    gh.factory<_i291.ZoomUseCases>(() => appModule.zoomUseCases);
    gh.factory<_i1067.VideoServices>(() => appModule.videoServices);
    gh.factory<_i144.VideoRepository>(() => appModule.videoRepository);
    gh.factory<_i806.VideoUseCases>(() => appModule.videoUseCases);
    gh.factory<_i355.UsersRepository>(() => appModule.userRepository);
    gh.factory<_i922.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i645.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i547.UsersUseCases>(() => appModule.userUseCases);
    gh.factory<_i216.CategoryService>(() => appModule.categoryService);
    gh.factory<_i591.ProductService>(() => appModule.productService);
    gh.factory<_i625.ProductRepository>(() => appModule.productRepository);
    gh.factory<_i857.CategoryRepository>(() => appModule.categoryRepository);
    gh.factory<_i452.CategoriesUseCase>(() => appModule.categoriesUseCase);
    gh.factory<_i233.ProductsUseCase>(() => appModule.productsUseCase);
    return this;
  }
}

class _$AppModule extends _i398.AppModule {}
