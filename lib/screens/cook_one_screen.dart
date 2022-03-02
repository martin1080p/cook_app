import 'package:cook_app/dialogs/exit_dialog.dart';
import 'package:cook_app/providers/interval_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CookOne extends StatelessWidget {
  const CookOne({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<IntervalTimer>().pauseTimer();
        showDialog<bool>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => const ExitDialog());
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            automaticallyImplyLeading: false,
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(15),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Image.asset('assets/img/grill.jpg'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 10),
                                const Text(
                                  "Get Grilling!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vestibulum erat nulla, ullamcorper nec, rutrum non, nonummy ac, erat. Aenean fermentum risus id tortor. Pellentesque ipsum.",
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: const <Widget>[
                                    ListTile(
                                      leading: SizedBox(
                                          height: double.infinity,
                                          child: Icon(
                                            Icons.fiber_manual_record,
                                            color: Colors.black,
                                            size: 15,
                                          )),
                                      title: Text(
                                          "Etiam sapien elit, consequat eget tristique non"),
                                    ),
                                    ListTile(
                                      leading: SizedBox(
                                          height: double.infinity,
                                          child: Icon(
                                            Icons.fiber_manual_record,
                                            color: Colors.black,
                                            size: 15,
                                          )),
                                      title: Text(
                                          "Etiam sapien elit, consequat eget tris"),
                                    ),
                                    ListTile(
                                      leading: SizedBox(
                                          height: double.infinity,
                                          child: Icon(
                                            Icons.fiber_manual_record,
                                            color: Colors.black,
                                            size: 15,
                                          )),
                                      title: Text(
                                          "Etiam sapien elit, consequat eget tristique non"),
                                    ),
                                    ListTile(
                                      leading: SizedBox(
                                          height: double.infinity,
                                          child: Icon(
                                            Icons.fiber_manual_record,
                                            color: Colors.black,
                                            size: 15,
                                          )),
                                      title: Text(
                                          "Etiam sapien elit, consequat eget tris"),
                                    ),
                                  ],
                                ),
                                context
                                    .read<IntervalTimer>()
                                    .secondScreen(context)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Opacity(
                        opacity: 0.7,
                        child: CircularPercentIndicator(
                          radius: 35,
                          lineWidth: 6.0,
                          percent:
                              context.watch<IntervalTimer>().interval / 120,
                          center: Text(
                            context.watch<IntervalTimer>().format,
                            style: const TextStyle(fontSize: 18),
                          ),
                          progressColor: context.watch<IntervalTimer>().color,
                        ),
                      )))
            ],
          )),
    );
  }
}
