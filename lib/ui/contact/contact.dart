import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class _ContactCategory extends StatelessWidget {
  const _ContactCategory({Key key, this.icon, this.children}) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: themeData.dividerColor))),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 72.0,
                  child: Icon(icon, color: themeData.primaryColor)),
              Expanded(child: Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 1),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines
        .sublist(0, lines.length - 1)
        .map<Widget>((String line) => Text(line))
        .toList();
    columnChildren.add(Text(lines.last, style: themeData.textTheme.caption));

    final List<Widget> rowChildren = <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren))
    ];
    if (icon != null) {
      rowChildren.add(SizedBox(
          width: 72.0,
          child: IconButton(
              icon: Icon(icon),
              color: themeData.primaryColor,
              onPressed: onPressed)));
    }
    return MergeSemantics(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowChildren)),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.dark,
                  child: _ContactCategory(
                    icon: Icons.call,
                    children: <Widget>[
                      _ContactItem(
                        icon: Icons.message,
                        tooltip: 'Call contact',
                        onPressed: () {
                          launch("tel:0769196962");
                        },
                        lines: const <String>[
                          '07 69 19 69 62',
                          'Mobile',
                        ],
                      ),
                      _ContactItem(
                        icon: Icons.message,
                        tooltip: 'Send message',
                        onPressed: () {
                          launch("tel:0473000000");
                        },
                        lines: const <String>[
                          '04 73 00 00 00',
                          'Agence',
                        ],
                      ),
                    ],
                  ),
                ),
                _ContactCategory(
                  icon: Icons.contact_mail,
                  children: <Widget>[
                    _ContactItem(
                      icon: Icons.email,
                      tooltip: 'Send personal e-mail',
                      onPressed: () {
                        launch("mailto:contact@aristys-web.com");
                      },
                      lines: const <String>[
                        'contact@aristys-web.com',
                        'Contact',
                      ],
                    ),
                    _ContactItem(
                      icon: Icons.email,
                      tooltip: 'Send work e-mail',
                      onPressed: () {
                        launch("mailto:projets@aristys-web.com");
                      },
                      lines: const <String>[
                        'projets@aristys-web.com',
                        'Projets',
                      ],
                    ),
                  ],
                ),
                _ContactCategory(
                  icon: Icons.location_on,
                  children: <Widget>[
                    _ContactItem(
                      icon: Icons.map,
                      tooltip: 'Open map',
                      onPressed: () {
                        //todo Open map
                      },
                      lines: const <String>[
                        '10 Allée Evariste Galois',
                        '63000 Clermont-Ferrand',
                        'Agence',
                      ],
                    ),
                  ],
                ),
                _ContactCategory(
                  icon: Icons.schedule,
                  children: <Widget>[
                    _ContactItem(
                      icon: Icons.linear_scale,
                      tooltip: 'Send personal e-mail',
                      onPressed: () {
                        //todo Send email
                      },
                      lines: const <String>[
                        'contact@aristys-web.com',
                        'Horaires',
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
