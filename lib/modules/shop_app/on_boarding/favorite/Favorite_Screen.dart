import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/shop_app/cubit/cubit.dart';
import 'package:flutter_appp/Layout/shop_app/cubit/states.dart';
import 'package:flutter_appp/models/shop_model/favorites_model.dart';
import 'package:flutter_appp/shared/components/components.dart';
import 'package:flutter_appp/shared/components/constants.dart';
import 'package:flutter_appp/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
              condition: ShopCubit.get(context).homeModel != null &&
                  state is! ShopLoadingGetFavoriteStates,
              builder: (context) => ListView.separated(
                itemCount:
                    ShopCubit.get(context).favoritesModel.data!.data!.length,
                separatorBuilder: (BuildContext context, int index) =>
                    myDivider(),
                itemBuilder: (BuildContext context, int index) =>
                    buildListProduct(
                        ShopCubit.get(context)
                            .favoritesModel
                            .data!
                            .data![index]
                            .product,
                        context),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}

// Widget buildFavItem(FavoritesData model, context) => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 120.0,
//         child: Row(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                 Image(
//                   image: NetworkImage(model.product.image),
//                   width: 120.0,
//                   height: 120.0,
//                 ),
//                 if (model.product.discount != 0)
//                   Container(
//                     color: Colors.red,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 5.0,
//                     ),
//                     child: Text(
//                       'DISCOUNT',
//                       style: TextStyle(
//                         fontSize: 8.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     model.product.name,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       height: 1.3,
//                     ),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Text(
//                         model.product.price.toString(),
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: defaultColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5.0,
//                       ),
//                       if (model.product.discount != 0)
//                         Text(
//                           model.product.oldPrice.toString(),
//                           style: TextStyle(
//                             fontSize: 10.0,
//                             color: Colors.grey,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                       Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           ShopCubit.get(context)
//                               .changeFavorites(model.product.id);
//                         },
//                         icon: CircleAvatar(
//                           radius: 15.0,
//                           backgroundColor:
//                               ShopCubit.get(context).favorites[model.product.id]
//                                   ? defaultColor
//                                   : Colors.grey,
//                           child: Icon(
//                             Icons.favorite_border,
//                             size: 14.0,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
