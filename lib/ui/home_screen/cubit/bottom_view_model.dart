import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/browse/browse_tab.dart';
import '../../tabs/home/home_tab/home_tab.dart';
import '../../tabs/profile/profile_tab.dart';
import '../../tabs/search/search_tab.dart';
import 'bottom_state.dart';

class BottomViewModel extends Cubit<HomeStates> {
  BottomViewModel() : super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> tabsUIList = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  buttnNavOntop(index) {
    selectedIndex = index;
    emit(changeSelectedIndexState());
  }
}
