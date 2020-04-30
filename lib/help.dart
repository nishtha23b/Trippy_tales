import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Contact Us',
            style: TextStyle(color: Color(0xFF000000)),),
          backgroundColor: Colors.amber[700],
          centerTitle: true,
          leading:IconButton(icon:Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: ()=>Navigator.pop(context,false)),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry('What are the most surreal places to visit?',
      <Entry>[
        Entry('You can find all the palaces in our application that you may like to visit. We have variety of options in here!'),
      ]
  ),
  Entry('How can I edit my profile?',
      <Entry>[
        Entry('You can edit your profile by visting the menu bar in the left handed upper corner in the home screen and choosing the edit profile option.'),
      ]
  ),
  Entry('After I make my schedule, what do I need to do?',
      <Entry>[
        Entry('Nothing – except wait for notifications to notify your time and date and just be ready on time'),
      ]
  ),
  Entry('Can I delete my schedule at any time?',
      <Entry>[
        Entry('Yes. You can delete your schedule or edit your schedule any time you want.'),
      ]
  ),
  Entry('How much time before I can plan my schedule before leaving for the holiday ?',
      <Entry>[
        Entry('You can plan your schedule even before a month of leaving for holiday.'),
      ]
  ),
  Entry('Is there any registration fee?',
    <Entry>[
      Entry('No, our services are absolutely free.'),
    ],
  ),
  Entry('Who should I get in touch with in case of any issues/clarifications?',
    <Entry>[
      Entry('You can contact our coustmer support team or can drop an email on trippytales@gmail.com.'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}