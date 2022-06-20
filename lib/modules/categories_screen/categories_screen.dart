import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last3/cubit/home/home_cubit.dart';
import 'package:the_last3/cubit/home/home_states.dart';
import 'package:the_last3/shared/components/components.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit().get(context);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Image(
                          image: NetworkImage(
                              'https://tikamoon.online/ori-luna-solid-sheesham-table-seats-6-8-1283_41146.jpg'),
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'Tables',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image(
                          image: NetworkImage(
                              'https://images.crateandbarrel.com/is/image/Crate/ia-types-of-sofas-1a'),
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'sofas',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image(
                          image: NetworkImage(
                              'https://images.furnituredealer.net/img/products%2Fholland_house%2Fcolor%2F1279_1279-4278l-b.jpg'),
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'Dining Table',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                //   child: ListView.separated(
                //     itemCount: 10,
                //     shrinkWrap: true,
                //     separatorBuilder: (BuildContext context, int index) {
                //       return const SizedBox(
                //         height: 10,
                //       );
                //     },
                //     itemBuilder: (BuildContext context, int index) {
                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: const [
                //           Image(
                //             image: NetworkImage(
                //                 'https://tikamoon.online/ori-luna-solid-sheesham-table-seats-6-8-1283_41146.jpg'),
                //             height: 100,
                //             width: 100,
                //             fit: BoxFit.contain,
                //           ),
                //           Text(
                //             'tables',
                //             style: TextStyle(
                //               fontSize: 14,
                //             ),
                //           )
                //         ],
                //       );
                //     },
                //   ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.separated(
                itemCount: cubit.allproduct!.products.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return productBuilde(
                      cubit.allproduct!.products[index], index, context);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
