part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: 'FAFAFC'.toColor(),
          )),
          SafeArea(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            // children: [
              // Center(
              //   child: FoodPage(),
              // ),
            //   Center(child: OrderHistoryPage()),
            //   const Center(
            //     child: Text("Profile"),
            //   ),
            // ],
          )),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: CustomButtomNavBar(
          //     selectedIndex: selectedPage,
          //     onTap: (index) {
          //       setState(() {
          //         selectedPage = index;
          //       });
          //       pageController.jumpToPage(selectedPage);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}