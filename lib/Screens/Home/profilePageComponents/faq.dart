import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  static const String id = "faq";

  String dummyData =
      "Et nemo nihil At praesentium ratione est facilis nulla aut necessitatibus ullam aut illum dolorum! Qui cumque numquam ut facere nemo qui debitis voluptatem ut error laborum et modi dolorem. Et cupiditate eligendi et voluptatum galisum aut voluptatem repudiandae quo galisum excepturi non commodi exercitationem? Cum suscipit dignissimos qui suscipit officia et officia temporibus qui totam sapiente aut aliquid corporis id minus illum eum atque voluptatum.";

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xff000162),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2F3FC),
        title: const Text(
          "Frequently Asked Questions",
          style: TextStyle(
            color: Color(0xff000162),
          ),
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
      body: ExpandablePanel(
        header: const Text("Medical Aid related questions: "),
        // tapHeaderToExpand: ,
        collapsed: Text(
          widget.dummyData,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        expanded: Text(
          widget.dummyData,
          softWrap: true,
        ),
      ),
    );
  }
}
