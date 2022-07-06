import 'package:car_shop/constants/constants.dart';
import 'package:car_shop/objects/car_item_object.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_item_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> products = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < CarItemObject.basketItems.length; i++) {
      setState(() {
        products.add({
          "car": CarItemObject.basketItems[i]["car"],
          "image": CarItemObject.basketItems[i]["car"].imageName,
          "price": CarItemObject.basketItems[i]["car"].carPrice,
          "count": CarItemObject.basketItems[i]["qty"]
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: RichText(
            text: TextSpan(
                text: "cart".tr,
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                    fontSize: 22),
                children: [
              TextSpan(
                  text: CarItemObject.basketItems.isEmpty
                      ? ""
                      : " - ${CarItemObject.basketItems.length}" + "item".tr,
                  style: const TextStyle(
                      fontFamily: "Rubik",
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 18))
            ])),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 120.0),
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          itemExtent: 180,
          itemBuilder: (BuildContext context, int index) {
            return CartItem(
              car: CarItemObject.basketItems[index]["car"],
              price: (CarItemObject.basketItems[index]["qty"] *
                      double.parse(CarItemObject.basketItems[index]["car"].carPrice))
                  .toString(),
              image: CarItemObject.basketItems[index]["car"].imageName,
              count: CarItemObject.basketItems[index]["qty"].toString(),
              removeFunction: () {
                setState(() {
                  CarItemObject.basketItems[index]["qty"] == 1
                      ? () {
                          products.removeAt(index);
                          CarItemObject.basketItems.removeAt(index);
                        }
                      : () {
                          products[index]["count"] -= 1;
                          CarItemObject.basketItems[index]["qty"] -= 1;
                        };
                });
              },
              addFunction: () {
                setState(() {
                  products[index]["count"] += 1;
                  CarItemObject.basketItems[index]["qty"] += 1;
                });
              },
              deleteFunction: () {
                setState(() {
                  products.removeAt(index);
                  CarItemObject.basketItems.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("total".tr + " : ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 16)),
                      Expanded(
                          child: Text(totalPrice + " TMT",
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 16))),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      color: priamryColor_1,
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => OrderConfirm())),
                      child: Text("order".tr,
                          style: TextStyle(
                              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
                )),
          ],
        ),
        //  margin: const EdgeInsets.only(bottom: 65),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide(color: Color(0xFFECEDED)))),
        height: 60,
        width: double.infinity,
      ),
    );
  }

  String get totalPrice {
    double summ = 0;
    for (int i = 0; i < CarItemObject.basketItems.length; i++) {
      summ += CarItemObject.basketItems[i]["qty"] *
          double.parse(CarItemObject.basketItems[i]["car"].carPrice);
    }
    return summ.toString();
  }
}

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({Key? key}) : super(key: key);
  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  bool shipment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("confirm".tr),
        backgroundColor: priamryColor_1,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextFormField(
              decoration: InputDecoration(labelText: "name".tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextFormField(
              decoration: InputDecoration(labelText: "phone".tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextFormField(
              decoration: InputDecoration(labelText: "address".tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
            child: TextFormField(
              decoration: InputDecoration(labelText: "note".tr),
            ),
          ),
          Text("pay".tr, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          RadioListTile(
              value: true,
              groupValue: shipment,
              title: Text("credit".tr),
              onChanged: (val) {
                setState(() {
                  shipment = !shipment;
                });
              }),
          RadioListTile(
              value: false,
              groupValue: shipment,
              title: Text("cash".tr),
              onChanged: (val) {
                setState(() {
                  shipment = !shipment;
                });
              }),
          SizedBox(height: 30),
          RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              elevation: 0.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              color: priamryColor_1,
              onPressed: () {
                CarItemObject.basket.clear();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Order Successfully")));
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.of(context).pop();
                });
              },
              child: Text("confirm".tr,
                  style:
                      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
