import 'package:book_store/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:book_store/Core/Database/remote/DioHelper/end_points.dart';
import 'package:book_store/Features/HomeScreen/View/Components/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  int selectedPageIndex = 0;
  PageController pageController = PageController();
  AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();
  List<Widget> homePages = [
    const Home(),
    const Home(),
    const Home(),
    const Home()
  ];
  void changePage(int index) {
    pageController.jumpToPage(index);
    selectedPageIndex = index;
    emit(ChangePageState());
  }

  List<String> homeSliderImages = [];
  void getHomeSliderImages() {
    homeSliderImages = [];
    DioHelper.getData(url: sliderHomeEndPoint).then((value) {
      for (var element in value.data['data']['sliders']) {
        homeSliderImages.add(element);
      }
      emit(GetHomeSliderSuccessState());
    }).catchError((onError) {
      emit(GetHomeSliderErrorState());
    });
  }
}
