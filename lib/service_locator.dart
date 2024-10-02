import 'package:get_it/get_it.dart';
import 'package:shop_app/data/auth/repository/auth_repository_impl.dart';
import 'package:shop_app/data/auth/source/auth_firebase_service.dart';
import 'package:shop_app/data/category/source/category_firebase_service.dart';
import 'package:shop_app/domain/auth/repository/auth_repository.dart';
import 'package:shop_app/domain/category/repository/category_repository.dart';
import 'package:shop_app/domain/product/repository/product_repository.dart';


import 'data/category/repository/category_repository_impl.dart';
import 'data/order/repository/order_repository_impl.dart';
import 'data/order/source/order_firebase_service.dart';
import 'data/product/repository/product_repository_impl.dart';
import 'data/product/source/product_firebase_service.dart';
import 'domain/auth/usecase/get_ages_use_case.dart';
import 'domain/auth/usecase/get_user_use_case.dart';
import 'domain/auth/usecase/is_logged_in_use_case.dart';
import 'domain/auth/usecase/rest_password_email_use_case.dart';
import 'domain/auth/usecase/signin_use_case.dart';
import 'domain/auth/usecase/signup_use_case.dart';
import 'domain/category/usecases/get_categories_use_case.dart';
import 'domain/order/repository/order_repository.dart';
import 'domain/order/usecases/add_to_cart.dart';
import 'domain/order/usecases/get_cart_products.dart';
import 'domain/order/usecases/get_orders.dart';
import 'domain/order/usecases/order_registration.dart';
import 'domain/order/usecases/remove_cart_product.dart';
import 'domain/product/usecases/add_or_remove_favorite_product.dart';
import 'domain/product/usecases/get_favorties_products.dart';
import 'domain/product/usecases/get_new_in.dart';
import 'domain/product/usecases/get_products_by_category_id.dart';
import 'domain/product/usecases/get_products_by_title.dart';
import 'domain/product/usecases/get_top_selling.dart';
import 'domain/product/usecases/is_favorite.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Services

  sl.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<CategoryFirebaseService>(
      CategoryFirebaseServiceImpl()
  );

  sl.registerSingleton<ProductFirebaseService>(
      ProductFirebaseServiceImpl()
  );

  sl.registerSingleton<OrderFirebaseService>(
      OrderFirebaseServiceImpl()
  );




  // Repositories

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );

  sl.registerSingleton<CategoryRepository>(
      CategoryRepositoryImpl()
  );

  sl.registerSingleton<ProductRepository>(
      ProductRepositoryImpl()
  );

  sl.registerSingleton<OrderRepository>(
      OrderRepositoryImpl()
  );


  // Usecases

  sl.registerSingleton<SignupUsecase>(
      SignupUsecase()
  );

  sl.registerSingleton<GetAgesUseCase>(
      GetAgesUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );

  sl.registerSingleton<RestPasswordEmailUseCase>(
      RestPasswordEmailUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );

  sl.registerSingleton<GetCategoriesUseCase>(
      GetCategoriesUseCase()
  );

  sl.registerSingleton<GetTopSellingUseCase>(
      GetTopSellingUseCase()
  );

  sl.registerSingleton<GetNewInUseCase>(
      GetNewInUseCase()
  );

  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
      GetProductsByCategoryIdUseCase()
  );

  sl.registerSingleton<GetProductsByTitleUseCase>(
      GetProductsByTitleUseCase()
  );

  sl.registerSingleton<AddToCartUseCase>(
      AddToCartUseCase()
  );

  sl.registerSingleton<GetCartProductsUseCase>(
      GetCartProductsUseCase()
  );

  sl.registerSingleton<RemoveCartProductUseCase>(
      RemoveCartProductUseCase()
  );

  sl.registerSingleton<OrderRegistrationUseCase>(
      OrderRegistrationUseCase()
  );

  sl.registerSingleton<AddOrRemoveFavoriteProductUseCase>(
      AddOrRemoveFavoriteProductUseCase()
  );

  sl.registerSingleton<IsFavoriteUseCase>(
      IsFavoriteUseCase()
  );

  sl.registerSingleton<GetFavortiesProductsUseCase>(
      GetFavortiesProductsUseCase()
  );

  sl.registerSingleton<GetOrdersUseCase>(
      GetOrdersUseCase()
  );
}