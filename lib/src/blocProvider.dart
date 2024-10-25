import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/injection.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/mensaje/MensajeUseCases.dart';
 
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/video/VideoUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/ZoomUseCases.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproductdetailBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/bloc/ProfCategoryUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<LogoutBloc>(
      create: (context) => LogoutBloc(locator<AuthUseCases>())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterIniteven())),
  BlocProvider<RecuperarpassBloc>(
      create: (context) => RecuperarpassBloc(locator<AuthUseCases>())),
  BlocProvider<RolesBloc>(
      create: (context) =>
          RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(
      create: (context) =>
          AdminHomeBloc(locator<AuthUseCases>())..add(adminProfInfoGetUser())),
  BlocProvider<ProfHomeBloc>(
      create: (context) =>
          ProfHomeBloc(locator<AuthUseCases>())..add((ProfInfoGetUser()))),
  BlocProvider<ProfileInfoBloc>(
      create: (context) => ProfileInfoBloc(locator<AuthUseCases>())
        ..add((ProfileInfoGetUser()))),
  BlocProvider<ProfileUpdateBloc>(
      create: (context) =>
          ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(
      create: (context) => AdminCategoryCreateBloc(locator<CategoriesUseCase>())
        ..add((AdminCategoriInitEvent()))),
  BlocProvider<ProfCategoryCreateBloc>(
      create: (context) => ProfCategoryCreateBloc(locator<CategoriesUseCase>())
        ..add((ProfCategoriInitEvent()))),
  BlocProvider<AdminCategoryListBloc>(
      create: (context) => AdminCategoryListBloc(locator<CategoriesUseCase>())),
  BlocProvider<ProfCategoryListBloc>(
      create: (context) => ProfCategoryListBloc(locator<CategoriesUseCase>())),
  BlocProvider<AdminCategoryUpdateBloc>(
      create: (context) =>
          AdminCategoryUpdateBloc(locator<CategoriesUseCase>())),
  BlocProvider<ProfCategoryUpdateBloc>(
      create: (context) =>
          ProfCategoryUpdateBloc(locator<CategoriesUseCase>())),
  BlocProvider<AdminProductCreateBloc>(
      create: (context) => AdminProductCreateBloc(
          locator<ProductsUseCase>(), locator<AuthUseCases>())),
  BlocProvider<ProfProductCreateBloc>(
      create: (context) => ProfProductCreateBloc(
          locator<ProductsUseCase>(), locator<AuthUseCases>())),
  BlocProvider<AdminProducListBloc>(
      create: (context) => AdminProducListBloc(
          locator<ProductsUseCase>(), locator<AuthUseCases>())),
  BlocProvider<ProfProducListBloc>(
      create: (context) => ProfProducListBloc(
          locator<ProductsUseCase>(), locator<AuthUseCases>())),
  BlocProvider<AdminProductUpdateBloc>(
      create: (context) => AdminProductUpdateBloc(locator<ProductsUseCase>())),
  BlocProvider<ProfProductUpdateBloc>(
      create: (context) => ProfProductUpdateBloc(locator<ProductsUseCase>())),
  BlocProvider<ClientHomeBloc>(
      create: (context) =>
          ClientHomeBloc(locator<AuthUseCases>())..add((clientInfoGetUser()))),
  BlocProvider<ClientCategoryListBloc>(
      create: (context) => ClientCategoryListBloc(
          locator<CategoriesUseCase>(), locator<AuthUseCases>())),
  BlocProvider<ClientProducListBloc>(
      create: (context) => ClientProducListBloc(locator<ProductsUseCase>())),
  BlocProvider<AdminUserListBloc>(
      create: (context) => AdminUserListBloc(locator<UsersUseCases>())),
  BlocProvider<ClientproductdetailBloc>(
      create: (context) => ClientproductdetailBloc(locator<ProductsUseCase>())),
  BlocProvider<clientproductdescargoBloc>(
      create: (context) => clientproductdescargoBloc(
          locator<UsersUseCases>(), locator<AuthUseCases>())
        ..add((inituser()))),
  BlocProvider<clientvideoBloc>(
      create: (context) => clientvideoBloc(locator<VideoUseCases>())),
  BlocProvider<AdminProducreportBloc>(
      create: (context) => AdminProducreportBloc(locator<ProductsUseCase>())),
  BlocProvider<ClientRankingListBloc>(
      create: (context) => ClientRankingListBloc(locator<ProductsUseCase>())),
  BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc(locator<AuthUseCases>())),
  BlocProvider<clientZoomBloc>(
      create: (context) => clientZoomBloc(locator<ZoomUseCases>())),

  BlocProvider<AdminZoomListBloc>(
      create: (context) => AdminZoomListBloc(locator<ZoomUseCases>())),
  BlocProvider<AdminZoomUpdateBloc>(
      create: (context) => AdminZoomUpdateBloc(locator<ZoomUseCases>())),
  BlocProvider<AdminMensajeCreateBloc>(
      create: (context) => AdminMensajeCreateBloc(locator<MensajeUseCases>())),
];
