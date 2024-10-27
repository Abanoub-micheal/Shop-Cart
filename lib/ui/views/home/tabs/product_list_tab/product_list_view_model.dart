import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:shop_cart/ui/views/home/tabs/product_list_tab/product_list_states.dart';
import '../../../../../domain/entities/add_to_cart_response_entity.dart';
import '../../../../../domain/entities/product_response_entity.dart';
import '../../../../../domain/use_cases/get_all_products_use_case.dart';

class ProductListViewModel extends Cubit<ProductListStates>{
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  List<ProductEntity>productList=[];
  int numOfItems=0;
late  AddToCartResponseEntity addToCartResponseEntity;

  ProductListViewModel({required this.getAllProductsUseCase,required this.addToCartUseCase}):super(ProductListInitialState());

static ProductListViewModel getInstance(context){
   return BlocProvider.of(context);

 }
  void getProducts()async{
    emit(ProductListLoadingState(loadingMessage: 'Loading...'));

   var either=await getAllProductsUseCase.invoke();
   either.fold((l) {
     emit(ProductListErrorState(errorMessage: l));
   }, (response) {
     productList=response.data??[];
     emit(ProductListSuccessState());
   },);

  }
  void addToCart(String productId)async{
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));

    var either=await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorState(errorMessage: l));
    }, (response) {
      addToCartResponseEntity=response;
      numOfItems=response.numOfCartItems??0;
      emit(AddToCartSuccessState());
    },);

  }




}