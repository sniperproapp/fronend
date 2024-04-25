// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sniper_pro/src/data/dataSource/local/SharedPref.dart' as _i12;
import 'package:sniper_pro/src/data/dataSource/remote/services/AuthService.dart'
    as _i4;
import 'package:sniper_pro/src/data/dataSource/remote/services/CategoryService.dart'
    as _i8;
import 'package:sniper_pro/src/data/dataSource/remote/services/ProductService.dart'
    as _i10;
import 'package:sniper_pro/src/data/dataSource/remote/services/UserServices.dart'
    as _i13;
import 'package:sniper_pro/src/data/dataSource/remote/services/VideoServices.dart'
    as _i17;
import 'package:sniper_pro/src/di/AppModule.dart' as _i19;
import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart' as _i3;
import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart'
    as _i7;
import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart' as _i9;
import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart' as _i14;
import 'package:sniper_pro/src/domain/Repository/VideoRepository.dart' as _i16;
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart' as _i5;
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart'
    as _i6;
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart'
    as _i11;
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart' as _i15;
import 'package:sniper_pro/src/domain/useCases/video/VideoUseCases.dart'
    as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i4.AuthService>(() => appModule.authService);
    gh.factory<_i5.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i6.CategoriesUseCase>(() => appModule.categoriesUseCase);
    gh.factory<_i7.CategoryRepository>(() => appModule.categoryRepository);
    gh.factory<_i8.CategoryService>(() => appModule.categoryService);
    gh.factory<_i9.ProductRepository>(() => appModule.productRepository);
    gh.factory<_i10.ProductService>(() => appModule.productService);
    gh.factory<_i11.ProductsUseCase>(() => appModule.productsUseCase);
    gh.factory<_i12.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i13.UserServices>(() => appModule.userServices);
    gh.factory<_i14.UsersRepository>(() => appModule.userRepository);
    gh.factory<_i15.UsersUseCases>(() => appModule.userUseCases);
    gh.factory<_i16.VideoRepository>(() => appModule.videoRepository);
    gh.factory<_i17.VideoServices>(() => appModule.videoServices);
    gh.factory<_i18.VideoUseCases>(() => appModule.videoUseCases);
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
