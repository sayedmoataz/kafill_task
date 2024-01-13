import 'package:flutter/material.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';

class SkillsTag extends StatelessWidget {
  var model;
  SkillsTag({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Tags(
      key: _tagStateKey,
      textField: TagsTextField(
        textStyle: const TextStyle(fontSize: 14),
        constraintSuggestion: true, suggestions: [],
        //width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 10),
        onSubmitted: (String str) {
          // Add item to the data source.
        },
      ),
      itemCount: model.length, // required
      itemBuilder: (int index) {
        final item = model[index];

        return ItemTags(
          // Each ItemTags must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(index.toString()),
          index: index, // required
          title: item.label,
          active: true,
          customData: item.label,
          textStyle: const TextStyle(
            fontSize: 14,
          ),
          combine: ItemTagsCombine.withTextBefore,

          icon: ItemTagsIcon(
            icon: Icons.add,
          ), // OR null,
          removeButton: ItemTagsRemoveButton(
            onRemoved: () {
              //required
              return true;
            },
          ), // OR null,
          onPressed: (item) => print(item),
          onLongPressed: (item) => print(item),
        );
      },
    );
  }
}

final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
// Allows you to get a list of all the ItemTags
_getAllItem() {
  // List<Item> lst = _tagStateKey.currentState?.getAllItem;
  // lst.where((a) => a.active == true).forEach((a) => print(a.title));
}
