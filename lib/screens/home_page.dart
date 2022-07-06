import 'package:car_shop/screens/cart_page.dart';
import 'package:car_shop/screens/favorites_page.dart';
import 'package:car_shop/screens/login_screen.dart';
import 'package:car_shop/screens/profil_page.dart';
import 'package:car_shop/screens/search_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../objects/car_item_object.dart';
import 'car_detail_screen.dart';
import '../constants/page_routs.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selectedPage = 0;
  int _selecTedIndex = 0;
  int _navbarIndex = 0;
  late final PageController _pageController;
  CarouselController buttonCarouselController = CarouselController();
  late final TabController tabController;
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _tabController = TabController(initialIndex: 0, length: 7, vsync: this);
    _pageController = PageController(
      initialPage: 0,
    );
  }

  _searchPressed() {
    isSearching = !isSearching;
    setState(() {});
  }

  _mainWidgetSwitcher(bool isSearching) {
    Widget getGridView(int indexOfList) {
      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 40),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: CarItemObject.cars[indexOfList].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 20 / 30),
        itemBuilder: (BuildContext context, int index) => GridTile(
          footer: GridTileBar(
              title: Text(CarItemObject.cars[indexOfList][index].carName,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: FloatingActionButton(
                  heroTag: CarItemObject.cars[indexOfList][index].carName + index.toString(),
                  elevation: 0,
                  mini: true,
                  backgroundColor: const Color(0xFF1B3DC4),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () {
                    CarItemObject.basketItems
                        .add({"car": CarItemObject.cars[indexOfList][index], "qty": 1});
                  },
                  child: const Icon(Icons.add_shopping_cart, color: Colors.white))),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  FadeRoute(
                      page: CarDetailScreen(
                    car: CarItemObject.cars[indexOfList][index],
                  )));
            },
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, -1), color: Colors.grey.shade300, blurRadius: 5)
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
                      image: AssetImage(CarItemObject.cars[indexOfList][index].imageName),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    // ignore: iterable_contains_unrelated_type
                    child: InkWell(
                      child:
                          CarItemObject.favorites.contains(CarItemObject.cars[indexOfList][index])
                              ? const Material(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(Icons.favorite, size: 25, color: Color(0xFF1B3DC4)),
                                  ),
                                )
                              : const Material(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(Icons.favorite_border_outlined,
                                        size: 25, color: Colors.black),
                                  )),
                      onTap: () {
                        if (CarItemObject.favorites
                            .contains(CarItemObject.cars[indexOfList][index])) {
                          setState(() {
                            CarItemObject.favorites.remove(CarItemObject.cars[indexOfList][index]);
                          });
                        } else {
                          setState(() {
                            CarItemObject.favorites.add(CarItemObject.cars[indexOfList][index]);
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
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(CarItemObject.cars[indexOfList][index].carPrice,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (!isSearching) {
      return ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Container(
            width: 350,
            height: 180,
            decoration: const BoxDecoration(
                color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: CarouselSlider(
              items: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/cars/sedan/1.png"), fit: BoxFit.contain),
                        gradient: LinearGradient(colors: [Color(0xFFEFF3F8), Colors.grey]),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFEFF3F8), Colors.grey]),
                        image: DecorationImage(
                          image: AssetImage("assets/cars/coupe/1.png"),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFEFF3F8), Colors.grey]),
                        image: DecorationImage(
                            image: AssetImage("assets/cars/mpv/1.png"), fit: BoxFit.contain),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFEFF3F8), Colors.grey]),
                        image: DecorationImage(
                            image: AssetImage("assets/cars/crossover/1.png"), fit: BoxFit.contain),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFEFF3F8), Colors.grey]),
                        image: DecorationImage(
                            image: AssetImage("assets/cars/suv/1.png"), fit: BoxFit.contain),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ],
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                onPageChanged: (index, _) {
                  setState(() {
                    _selecTedIndex = index;
                    tabController.index = index;
                  });
                },
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                disableCenter: true,
                pageSnapping: true,
                autoPlay: true,
                //autoPlayInterval: const Duration(seconds: 120),
                autoPlayCurve: Curves.decelerate,
                enlargeCenterPage: true,
                viewportFraction: 1,

                pauseAutoPlayInFiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 300),
                //aspectRatio: 40 / 10,
                initialPage: 2,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TabPageSelector(
              selectedColor: const Color(0xFF1B3DC4),
              controller: tabController,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(25.0),
            child: const Text(
              "Best cars",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          TabBar(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            indicator: BoxDecoration(
              color: const Color(0xFF1B3DC4),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, -1),
                    blurRadius: 10,
                    color: const Color(0xFF1B3DC4).withOpacity(0.2))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            physics: const BouncingScrollPhysics(),
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black.withOpacity(0.3),
            labelPadding: const EdgeInsets.symmetric(horizontal: 35),
            isScrollable: true,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  "Sedan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Tab(
                child: Text(
                  "Hatchback",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Tab(
                child: Text(
                  "MPV",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Tab(
                child: Text(
                  "SUV",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Tab(
                child: Text(
                  "Crossover",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Tab(
                child: Text(
                  "Coupe",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Tab(
                child: Text(
                  "Convertible",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: [
                //Sedan
                getGridView(0),
                //Hatchback
                getGridView(1),
                //MPV
                getGridView(2),
                //SUV
                getGridView(3),
                //Crossover
                getGridView(4),
                //Coupe
                getGridView(5),
                //Convertible
                getGridView(6),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    style: const TextStyle(fontFamily: descFont, fontSize: 18),
                    onSubmitted: (String text) {
                      if (text.isEmpty) {
                        _searchPressed();
                      }
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: BackButton(
                          color: Colors.black,
                          onPressed: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => MyHomePage(title: ""))),
                        ),
                        border: InputBorder.none,
                        hintText: 'Look for cars',
                        hintStyle: const TextStyle(fontFamily: descFont, fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () => _searchPressed())),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CarDetailScreen(car: CarItemObject.cars[0][selectedPage])));
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: Text("BMW 2021", style: TextStyle(fontFamily: titleFont, fontSize: 20))),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CarDetailScreen(car: CarItemObject.cars[0][selectedPage])));
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: Text("Mercedes Benz", style: TextStyle(fontSize: 20))),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CarDetailScreen(car: CarItemObject.cars[0][selectedPage])));
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: Text("Highlander 2019", style: TextStyle(fontSize: 20))),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      AnimatedSwitcher(
          duration: const Duration(milliseconds: 300), child: _mainWidgetSwitcher(isSearching)),
      const CategoryPage(),
      FavoriteScreen(),
      const CartPage(),
      SettingsScreen()
    ];
    return DefaultTabController(
      length: _tabController.length,
      child: Scaffold(
        appBar: _appBar(context),
        backgroundColor: const Color(0xFFEFF3F8),
        key: _scaffoldKey,
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _navbarIndex = value;
              });
            },
            children: children2), // This
        drawer: _drawer(context) // trailing comma makes auto-formatting nicer for build methods.
        ,
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      elevation: 10,
      currentIndex: _navbarIndex,
      onTap: (value) {
        setState(() {
          _navbarIndex = value;
          _pageController.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
        });
      },
      type: BottomNavigationBarType.fixed,
      //fixedColor: Color(0xFF1B3DC4),
      backgroundColor: const Color(0xFF1B3DC4),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      items: [
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.home),
          label: "home".tr,
        ),
        BottomNavigationBarItem(icon: Icon(IconlyBroken.category), label: "category".tr),
        BottomNavigationBarItem(icon: Icon(IconlyBroken.heart), label: "favorite".tr),
        BottomNavigationBarItem(icon: Icon(IconlyBroken.bag), label: "cart".tr),
        BottomNavigationBarItem(icon: Icon(IconlyBroken.profile), label: "profil".tr),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            statusBarColor: Color(0xFF1B3DC4) //Color(0xFF344955),
            ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  icon: const Icon(
                    IconlyBroken.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      showSearch(context: context, delegate: SearchScreen()).then((value) {
                        if (value != null) {
                          return Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CarDetailScreen(car: value)));
                        } else {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                        title: '',
                                      )));
                        }
                      })))
        ],
        backgroundColor: const Color(0xFF1B3DC4),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: const ImageIcon(
            AssetImage("assets/icons/hamburger.png"),
            color: Colors.white,
          ),
        ));
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Image.asset('assets/icons/logo.jpg')),
          ListTile(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingsScreen())),
            leading: const Icon(IconlyBroken.profile, color: Color(0xFF1B3DC4), size: 30),
            title: Text("profil".tr,
                style:
                    TextStyle(color: Color(0xFF1B3DC4), fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          ListTile(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())),
            leading: const Icon(IconlyBroken.bag, color: Color(0xFF1B3DC4), size: 30),
            title: Text("cart".tr,
                style:
                    TextStyle(color: Color(0xFF1B3DC4), fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          ListTile(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen())),
            leading: const Icon(IconlyBroken.heart, color: Color(0xFF1B3DC4), size: 30),
            title: Text("favorite".tr,
                style:
                    TextStyle(color: Color(0xFF1B3DC4), fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          ListTile(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
            leading: const Icon(IconlyBroken.logout, color: Color(0xFF1B3DC4), size: 30),
            title: Text("sign".tr,
                style:
                    TextStyle(color: Color(0xFF1B3DC4), fontWeight: FontWeight.w900, fontSize: 20)),
          ),
        ],
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Widget> categories = const [
    Text(
      "Sedan",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Hatchback",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "MPV",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "SUV",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Crossover",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Coupe",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Convertible",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
  ];

  List<Widget> brends = const [
    Text(
      "BMW",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Mercedes",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Toyota",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Hundai",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Porshce",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "MAZDA",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Mitsubishi",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Honda",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Fiat",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
    Text(
      "Audi",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    ),
  ];
  List<String> brendName = const [
    "BMW",
    "Mercedes",
    "Toyota",
    "Hundai",
    "Porshce",
    "MAZDA",
    "Mitsubishi",
    "Honda",
    "Fiat",
    "Audi",
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 0.0,
          bottom: TabBar(
              indicatorColor: const Color(0xFF1B3DC4),
              indicator: BoxDecoration(color: const Color(0xFF1B3DC4)),
              controller: _tabController,
              tabs: [Tab(text: "category".tr), Tab(text: "brend".tr)]),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: [
              SizedBox(
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              primary: const Color(0xFF1B3DC4),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryItems(
                                            categoryIndex: index,
                                            carName: brendName[index],
                                            title: categories[index],
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  categories[index],
                                  const Icon(IconlyBroken.arrowRightCircle,
                                      color: Color(0xFF1B3DC4))
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
              SizedBox(
                child: ListView.builder(
                    itemCount: brends.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              primary: const Color(0xFF1B3DC4),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BrendItems(
                                            carName: brendName[index],
                                            title: brends[index],
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  brends[index],
                                  const Icon(IconlyBroken.arrowRightCircle,
                                      color: Color(0xFF1B3DC4))
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItems extends StatefulWidget {
  final Widget title;
  final int categoryIndex;
  final String? carName;
  const CategoryItems({
    Key? key,
    required this.title,
    required this.categoryIndex,
    this.carName,
  }) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    Widget getGridView(int indexOfList) {
      if (indexOfList > 6) indexOfList = 4;

      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 40),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: CarItemObject.cars[indexOfList].length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 20 / 30),
            itemBuilder: (BuildContext context, int index) => GridTile(
              footer: GridTileBar(
                  title: Text(CarItemObject.cars[indexOfList][index].carName,
                      style: const TextStyle(
                          fontFamily: "Rubik",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  trailing: FloatingActionButton(
                      heroTag: CarItemObject.cars[indexOfList][index].carName + index.toString(),
                      elevation: 0,
                      mini: true,
                      backgroundColor: const Color(0xFF1B3DC4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        CarItemObject.basketItems
                            .add({"car": CarItemObject.cars[indexOfList][index], "qty": 1});
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
                            car: CarItemObject.cars[indexOfList][index],
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
                              image: AssetImage(CarItemObject.cars[indexOfList][index].imageName),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            // ignore: iterable_contains_unrelated_type
                            child: InkWell(
                              child: CarItemObject.favorites
                                      .contains(CarItemObject.cars[indexOfList][index])
                                  ? const Material(
                                      elevation: 5,
                                      color: Colors.white,
                                      shape: CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(Icons.favorite,
                                            size: 25, color: Color(0xFF1B3DC4)),
                                      ),
                                    )
                                  : const Material(
                                      elevation: 5,
                                      color: Colors.white,
                                      shape: CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(Icons.favorite_border_outlined,
                                            size: 25, color: Colors.black),
                                      )),
                              onTap: () {
                                if (CarItemObject.favorites
                                    .contains(CarItemObject.cars[indexOfList][index])) {
                                  setState(() {
                                    CarItemObject.favorites
                                        .remove(CarItemObject.cars[indexOfList][index]);
                                  });
                                } else {
                                  setState(() {
                                    CarItemObject.favorites
                                        .add(CarItemObject.cars[indexOfList][index]);
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
                                  style:
                                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Text(CarItemObject.cars[indexOfList][index].carPrice,
                                    style: const TextStyle(color: Colors.white)),
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
      appBar: AppBar(
        elevation: 0.0,
        title: widget.title,
        backgroundColor: const Color(0xFF1B3DC4),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: getGridView(widget.categoryIndex)),
      ),
    );
  }
}

class BrendItems extends StatefulWidget {
  final Widget title;

  final String? carName;
  const BrendItems({
    Key? key,
    required this.title,
    this.carName,
  }) : super(key: key);

  @override
  State<BrendItems> createState() => _BrendItemsState();
}

class _BrendItemsState extends State<BrendItems> {
  List<CarItemObject> _cars = [];
  @override
  void initState() {
    _cars = CarItemObject.searchCar(widget.carName!);
    super.initState();
  }

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
            itemCount: _cars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 20 / 30),
            itemBuilder: (BuildContext context, int index) => GridTile(
              footer: GridTileBar(
                  title: Text(_cars[index].carName,
                      style: const TextStyle(
                          fontFamily: "Rubik",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  trailing: FloatingActionButton(
                      heroTag: _cars[index].carName + index.toString(),
                      elevation: 0,
                      mini: true,
                      backgroundColor: const Color(0xFF1B3DC4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        CarItemObject.basketItems.add({"car": _cars[index], "qty": 1});
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
                            car: _cars[index],
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
                              image: AssetImage(_cars[index].imageName),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            // ignore: iterable_contains_unrelated_type
                            child: InkWell(
                              child: CarItemObject.favorites.contains(_cars[index])
                                  ? const Material(
                                      elevation: 5,
                                      color: Colors.white,
                                      shape: CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(Icons.favorite,
                                            size: 25, color: Color(0xFF1B3DC4)),
                                      ),
                                    )
                                  : const Material(
                                      elevation: 5,
                                      color: Colors.white,
                                      shape: CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(Icons.favorite_border_outlined,
                                            size: 25, color: Colors.black),
                                      )),
                              onTap: () {
                                if (CarItemObject.favorites.contains(_cars[index])) {
                                  setState(() {
                                    CarItemObject.favorites.remove(_cars[index]);
                                  });
                                } else {
                                  setState(() {
                                    CarItemObject.favorites.add(_cars[index]);
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
                                  style:
                                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Text(_cars[index].carPrice,
                                    style: const TextStyle(color: Colors.white)),
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
      appBar: AppBar(
        elevation: 0.0,
        title: widget.title,
        backgroundColor: const Color(0xFF1B3DC4),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: getGridView()),
      ),
    );
  }
}
