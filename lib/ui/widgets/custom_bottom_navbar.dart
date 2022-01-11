part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNavbar(
      {Key? key, this.selectedIndex = -1, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/ic_home' + ((selectedIndex == 0)
                              ? '.png'
                              : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
              width: 32.0,
              height: 32.0,
              margin: const EdgeInsets.symmetric(horizontal: 83.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/ic_order' + ((selectedIndex == 1)
                              ? '.png'
                              : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Container(
              width: 32.0,
              height: 32.0,
              
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/ic_profile' + ((selectedIndex == 2)
                              ? '.png'
                              : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          
        ],
      ),
    );
  }
}