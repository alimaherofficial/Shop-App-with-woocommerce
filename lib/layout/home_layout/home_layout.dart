import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last3/cubit/app_cubit/cubit.dart';
import 'package:the_last3/cubit/app_cubit/stastes.dart';
import 'package:the_last3/cubit/home/home_cubit.dart';
import 'package:the_last3/shared/components/components.dart';
import 'package:the_last3/styles/colors/colors.dart';
import 'package:the_last3/styles/colors/icon_broken.dart';


class Homelayout extends StatelessWidget {
  Homelayout({Key? key}) : super(key: key);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getproduct(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            // backgroundColor: Colors.white,
            appBar: AppBar(
              leading:
                  //_widgetInBody.toString() == 'ProductsScreen' ?
                  IconButton(
                icon: const Icon(
                  // context.locale.toString() == 'en_EN'
                  IconlyBroken.Arrow___Right_2,
                ),
                onPressed: () {
                  // cubit.changeBottom(1);
                },
              ),
              //: Image.asset('assets/images/appbarlogo.png',),
              title: DefaultFormField(
                bgColor: MyColors.wightBG,
                isDense: true,
                // ignore: body_might_complete_normally_nullable
                validator: (String? value) {},
                prefixIcon:
                    //Icons.workspaces_outlined,
                    IconlyBroken.Search,
                suffixIcon:
                    //Icons.search_rounded,
                    IconlyBroken.Filter,
                controller: searchController,
                label: 'Search',
                textInputType: TextInputType.emailAddress,
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    IconlyBroken.Buy,
                    //color: Colors.amber,
                  ),
                )
              ],
            ),
            body: SafeArea(child: cubit.bottomScreen[cubit.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: true,
              unselectedFontSize: 0.0,
              selectedIconTheme: const IconThemeData(color: defaultColor),
              backgroundColor: Colors.white,
              currentIndex: cubit.currentIndex,
              onTap: (int index) {
                cubit.changeBottom(index);
              },
              items: const [
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.home,
                //   ),
                //   label: 'Home',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.apps,
                //   ),
                //   label: 'Categories',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.home_filled,
                //   ),
                //   label: 'Home',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.home_filled,
                //   ),
                //   label: 'Home',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.Home,
                    color: MyColors.iconsColor,
                  ),
                  label: 'Home',
                  activeIcon: Icon(
                    IconlyBroken.Home,
                    color: defaultColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.Category,
                    color: MyColors.iconsColor,
                  ),
                  label: 'Categories',
                  activeIcon: Icon(
                    IconlyBroken.Category,
                    color: defaultColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.Bag_2,
                    color: MyColors.iconsColor,
                  ),
                  label: 'Orders',
                  activeIcon: Icon(
                    IconlyBroken.Bag_2,
                    color: defaultColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.User,
                    color: MyColors.iconsColor,
                  ),
                  label: 'Account',
                  activeIcon: Icon(
                    IconlyBroken.User,
                    color: defaultColor,
                  ),
                ),
              ],
            ),

            // bottomNavigationBar: CurvedNavigationBar(
            //   backgroundColor: Colors.white,
            //   color: Colors.white,
            //   items: const <Widget>[
            //     Icon(
            //       IconlyBroken.Home,
            //       color: defaultColor,
            //     ),
            //     Icon(
            //       IconlyBroken.Category,
            //       color: defaultColor,
            //     ),
            //     Icon(
            //       IconlyBroken.Bag_2,
            //       color: defaultColor,
            //     ),
            //     Icon(
            //       IconlyBroken.User,
            //       color: defaultColor,
            //     ),

            //     // SvgPicture.asset(t3_ic_home, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            //     // SvgPicture.asset(t3_ic_msg, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            //     // SvgPicture.asset(t3_notification, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            //     // SvgPicture.asset(t3_ic_user, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            //   ],
            //   onTap: (int index) {
            //     cubit.changeBottom(index);
            //   },
            // ),
          );
        },
      ),
    );
  }
}
