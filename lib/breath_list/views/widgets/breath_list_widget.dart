import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/src/provider.dart';

import 'breath_history_card.dart';

class BreathListWidget extends StatelessWidget {
  const BreathListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BreathHistoryViewModel breathHistoryViewModel = context.watch<
        BreathHistoryViewModel>();
    return FutureBuilder(future: breathHistoryViewModel.getBreathingHistory(),
        builder: (context, snapshot) {
          if(breathHistoryViewModel.loading){
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          }else{
            return StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8),
              itemCount: breathHistoryViewModel.breathHistoryModelList.length,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(4),
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                final breathHistoryItem =
                breathHistoryViewModel.breathHistoryModelList[index];

                return GestureDetector(
                  child: BreathCardWidget(
                    index: index,
                    breatheHistory: breathHistoryItem,
                  ),
                );
              },
            );
          }
        }
    );
  }
}