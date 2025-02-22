import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/ui/login/saveToken.dart';
import 'package:movies/ui/tabs/profile/cubit/get_profile_states.dart';
import 'package:movies/ui/tabs/profile/cubit/get_profile_view_model.dart';
import 'package:movies/ui/tabs/profile/update_profile.dart';
import 'package:movies/ui/tabs/profile/watchList/cubit/WatchListViewModle.dart';
import 'package:movies/ui/tabs/profile/watchList/cubit/watchListStates.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/MovieItemWidget.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/sheardPrefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_manager.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'profile_Tab';

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  GetProfileViewModel viewModel = GetProfileViewModel();
  Watchlistviewmodle watchlistviewmodle = Watchlistviewmodle();
  ApiManager apiManager = ApiManager();

  List<String> avatarList = [
    AssetsManager.Avatara0,
    AssetsManager.Avatar1,
    AssetsManager.Avatar2,
    AssetsManager.Avatar3,
    AssetsManager.Avatar4,
    AssetsManager.Avatar5,
    AssetsManager.Avatar6,
    AssetsManager.Avatar7,
    AssetsManager.Avatar8,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryMovies();
    viewModel.getProfileDetails();
  }

  List<String> keys = [];
  getHistoryMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> keys = prefs.getKeys().toList();
    print("====================================");
    print(keys[0]);
    print(keys[1]);
    print(keys[2]);
    // Iterate through keys and fetch values
    // for (String key in keys) {
    //   dynamic value = prefs.get(key);
    //   allPrefs[key] = value;
    // }
  }

  int watchListCount = 0;
  @override
  Widget build(BuildContext context) {
    getHistoryMovies();
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<GetProfileViewModel, GetProfileStates>(
          bloc: viewModel..getProfileDetails(),
          builder: (context, state) {
            if (state is LoadingGetProfileState) {
              return Center(
                child: const CircularProgressIndicator(
                  color: AppColors.darkGreyColor,
                ),
              );
            } else if (state is ErrorGetProfileState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStyles.regular16WhiteRoboto,
                ),
              );
            } else if (state is SuccessGetProfileState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.0458),
                      color: AppColors.darkGreyColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(avatarList[
                                          state.profileModel.data!.avaterId!]),
                                    ),
                                    SizedBox(height: height * 0.02),
                                    Text(
                                      state.profileModel.data!.name!,
                                      style: AppStyles.bold20WhiteRoboto,
                                    ),
                                  ],
                                ),
                                SizedBox(width: width * 0.1),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "$watchListCount",
                                          style: AppStyles.bold36WhiteRoboto,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .watch_list,
                                          style: AppStyles.bold24WhiteRoboto,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: width * 0.05),
                                    Column(
                                      children: [
                                        Text(
                                          "10",
                                          style: AppStyles.bold36WhiteRoboto,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.history,
                                          style: AppStyles.bold24WhiteRoboto,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomElevatedButton(
                                      text: AppLocalizations.of(context)!
                                          .edit_profile,
                                      onButtonClicked: () {
                                        Navigator.pushNamed(
                                          context,
                                          UpdateProfile.routeName,
                                          arguments: state.profileModel.data,
                                        );
                                        // todo: navigate to update profile screen
                                      },
                                      textStyle:
                                          AppStyles.regular20BlackRoboto)),
                              SizedBox(
                                width: width * 0.035,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: CustomElevatedButton(
                                    text: AppLocalizations.of(context)!.exit,
                                    onButtonClicked: () {
                                      removeToken();
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        LoginScreen.routeName,
                                        (route) => false,
                                      );
                                    },
                                    backgroundColor: AppColors.redColor,
                                    textStyle: AppStyles.regular20WhiteRoboto,
                                    borderColor: Colors.transparent,
                                    suffixIcon: Icon(
                                      Icons.logout,
                                      color: AppColors.whiteColor,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.darkGreyColor,
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicatorColor: AppColors.yellowColor,
                              labelColor: AppColors.yellowColor,
                              unselectedLabelColor: AppColors.whiteColor,
                              tabs: [
                                Tab(
                                  icon: ImageIcon(
                                      AssetImage(AssetsManager.watchListIcon)),
                                  text:
                                      AppLocalizations.of(context)!.watch_list,
                                ),
                                Tab(
                                  icon: ImageIcon(
                                    AssetImage(AssetsManager.historyIcon),
                                    color: AppColors.yellowColor,
                                  ),
                                  text: AppLocalizations.of(context)!.history,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.5,
                            child: TabBarView(
                              children: [
                                BlocBuilder<Watchlistviewmodle,
                                        Watchliststates>(
                                    bloc: watchlistviewmodle..getWatchList(),
                                    builder: (context, state) {
                                      if (state is SuccessGetWatchliststate) {
                                        watchListCount =
                                            state.movieResponse.data!.length;
                                        return GridView.builder(
                                            itemCount: state
                                                .movieResponse.data!.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisSpacing:
                                                        height * 0.01,
                                                    crossAxisSpacing:
                                                        width * 0.05,
                                                    childAspectRatio: 0.5,
                                                    crossAxisCount: 3),
                                            itemBuilder: (context, index) {
                                              return MovieItemWidget(
                                                  movieId: int.parse(state
                                                      .movieResponse
                                                      .data![index]
                                                      .movieId!),
                                                  image: state
                                                          .movieResponse
                                                          .data![index]
                                                          .imageUrl! ??
                                                      '',
                                                  rating: state
                                                          .movieResponse
                                                          .data![index]
                                                          .rating ??
                                                      0);
                                            });
                                      } else if (state
                                          is LoadingWatchliststate) {
                                        return Center(
                                          child:
                                              const CircularProgressIndicator(
                                            color: AppColors.darkGreyColor,
                                          ),
                                        );
                                      } else if (state is ErrorWatchliststate) {
                                        print(
                                            "${state.errorMessage} =========================================");
                                        return Center(
                                          child: Image.asset(
                                            AssetsManager.popCorn,
                                            width: 100,
                                          ),
                                        );
                                      }
                                      return Center(
                                        child: Image.asset(
                                          AssetsManager.popCorn,
                                          width: 100,
                                        ),
                                      );
                                    }),
                                GridView.builder(
                                    itemCount: keys.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: height * 0.01,
                                            crossAxisSpacing: width * 0.05,
                                            childAspectRatio: 0.5,
                                            crossAxisCount: 3),
                                    itemBuilder: (context, index) {
                                      
                                      String key = keys[index + 1];

                                      return MovieItemWidget(
                                          movieId: int.parse(
                                              SharedPreferenceUtils.getListData(
                                                      key: key)?[0] ??
                                                  '0'),
                                          image:
                                              SharedPreferenceUtils.getListData(
                                                      key: key)?[2] ??
                                                  '',
                                          rating:
                                              SharedPreferenceUtils.getListData(
                                                      key: key)?[1] as num ??
                                                  0);
                                    }),
                                // Center(
                                //   child: Text(
                                //     "No history available",
                                //     style: AppStyles.regular16WhiteRoboto,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },

        ),
      ),
    );
  }
}
