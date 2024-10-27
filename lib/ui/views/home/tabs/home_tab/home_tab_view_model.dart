import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/ui/views/home/tabs/home_tab/home_tab_states.dart';
import '../../../../../domain/entities/category_or_brand_response_entity/category_or_brand_entity.dart';
import '../../../../../domain/use_cases/get_all_brands_use_case.dart';
import '../../../../../domain/use_cases/get_all_categories_use_case.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({required this.getAllCategoriesUseCase,required this.getAllBrandsUseCase}):super(HomeTabInitialState());
  List<CategoryOrBrandsEntity>categoriesList=[];
 List<CategoryOrBrandsEntity>brandsList=[];
void getCategories()async{
  emit(HomeTabLoadingState());
  var either= await getAllCategoriesUseCase.invoke();
   either.fold((l) {
    emit(HomeTabErrorState(error: l));
  }, (response) {
     categoriesList=response.data??[];
    emit(HomeTabSuccessState());
  },);

}
  void getBrands()async{
    emit(HomeTabLoadingState());
    var either= await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorState(error: l));
    }, (response) {
      brandsList=response.data??[];
      emit(HomeTabSuccessState());
    },);

  }


}