import 'package:flutter/material.dart';

class FormDesigner extends StatefulWidget {
  @override
  _FormDesignerState createState() => _FormDesignerState();
}

class _FormDesignerState extends State<FormDesigner> {
  List<Widget> _formWidgets = [];
  Widget _selectedWidget=Container();
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("任意表单设计器示例"),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                ListTile(
                  title: Text("文本框"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = TextField(
                        decoration: InputDecoration(
                          labelText: "文本框",
                        ),
                        controller: _textEditingController,
                      );
                    });
                  },
                ),
                ListTile(
                  title: Text("按钮"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = ElevatedButton(
                        onPressed: () {},
                        child: Text("按钮"),
                      );
                    });
                  },
                ),
                ListTile(
                  title: Text("单选框"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = Column(
                        children: [
                          RadioListTile(
                            title: Text("选项1"),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                          RadioListTile(
                            title: Text("选项2"),
                            value: 2,
                            groupValue: 2,
                            onChanged: (value) {},
                          ),
                        ],
                      );
                    });
                  },
                ),
                ListTile(
                  title: Text("下拉列表"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text("选项1"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("选项2"),
                            value: 2,
                          ),
                        ],
                        onChanged: (value) {},
                      );
                    });
                  },
                ),
                ListTile(
                  title: Text("日期选择器"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = ElevatedButton(
                        onPressed: () async {
                          final DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null) {}
                        },
                        child: Text("选择日期"),
                      );
                    });
                  },
                ),
                ListTile(
                  title: Text("开关"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = Switch(
                        value: false,
                        onChanged: (value) {},
                      );
                    });
                  },
                ),
                ListTile(
                  title: Text("滑块"),
                  onTap: () {
                    setState(() {
                      _selectedWidget = Slider(
                        value: 0,
                        min: 0,
                        max: 100,
                        onChanged: (value) {},
                      );
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _formWidgets.add(_selectedWidget);
                      });
                    },
                    child: Container(
                      color: Colors.grey[300],
                      child: Stack(
                        children: [
                          ..._formWidgets,
                          if (_selectedWidget != null) _selectedWidget,
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_selectedWidget != null) ...[
                        Text(
                          "组件属性",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        if (_selectedWidget is TextField) ...[
                          Text("文本框属性"),
                          SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "标签",
                            ),
                            controller: _textEditingController,
                          ),
                        ],
                        if (_selectedWidget is ElevatedButton) ...[
                          Text("按钮属性"),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("按钮"),
                          ),
                        ],
                      ],
                    ],
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
