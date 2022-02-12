import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/breath_list/views/widgets/breath_list_widget.dart';
import 'package:flutter_demo_app/injection_container.dart';

class BreathHistoryPage extends StatefulWidget {
  const BreathHistoryPage({Key? key}) : super(key: key);

  @override
  _BreathHistoryPageState createState() => _BreathHistoryPageState();
}

class _BreathHistoryPageState extends State<BreathHistoryPage> {
  bool isLoading = false;

  get viewModel => sl<BreathHistoryViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getBreathingHistory();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6572E3),
      appBar: AppBar(
        title: const Text(
          'Breath History',
          style: TextStyle(fontSize: 20),
        ),
        actions: const [Icon(Icons.menu), SizedBox(width: 12)],
        backgroundColor: Colors.transparent,
        toolbarHeight: MediaQuery
            .of(context)
            .size
            .height * 0.1,
        elevation: 0,
      ),
      body: const Center(
        child: BreathListWidget(),
      ),
    );
  }
}
