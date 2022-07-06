// ignore_for_file: avoid_print

import 'package:car_shop/objects/car_item_object.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../constants/page_routs.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class OrderScreen extends StatefulWidget {
  final CarItemObject car;
  OrderScreen(this.car);

  @override
  State<StatefulWidget> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late TextEditingController _name, _area, _town, _number, _nameOfcard, _address;
  final _formKey = GlobalKey<FormState>();
  int currentPage = 0;
  bool hasOrder = false;
  Widget loadingWidget = const SizedBox(
    height: 1,
  );
  bool _rememberMeCheckboxValue = false;
  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _address = TextEditingController();
    _number = TextEditingController();
    _area = TextEditingController();
    _nameOfcard = TextEditingController();
    _town = TextEditingController();
  }

  _placeOrder() {
    late List<CarItemObject> cars = [];
    for (var element in CarItemObject.basket) {
      setState(() {
        cars.add(element["car"]);
      });
    }
    if (hasOrder) {
      loadingWidget = const LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [Colors.white],
      );
      if (!cars.contains(widget.car)) {
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            Map<String, dynamic> _map = {
              "car": widget.car,
              "delivery": Delivery(
                  name: _name.text,
                  address: _address.text,
                  town: _town.text,
                  areaCode: _area.text,
                  nameOfCard: _nameOfcard.text,
                  numberOfCard: _number.text)
            };
            CarItemObject.basket.add(_map);

            loadingWidget = const SizedBox(
              height: 1,
            );
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              "Car succesfully ordered to the address",
              style: TextStyle(fontFamily: descFont, fontSize: 18, color: Colors.blue),
            )));
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: "",
                          )));
            });
          });
        });
      }
    } else {
      loadingWidget = const SizedBox(
        height: 1,
      );
    }
    hasOrder = !hasOrder;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.grey], stops: [0, 1]),
          color: Color.fromRGBO(220, 225, 231, 1)),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                    child: TextFormField(
                      controller: _name,
                      style: const TextStyle(fontSize: 20, fontFamily: descFont),
                      decoration: const InputDecoration(
                          labelText: "Name",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white, fontFamily: descFont)),
                      validator: (input) => input!.isEmpty ? "Please enter a valid email" : null,
                      onSaved: (input) => print(input),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                    child: TextFormField(
                      controller: _address,
                      style: const TextStyle(fontSize: 20, fontFamily: descFont),
                      decoration: const InputDecoration(
                          labelText: "Delivery address",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white, fontFamily: descFont)),
                      validator: (input) => input!.isEmpty ? "Please enter a valid email" : null,
                      onSaved: (input) => print(input),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                    child: TextFormField(
                      controller: _town,
                      style: const TextStyle(fontSize: 20, fontFamily: descFont),
                      decoration: const InputDecoration(
                          labelText: "Town",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white, fontFamily: descFont)),
                      validator: (input) => input!.isEmpty ? "Please enter a valid email" : null,
                      onSaved: (input) => print(input),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                    child: TextFormField(
                      controller: _area,
                      style: const TextStyle(fontSize: 20, fontFamily: descFont),
                      decoration: const InputDecoration(
                          labelText: "Area code",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white, fontFamily: descFont)),
                      validator: (input) => input!.isEmpty ? "Please enter a valid email" : null,
                      onSaved: (input) => print(input),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: _rememberMeCheckboxValue,
                              onChanged: (value) {
                                _rememberMeCheckboxValue = value!;
                                setState(() {});
                              }),
                          const Text(
                            "Remember me",
                            style: TextStyle(fontFamily: descFont, fontSize: 20),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: TextFormField(
                controller: _number,
                style: const TextStyle(fontSize: 20, fontFamily: descFont),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "0000-0000-0000-0000",
                    hintStyle: TextStyle(fontFamily: descFont, fontSize: 20),
                    labelStyle: TextStyle(color: Colors.grey)),
                validator: (input) => input!.isEmpty ? "Please enter a valid email" : null,
                onSaved: (input) => print(input),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Container(
                decoration: const BoxDecoration(),
                child: TextFormField(
                  controller: _nameOfcard,
                  style: const TextStyle(fontSize: 20, fontFamily: descFont),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name on the Card",
                      hintStyle: TextStyle(fontFamily: descFont, fontSize: 20),
                      labelStyle: TextStyle(color: Colors.grey)),
                  validator: (input) => input!.isEmpty ? "Please enter a valid email" : null,
                  onSaved: (input) => print(input),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 40, maxWidth: 70),
                child: loadingWidget,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _placeOrder();
                        } else {
                          return;
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(109, 130, 159, 1),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                            child: Text(
                          "Place order",
                          style: TextStyle(
                            fontFamily: descFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
