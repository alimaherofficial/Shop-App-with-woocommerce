// ignore_for_file: sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_last3/cubit/home/home_cubit.dart';
import 'package:the_last3/cubit/home/home_states.dart';
import 'package:the_last3/cubit/one_product_cubit/one_product_cubit.dart';
import 'package:the_last3/models/all_products_model/all_products.dart';
import 'package:the_last3/modules/one_product_screen/one_product_screen.dart';
import 'package:the_last3/network/local/cofig.dart';
import 'package:the_last3/styles/colors/colors.dart';


Widget productBuilde(
  ProducteModel model,
  int index,
  BuildContext context,
) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OneProductScreen(
                url: model.images!.images![0].src.toString(),
                name: model.name.toString(),
                des: '',
                price: model.price.toString(),
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        imageUrl: model.images!.images![0].src.toString(),
                        // cubit.allproduct!.products[0].images!.images![0].src.toString(),
                        height: 100.0,
                        width: 100.0,
                        // placeholder: (context, url) =>
                        //  const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage(
                            'assets/images/error.jpg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: Text(
                      model.name.toString(),
                      //cubit.allproduct!.products[0].name.toString(),
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          model.name.toString(),
                          //cubit.allproduct!.products[0].name.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${model.price.toString()} ${Config.currency}",
                          // cubit.allproduct!.products[0].price.toString()
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: defaultColor),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: defaultColor,
                          width: 1.5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            right: 35.0, left: 35.0, top: 7.0, bottom: 7.0),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(color: defaultColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
              ),
              padding: const EdgeInsets.all(4.0),
              child: const Text(
                'DISCOUNT',
                style: TextStyle(fontSize: 9.0, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );

// ignore: must_be_immutable
class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChanged;
  final Color bgColor;
  final String hint;
  final bool isDense;
  final bool isPassword;
  final FormFieldValidator<String> validator;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconPressed;
  final VoidCallback? onTap;
  bool isClickable;

  DefaultFormField(
      {Key? key,
      required this.controller,
      required this.textInputType,
      this.onSubmit,
      this.onChanged,
      required this.validator,
      required this.label,
      required this.prefixIcon,
      this.suffixIcon,
      this.suffixIconPressed,
      this.isPassword = false,
      this.isClickable = true,
      this.hint = '',
      this.onTap,
      this.isDense = false,
      this.bgColor = MyColors.scaffoldBackgroundColorMain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const InputDecorationTheme defaultTheme = InputDecorationTheme();

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        hintText: hint,
        labelText: label,
        //hintText
        prefixIcon: Icon(
          prefixIcon,
          color: MyColors.iconsColor,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: isDense
                    ? Container(
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          suffixIcon,
                          color: MyColors.iconsColor,
                        ),
                      )
                    : Icon(
                        suffixIcon,
                        color: MyColors.iconsColor,
                      ),
                onPressed: suffixIcon != null ? suffixIconPressed : null,
              )
            : null,
        enabledBorder: isDense
            ? const OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: BorderSide(color: Colors.white, width: 0.0),
              )
            : defaultTheme.enabledBorder,
        border: OutlineInputBorder(
          borderRadius: isDense
              ? BorderRadius.circular(15.0)
              : BorderRadius.circular(5.0),
        ),
        isDense: isDense, // Added this
        contentPadding: isDense
            ? const EdgeInsets.all(8)
            : defaultTheme.contentPadding, // Added this
      ),
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isPassword,
      onTap: onTap,
      enabled: isClickable,
    );
  }
}

class PicSliderbilder extends StatelessWidget {
  const PicSliderbilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          initialPage: 0,
          viewportFraction: 1.0,
          scrollDirection: Axis.horizontal,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            // cubit.homeSliderIndicator(index);
          }),
      items: const [
        Image(
          image: NetworkImage(
              'https://www.divigear.com/wp-content/uploads/2020/08/Divi-Carousel-Module-coverflow.jpg'),
        ),
        Image(
          image: NetworkImage(
              'https://www.divigear.com/wp-content/uploads/2020/08/Divi-Carousel-Module-coverflow.jpg'),
        ),
        Image(
          image: NetworkImage(
              'https://www.divigear.com/wp-content/uploads/2020/08/Divi-Carousel-Module-coverflow.jpg'),
        ),
      ],
      // offers.map((offerItem) {
      //   return SliderItem(
      //     offerItem: offerItem,
      //     offers: offers,
      //   );
      // }).toList(),
    );
  }
}

class OverView extends StatelessWidget {
  const OverView({
    Key? key,
    required this.name,
    required this.price,
    required this.cubit,
  }) : super(key: key);

  final String name;
  final String price;
  final OneProductCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(name),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
            child: Row(
              children: [
                AutoSizeText(
                  '$price  ${Config.currency}',
                  style: TextStyle(
                    color: defaultColor.shade100,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: defaultColor),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            cubit.minus();
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 23.0,
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white),
                        child: Text(
                          cubit.number.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            cubit.add();
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 23.0,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: AutoSizeText(
              'Historically, ERP systems were monolithic suites that that worked separately and didn’t talk with other systems. Each system required expensive, complex, and customized code to meet unique business requirements which slowed—or even prevented—the adoption of new technology or process optimizationHistorically, ERP systems were monolithic suites that that worked separately and didn’t talk with other systems. Each system required expensive, complex, and customized code to meet unique business requirements which slowed—or even prevented—the adoption of new technology or process optimization.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    cubit.cartadd();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: defaultColor,
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Add To Cart',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: defaultColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: defaultColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Buy Now',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: Container(
          color: Colors.grey,
          height: 1,
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return reviewWidget(context);
      },
    );
  }
}

Widget reviewWidget(context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Ali maher'),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber.shade400,
                          ),
                          itemSize: 18,
                          onRatingUpdate: (rating) {
                            // ignore: avoid_print
                            print(rating);
                          },
                          ignoreGestures: true,
                          unratedColor: Colors.grey[400],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Share your experiences with the product. List real pros and cons of the product. Tell the readers if a product is aimed at them [who the target users/buyers are]. Rule if the product is of the highest quality and whether its simply worth buying',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: RatingBar.builder(
              //     initialRating: 5,
              //     minRating: 1,
              //     direction: Axis.horizontal,
              //     allowHalfRating: false,
              //     itemCount: 5,
              //     itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              //     itemBuilder: (context, index) => Icon(
              //       IconlyBroken.Star,
              //       color: Colors.amber.shade400,
              //     ),
              //     itemSize: 18,
              //     onRatingUpdate: (rating) {
              //       // ignore: avoid_print
              //       print(rating);
              //     },
              //     ignoreGestures: true,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit().get(context);
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          //cubit.allproduct!.products.length,
          itemBuilder: (BuildContext context, int index) {
            return productBuilde(
              cubit.allproduct!.products[index],
              index,
              context,
            );
          },
        );
      },
    );
  }
}
