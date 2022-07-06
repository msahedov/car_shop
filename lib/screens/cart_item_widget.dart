import 'package:car_shop/objects/car_item_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.image,
      required this.price,
      required this.count,
      required this.addFunction,
      required this.removeFunction,
      required this.deleteFunction,
      required this.car})
      : super(key: key);
  final CarItemObject car;
  final String image;
  final String price;
  final String count;
  final VoidCallback addFunction;
  final VoidCallback removeFunction;
  final VoidCallback deleteFunction;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                height: 100,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Image.asset(image, fit: BoxFit.contain),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(car.carName.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        car.carYear.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        car.carPower.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: const BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: removeFunction,
                                    child: const SizedBox(
                                      width: 25,
                                      height: 25,
                                      // decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200, shape: BoxShape.circle),
                                    child: Text(count,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        )),
                                  ),
                                  InkWell(
                                    onTap: addFunction,
                                    child: const SizedBox(
                                      width: 25,
                                      height: 25,
                                      //decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(price + " TMT",
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 20.0,
            right: 15.0,
            child: InkWell(
                onTap: deleteFunction,
                child: const Icon(CupertinoIcons.trash, color: Colors.grey))),
      ],
    );
  }
}
