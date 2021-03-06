import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
//import 'package:tretror/components/ui/Posts.dart';
import 'package:tretror/components/ui/RetroButton.dart';
import 'package:tretror/components/ui/RetroTab.dart';

class RetroTabView extends StatefulWidget {
  final List<RetroTab> tabs;

  RetroTabView({this.tabs});

  @override
  _RetroTabViewState createState() => _RetroTabViewState();
}

class _RetroTabViewState extends State<RetroTabView> {
  RetroTab selectedTab;

  @override
  void initState() {
    selectedTab = widget.tabs[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: widget.tabs
                  .map(
                    (tab) => Expanded(
                      child: RetroButton(
                        text: tab.tabHeader,
                        isDown: tab == selectedTab,
                        onPressed: () {
                          setState(() {
                            selectedTab = tab;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            TabViewBody(child: selectedTab?.body),
          ],
        ),
      ),
    );
  }
}

class TabViewBody extends StatelessWidget {
  final Widget child;

  TabViewBody({this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Elevation95(
          type: Elevation95Type.down,
          child: child,
        ),
      ),
    );
  }
}
