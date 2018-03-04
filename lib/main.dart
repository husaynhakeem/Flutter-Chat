import 'package:flutter/material.dart';

void main() => runApp(new ChatApp());

const String _name = "Husayn";

class ChatApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Flutter Chat",
        home: new ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new ChatScreenState();
}

class ChatScreenState extends State {

  final _messages = <ChatMessage>[];
  final _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Flutter chat")
        ),
        body: new Column(
            children: <Widget>[
              new Flexible(
                  child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length
                  )
              ),
              new Divider(height: 1.0),
              new Container(
                  decoration: new BoxDecoration(
                      color: Theme
                          .of(context)
                          .cardColor
                  ),
                  child: _buildTextComposer()
              )
            ]
        )
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme
            .of(context)
            .accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
                children: <Widget>[
                  new Flexible(
                      child: new TextField(
                          controller: _textEditingController,
                          onSubmitted: _handleSubmitted,
                          decoration: new InputDecoration.collapsed(
                              hintText: "Send a message")
                      )
                  ),
                  new Container(
                      child: new IconButton(
                          icon: new Icon(Icons.send),
                          onPressed: () =>
                              _handleSubmitted(_textEditingController.text)
                      )
                  )
                ]
            )
        )
    );
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() => _messages.insert(0, new ChatMessage(text: text,)));
  }
}

class ChatMessage extends StatelessWidget {

  ChatMessage({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: new CircleAvatar(child: new Text(_name[0]),)
              ),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_name),
                    new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: new Text(text)
                    )
                  ]
              )
            ]
        )
    );
  }
}