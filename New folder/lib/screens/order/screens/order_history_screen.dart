import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/order_model.dart';
import '../provider/order_controller.dart';
import 'widgets/item_oder_widget.dart';

class OrderHistory extends ConsumerStatefulWidget {

  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistory createState() => _OrderHistory();

}
class _OrderHistory extends ConsumerState<OrderHistory> with TickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    final _listOderStatusNew = ref.watch(OrderController.futureOrderProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        leadingWidth: 180,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 20,),
          label: const Text('Lịch sử đơn hàng',style: TextStyle(fontSize: 18, color: Colors.black),),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _listOderStatusNew.when(
          error: (err, stack) => Text('Error: $err'),
          data: (List<OrderModel>? data) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return  OrderWidget(item: data[index]);
                });
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}