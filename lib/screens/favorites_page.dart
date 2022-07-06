import 'package:car_shop/constants/page_routs.dart';
import 'package:car_shop/objects/car_item_object.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'car_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Widget getGridView() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 40),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: CarItemObject.favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 20 / 30),
            itemBuilder: (BuildContext context, int index) => GridTile(
              footer: GridTileBar(
                  title: Text(CarItemObject.favorites[index].carName,
                      style: const TextStyle(
                          fontFamily: titleFont,
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  trailing: FloatingActionButton(
                      heroTag: CarItemObject.favorites[index].carName + index.toString(),
                      elevation: 0,
                      mini: true,
                      backgroundColor: const Color(0xFF1B3DC4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        CarItemObject.basketItems
                            .add({"car": CarItemObject.favorites[index], "qty": 1});
                      },
                      child: const Icon(Icons.add_shopping_cart, color: Colors.white))),
              child: Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          FadeRoute(
                              page: CarDetailScreen(
                            car: CarItemObject.favorites[index],
                          )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(1, -1),
                                color: Colors.grey.shade300,
                                blurRadius: 5)
                          ],
                          gradient: LinearGradient(
                            colors: [Colors.grey.shade500, Colors.grey.shade400],
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(CarItemObject.favorites[index].imageName),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            // ignore: iterable_contains_unrelated_type
                            child: InkWell(
                              child:
                                  CarItemObject.favorites.contains(CarItemObject.favorites[index])
                                      ? Material(
                                          elevation: 5,
                                          color: Colors.white,
                                          shape: CircleBorder(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: const Icon(Icons.favorite,
                                                size: 25, color: Color(0xFF1B3DC4)),
                                          ),
                                        )
                                      : Material(
                                          elevation: 5,
                                          color: Colors.white,
                                          shape: CircleBorder(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: const Icon(Icons.favorite_border_outlined,
                                                size: 25, color: Colors.black),
                                          )),
                              onTap: () {
                                if (CarItemObject.favorites
                                    .contains(CarItemObject.favorites[index])) {
                                  setState(() {
                                    CarItemObject.favorites.remove(CarItemObject.favorites[index]);
                                  });
                                } else {
                                  setState(() {
                                    CarItemObject.favorites.add(CarItemObject.favorites[index]);
                                  });
                                }
                              },
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Column(
                              children: <Widget>[
                                const Text(
                                  "starting at",
                                  style: TextStyle(
                                      fontFamily: titleFont,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(CarItemObject.favorites[index].carPrice,
                                    style:
                                        const TextStyle(fontFamily: descFont, color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: const BackButton(color: Colors.black),
      //   elevation: 0.0,
      //   backgroundColor: const Color(0xff92a8d1),
      //   title: const Text(
      //     "Favorites",
      //     style: TextStyle(
      //         fontSize: 20, fontFamily: descFont, fontWeight: FontWeight.w900, color: Colors.black),
      //   ),
      // ),

      body: SizedBox(child: CarItemObject.favorites.isEmpty ? const SizedBox() : getGridView()
          // : ListView.builder(
          //     itemCount: CarItemObject.favorites.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          //         padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          //         decoration: BoxDecoration(
          //             gradient:
          //                 const LinearGradient(colors: [Colors.blue, Colors.grey], stops: [0, 1]),
          //             borderRadius: BorderRadius.circular(25)),
          //         child: ListTile(
          //           visualDensity: VisualDensity.adaptivePlatformDensity,
          //           isThreeLine: true,
          //           trailing: IconButton(
          //             icon: const Icon(
          //               Icons.favorite,
          //               color: Colors.white,
          //               size: 30,
          //             ),
          //             onPressed: () {
          //               setState(() {
          //                 CarItemObject.favorites.removeAt(index);
          //               });
          //             },
          //           ),
          //           leading: Image.asset(CarItemObject.favorites[index].imageName),
          //           title: Text(CarItemObject.favorites[index].carName,
          //               style: const TextStyle(
          //                   fontFamily: descFont,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w900,
          //                   height: 2)),
          //           subtitle: Text(CarItemObject.favorites[index].carPrice,
          //               style: const TextStyle(
          //                   fontFamily: descFont,
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                   height: 2)),
          //         ),
          //       );
          //     }),

          ),
    );
  }
}
