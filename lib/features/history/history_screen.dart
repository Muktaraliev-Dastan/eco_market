import 'package:auto_route/annotations.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/features/basket/widgets/empty_widget.dart';
import 'package:eco_market/features/history/logic/history_bloc.dart';
import 'package:eco_market/features/history/repository/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryBloc historyBloc;

  @override
  void initState() {
    historyBloc = HistoryBloc(HistoryRepository());
    historyBloc.add(GetAllOrders());
    super.initState();
  }

  @override
  void dispose() {
    historyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'История заказов',
          style: AppTexts.s18b,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          bloc: historyBloc,
          builder: (context, state) {
            if (state is HistoryLoadingState) {}
            if (state is HistoryLoadedState) {
              if (state.orders.isNotEmpty) {
                return ListView.separated(
                  itemCount: state.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/order_icon.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Заказ-${state.orders[index].orderNumber}",
                                  style: AppTexts.s16b,
                                ),
                                Text(
                                  "${state.orders[index].createdAt}",
                                  style: AppTexts.s14grey,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${double.parse(state.orders[index].totalAmount!).round()}с',
                            style: AppTexts.s16g,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                );
              } else {
                return const EmptyWidget();
              }
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
