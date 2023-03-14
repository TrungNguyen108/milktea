import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../provider/filter_provider.dart';

class Filter extends ConsumerWidget {
  Filter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    ref.listen(filterProvider, (previous, next) {
      if(filterState.status == FilterStatus.Success){
        context.push('/filter');
      }
    });
    // final price_start = filterState.price_start;
    // final price_end = filterState.price_end;

    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Text("Khoảng giá", style: TextStyle(color: Colors.black,fontSize: 17),),
          ),
          PriceRange(),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    ref.read(filterProvider.notifier).FilterSubmit();
                    Navigator.of(context).pop();
                  },
                  child: Text("Lọc sản phẩm", style: TextStyle(color: Colors.white,fontSize: 17),),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffFB9116),
                    minimumSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // <-- Radius
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: (){
                  },
                  child: Text("Hủy", style: TextStyle(color: Colors.white,fontSize: 17),),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffFB9116),
                    minimumSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // <-- Radius
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceRange extends ConsumerStatefulWidget {
  const PriceRange({Key? key}) : super(key: key);
  @override
  _PriceRangeState createState() => _PriceRangeState();
}

class _PriceRangeState extends ConsumerState<PriceRange> with TickerProviderStateMixin{
  RangeValues _priceRange = const RangeValues(10, 800);
  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterProvider);
    if(filterState.price.start < filterState.price.end)
      _priceRange = filterState.price;

    return SizedBox(
      height: 50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:[
            RangeSlider(
              values: _priceRange,
              max: 2000,
              min: 10,
              divisions:100,
              labels: RangeLabels(
                  NumberFormat("#,###", "en_US").format((_priceRange.start.round()))+'đ',
                  NumberFormat("#,###", "en_US").format((_priceRange.end.round()))+'đ'
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRange = values;
                  ref.read(filterProvider.notifier).onPriceChange(values);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
