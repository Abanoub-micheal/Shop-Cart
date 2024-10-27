import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';
import 'package:shop_cart/ui/views/cart/cart_states.dart';
import '../../../domain/use_cases/delete_item_in_cart_use_case.dart';
import '../../../domain/use_cases/get_cart_use_case.dart';
import '../../../domain/use_cases/up_date_count_in_cart_use_case.dart';

class CartViewModel extends Cubit<CartStates>{
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpDateCountInCartUseCase upDateCountInCartUseCase;
  CartViewModel({required this.getCartUseCase,required this.deleteItemInCartUseCase,required this.upDateCountInCartUseCase}):super(GetCartInitialStates());

  List<GetProductsCartEntity >productList=[];
  static CartViewModel get(context)=> BlocProvider.of(context);

  void getCart()async{
    emit(GetCartLoadingStates(loadingMessage: 'Loading'));
    var either=await getCartUseCase.invoke();
    either.fold((l) {
      emit(GetCartErrorStates(errorMessage: l));
    }, (response) {
      productList=response.data?.products??[];
      emit(GetCartSuccessStates(getCartResponseEntity: response));
    },);


  }
  void deleteItemInCart(String productId)async{
    var either=await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) {
      emit(DeleteItemInCartErrorStates(errorMessage: l));
    }, (response) {
      productList=response.data?.products??[];
      emit(DeleteItemInCartSuccessStates(getCartResponseEntity: response));
    },);


  }

  void upDateCountInCart(String productId,String count)async{
    var either=await upDateCountInCartUseCase.invoke(productId,count);
    either.fold((l) {
      emit(UpDateCountInCartErrorStates(errorMessage: l));
    }, (response) {
      productList=response.data?.products??[];
      emit(UpDateCountInCartSuccessStates(getCartResponseEntity: response));
    },);


  }






}