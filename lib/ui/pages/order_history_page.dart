part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.isEmpty) {
          return IllustrationPage(
            title: 'Ouch! Hungry',
            subtitle: 'Seems you like have not\nordered any food yet',
            picturePath: 'assets/love_burger.png',
            buttonOnTap1: () {},
            buttonTitle1: 'Find Foods',
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<TransactionCubit>().getTransactions();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    //// Header
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: defaultMargin),
                      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Orders',
                            style: blackFontStyle1,
                          ),
                          Text(
                            'Wait for the best meal',
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                    //// Body
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabbar(
                            titles: const ['In Progress', 'Past Orders'],
                            selectedIndex: selectedIndex,
                            ontap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Builder(builder: (_) {
                            List<Transaction> transactions =
                                (selectedIndex == 0)
                                    ? state.transaction
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.onDelivery ||
                                            element.status ==
                                                TransactionStatus.pending)
                                        .toList()
                                    : state.transaction
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.delivered ||
                                            element.status ==
                                                TransactionStatus.cancelled)
                                        .toList();

                            return Column(
                              children: transactions
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (e.status ==
                                                TransactionStatus.pending) {
                                              await launch(e.paymentUrl.toString());
                                            }
                                          },
                                          child: OrderListItem(
                                              transaction: e,
                                              itemWidth: listItemWidth),
                                        ),
                                      ))
                                  .toList(),
                            );
                          }),
                          const SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
