import 'package:flutter/material.dart';

class CarItemObject {
  static List<Map<String, dynamic>> basket = [];
  static List<CarItemObject> favorites = [
    CarItemObject(
        imageName: "assets/cars/sedan/1.png",
        carName: "BMW sedan",
        description:
            "BMW 8 Series. The BMW 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
        backgroudColor: Colors.black),
    CarItemObject(
        imageName: "assets/cars/mpv/1.png",
        carName: "MERCEDES ",
        description:
            "MERCEDES 8 Series. The MERCEDES 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
        backgroudColor: Colors.black),
  ];
  static List<Map<String, dynamic>> basketItems = [
    {
      "car": CarItemObject(
          imageName: "assets/cars/sedan/4.png",
          carName: "Honda ",
          description:
              "Honda Civic. ... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
      "qty": 1
    },
    {
      "car": CarItemObject(
          imageName: "assets/cars/mpv/2.png",
          carName: "Mitsibushi",
          description:
              "The Mitsibushi Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      "qty": 1
    },
  ];

  String imageName;
  String carName;
  String carPrice;

  int carYear;
  int carPower;
  String description;
  Color backgroudColor;

  CarItemObject(
      {required this.imageName,
      required this.carName,
      this.carPower = 100,
      this.carYear = 2019,
      this.description = "",
      this.backgroudColor = Colors.green,
      this.carPrice = "169.000"});

  static List<List<CarItemObject>> cars = [
    //Sedan
    [
      CarItemObject(
          imageName: "assets/cars/sedan/1.png",
          carName: "BMW sedan",
          description:
              "BMW 8 Series. The BMW 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/sedan/2.png",
          carName: "Fiat sedan",
          description:
              "The Fiat Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/sedan/3.png",
          carName: "Honda sedan",
          description:
              "The Honda Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/sedan/4.png",
          carName: "Honda ",
          description:
              "Honda Civic. ... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
    ],
    //Hatchback
    [
      CarItemObject(
          imageName: "assets/cars/hatchback/1.png",
          carName: "Mercedes",
          description:
              "Mercedes. The Mercedes is a range of grand tourers produced by Mazda. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/hatchback/2.png",
          carName: "Hundai",
          description:
              "The Hundai Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/hatchback/3.png",
          carName: "TOYOTA",
          description:
              "Toyota. The Toyota is a range of grand tourers produced by Mazda. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/hatchback/4.png",
          carName: "Toyota",
          description:
              "The Toyota Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/hatchback/5.png",
          carName: "Pulsar",
          description:
              "Pulsar. The Pulsar is a range of grand tourers produced by Pulsar. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
    ],
    //MPV
    [
      CarItemObject(
          imageName: "assets/cars/mpv/1.png",
          carName: "MERCEDES ",
          description:
              "MERCEDES 8 Series. The MERCEDES 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/mpv/2.png",
          carName: "Mitsibushi",
          description:
              "The Mitsibushi Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/mpv/3.png",
          carName: "TOYOTA",
          description:
              "TOYOTA... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
      CarItemObject(
          imageName: "assets/cars/mpv/4.png",
          carName: "Fiat",
          description:
              "The Fiat Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
    ],
    //SUV
    [
      CarItemObject(
          imageName: "assets/cars/suv/1.png",
          carName: "Porshce",
          description:
              "Porshce 8 Series. The Porshce 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/suv/2.png",
          carName: "MAZDA ",
          description:
              "The MAZDA Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/suv/3.png",
          carName: "Range Rover",
          description:
              "The Range Rover  sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/suv/4.png",
          carName: "BMW ",
          description:
              "BMW... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
      CarItemObject(
          imageName: "assets/cars/suv/5.png",
          carName: "MGZS ",
          description:
              "MGZS... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
    ],
    //Crossover
    [
      CarItemObject(
          imageName: "assets/cars/crossover/1.png",
          carName: "KICKS crossover",
          description:
              "KICKS is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/crossover/2.png",
          carName: "LEXUS GX",
          description:
              "The LEXUS is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/crossover/3.png",
          carName: "KIA",
          description:
              "The KIA is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/crossover/4.png",
          carName: "Hundai",
          description:
              "Hundai ... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
      CarItemObject(
          imageName: "assets/cars/crossover/5.png",
          carName: "Renault",
          description:
              "Renault ... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
          backgroudColor: Colors.purple),
    ],
    //Coupe
    [
      CarItemObject(
          imageName: "assets/cars/coupe/1.png",
          carName: "BMW ",
          description:
              "BMW 8 Series. The BMW 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/coupe/2.png",
          carName: "AUDI",
          description:
              "The AUDI is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/coupe/3.png",
          carName: "BMW",
          description:
              "The BMW is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/coupe/4.png",
          carName: "BMW coupe",
          description:
              "The BMW is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/coupe/5.png",
          carName: "BMW",
          description:
              "The BMW is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
    ],
    //Convertible
    [
      CarItemObject(
          imageName: "assets/cars/convertible/1.png",
          carName: "Audi",
          description:
              "Audi 8 Series. The Audi 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
          backgroudColor: Colors.black),
      CarItemObject(
          imageName: "assets/cars/convertible/2.png",
          carName: "BMW",
          description:
              "The BMW is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/convertible/3.png",
          carName: "Mercedes",
          description:
              "The Mercedes is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/convertible/4.png",
          carName: "Fiat sedan",
          description:
              "The Fiat Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
      CarItemObject(
          imageName: "assets/cars/convertible/5.png",
          carName: "AUDI conver",
          description:
              "The AUDI is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
          backgroudColor: Colors.red),
    ]
  ];

  static List<CarItemObject> get allCars {
    List<CarItemObject> _cars = [];
    for (var i in cars) {
      for (var j in i) {
        _cars.add(j);
      }
    }
    return _cars;
  }

  static List<CarItemObject> searchCar(String text) {
    List<CarItemObject> res = [];

    allCars.forEach((car) {
      if (car.carName.toLowerCase().contains(text.toLowerCase())) {
        res.add(car);
      }
    });

    return res;
  }

  static void deleteCar(CarItemObject car) {
    List<CarItemObject> _cars = [];
    for (var el in basket) {
      _cars.add(el["car"]);
    }

    int index = _cars.indexOf(car);
    basket.removeAt(index);
  }

  static bool isAddToCart(CarItemObject car) {
    List<CarItemObject> _cars = [];
    for (var el in basket) {
      _cars.add(el["car"]);
    }

    if (_cars.contains(car)) return true;
    return false;
  }
}

class Delivery {
  String name;
  String address;
  String town;
  String areaCode;
  String numberOfCard;
  String nameOfCard;
  Delivery(
      {required this.name,
      required this.address,
      required this.town,
      required this.areaCode,
      required this.nameOfCard,
      required this.numberOfCard});
}
