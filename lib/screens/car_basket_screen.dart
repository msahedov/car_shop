import 'package:car_shop/constants/page_routs.dart';
import 'package:car_shop/objects/car_item_object.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarBasketScreen extends StatefulWidget {
  CarBasketScreen({Key? key}) : super(key: key);

  @override
  _CarBasketScreenState createState() => _CarBasketScreenState();
}

class _CarBasketScreenState extends State<CarBasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  appBar: AppBar(
      //     automaticallyImplyLeading: false,
      //     leading:const BackButton(color: Colors.black),
      //     elevation: 0.0,backgroundColor:const Color(0xff92a8d1) ,title:const Text("Ordered Cars",style: TextStyle(fontSize: 20,fontFamily: descFont,color: Colors.black,fontWeight: FontWeight.w900),),),

      body: SizedBox(
        child: CarItemObject.basket.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: CarItemObject.basket.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    decoration: BoxDecoration(
                        gradient:
                            const LinearGradient(colors: [Colors.blue, Colors.grey], stops: [0, 1]),
                        borderRadius: BorderRadius.circular(25)),
                    child: ListTile(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(FontAwesomeIcons.trash),
                        onPressed: () {
                          setState(() {
                            CarItemObject.basket.removeAt(index);
                          });
                        },
                      ),
                      leading: Image.asset(CarItemObject.basket[index]["car"].imageName),
                      title: Text(CarItemObject.basket[index]["car"].carName,
                          style: const TextStyle(
                              fontFamily: descFont,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              height: 2)),
                      subtitle: Text(CarItemObject.basket[index]["car"].carPrice,
                          style: const TextStyle(
                              fontFamily: descFont,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 2)),
                    ),
                  );
                }),
      ),
    );
  }
}
