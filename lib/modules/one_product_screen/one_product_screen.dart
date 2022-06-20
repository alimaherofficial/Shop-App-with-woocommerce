import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:the_last3/cubit/one_product_cubit/one_product_cubit.dart';
import 'package:the_last3/cubit/one_product_cubit/one_product_ststes.dart';
import 'package:the_last3/modules/cart_sccreen/cart_screen.dart';
import 'package:the_last3/shared/components/components.dart';
import 'package:the_last3/styles/colors/colors.dart';
import 'package:the_last3/styles/colors/icon_broken.dart';


class OneProductScreen extends StatelessWidget {
  final String url;
  final String name;
  final String des;
  final String price;
  const OneProductScreen({
    Key? key,
    required this.url,
    required this.name,
    required this.des,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneProductCubit, OneProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OneProductCubit().get(context);
        List<Widget> rowtoggele = [
          OverView(name: name, price: price, cubit: cubit),
          const Reviews(),
          const SimilarProducts(),
        ];
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: AutoSizeText(name),
            leading: IconButton(
              icon: const Icon(
                IconlyBroken.Arrow___Left_2,
              ),
              onPressed: () {
                Navigator.pop(context);
                cubit.x = 0;
                CupertinoPageRoute(builder: (context) => Container());
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBroken.Send,
                  color: MyColors.iconsColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBroken.Ticket_Star,
                  color: MyColors.iconsColor,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Badge(
                    badgeContent: Text(
                      cubit.cartnumber.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    position: BadgePosition.topStart(top: 1, start: 8),
                    badgeColor: defaultColor,
                    child: const Icon(
                      IconlyBroken.Buy,
                      color: MyColors.iconsColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: url,
                  height: 350,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage('assets/images/error.jpg'),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.changex(0);
                            },
                            child: AutoSizeText(
                              'Over View',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: cubit.x == 0
                                      ? defaultColor
                                      : Colors.grey),
                            ),
                          ),
                          Container(
                            color: cubit.x == 0 ? defaultColor : Colors.grey,
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.changex(1);
                            },
                            child: AutoSizeText(
                              'Reviews',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: cubit.x == 1
                                      ? defaultColor
                                      : Colors.grey),
                            ),
                          ),
                          Container(
                            color: cubit.x == 1 ? defaultColor : Colors.grey,
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.changex(2);
                            },
                            child: AutoSizeText(
                              'Similar Products',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: cubit.x == 2
                                      ? defaultColor
                                      : Colors.grey),
                            ),
                          ),
                          Container(
                            color: cubit.x == 2 ? defaultColor : Colors.grey,
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                rowtoggele[cubit.x],
              ],
            ),
          ),
        );
      },
    );
  }
}
