import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../objects/car_item_object.dart';

// ignore: must_be_immutable
class CarDetailScreen extends StatefulWidget {
  CarItemObject car;

  // ignore: use_key_in_widget_constructors
  CarDetailScreen({required this.car});

  @override
  CarDetailScreenState createState() => CarDetailScreenState();
}

class CarDetailScreenState extends State<CarDetailScreen> with SingleTickerProviderStateMixin {
  // _makeOrder(CarItemObject car) {
  //   Navigator.push(context, MaterialPageRoute(builder: (_) => OrderScreen(car)));
  // }

  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..forward()
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CarItemObject.isAddToCart(widget.car)
          ? RawMaterialButton(
              padding: const EdgeInsets.all(20.0),

              // ignore: avoid_function_literals_in_foreach_calls
              child: const Icon(Icons.clear, size: 30, color: Colors.white),
              fillColor: Colors.black.withOpacity(0.7),
              shape: const CircleBorder(),
              elevation: 10.0,
              onPressed: () {
                setState(() {
                  CarItemObject.deleteCar(widget.car);
                });
              },
            )
          : AnimatedBuilder(
              animation: CurvedAnimation(parent: controller, curve: Curves.slowMiddle),
              builder: (context, child) {
                return Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildContainer(
                          MediaQuery.of(context).size.shortestSide * 0.46 * controller.value),
                      _buildContainer(
                          MediaQuery.of(context).size.shortestSide * 0.52 * controller.value),
                      _buildContainer(
                          MediaQuery.of(context).size.shortestSide * 0.60 * controller.value),
                      RawMaterialButton(
                        padding: const EdgeInsets.all(15),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 30,
                          color: Colors.white,
                        ),
                        fillColor: Colors.black,
                        shape: const CircleBorder(),
                        elevation: 10.0,
                        onPressed: () {
                          CarItemObject.basketItems.add({"car": widget.car, "qty": 1});
                        },
                        // onPressed: () => _makeOrder(widget.car),
                      ),
                    ],
                  ),
                );
              },
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.blue, Colors.grey], stops: [0, 1]),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(child: Image(image: AssetImage(widget.car.imageName)))
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 40,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    icon: CarItemObject.favorites.contains(widget.car)
                        ? const Icon(Icons.favorite, size: 30, color: Colors.white)
                        : const Icon(Icons.favorite_border_outlined, size: 30, color: Colors.black),
                    onPressed: () {
                      if (CarItemObject.favorites.contains(widget.car)) {
                        setState(() {
                          CarItemObject.favorites.remove(widget.car);
                        });
                      } else {
                        setState(() {
                          CarItemObject.favorites.add(widget.car);
                        });
                      }
                    },
                  ),
                ),
                Positioned(
                  top: 70,
                  right: 50,
                  child: SafeArea(
                    child: Text(
                      widget.car.carName,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 50,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Starting at:",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          widget.car.carPrice,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                "Description",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                child: Text(
                  "The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975. It is the successor to the 02 Series and has been produced in seven different generations. The first generation of the 3 Series was only available as a 2-door sedan (saloon), however the model range has since expanded to include a 4-door sedan, 2-door convertible, 2-door coupé, 5-door station wagon, 5-door hatchback (Gran Turismo) and 3-door hatchback body styles. Since 2013, the coupé and convertible models have been marketed as the 4 Series, therefore the 3 Series range no longer includes these body styles. The 3 Series is BMW's best-selling model, accounting for around 30% of the BMW brand's annual total sales (excluding motorbikes).[1] The BMW 3 Series has won numerous awards throughout its history. The M version of the 3 series, M3, debuted with the E30 M3 in 1986",
                  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black87.withOpacity(1 - controller.value),
      ),
    );
  }

  double widthFactor = 0.7;
  double heightFactor = 0.15;
  double scaleFactor = 0.5;
}
