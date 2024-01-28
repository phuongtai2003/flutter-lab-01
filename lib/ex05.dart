import 'package:flutter/material.dart';

class Exercise05 extends StatelessWidget {
  const Exercise05({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 05',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: false,
      ),
      home: const Exercise05App(),
    );
  }
}

class Exercise05App extends StatefulWidget {
  const Exercise05App({
    super.key,
  });

  @override
  State<Exercise05App> createState() => _Exercise05AppState();
}

class _Exercise05AppState extends State<Exercise05App> {
  final _formKey = GlobalKey<FormState>();
  final List<Text> _messages = [];
  bool isBold = false;
  bool isLarge = false;
  bool isColor = false;
  final messageController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text(
            'User Interaction',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: messageController,
                    focusNode: focusNode,
                    decoration:
                        const InputDecoration(hintText: 'Type a message'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Switch(
                            activeColor: Colors.lightBlue,
                            value: isBold,
                            onChanged: (value) {
                              setState(() {
                                isBold = value;
                              });
                            },
                          ),
                          const Text('Bold'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Switch(
                            activeColor: Colors.lightBlue,
                            value: isColor,
                            onChanged: (value) {
                              setState(() {
                                isColor = value;
                              });
                            },
                          ),
                          const Text('Color'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Switch(
                            activeColor: Colors.lightBlue,
                            value: isLarge,
                            onChanged: (value) {
                              setState(() {
                                isLarge = value;
                              });
                            },
                          ),
                          const Text('Large'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _messages.add(
                          Text(
                            messageController.text,
                            style: TextStyle(
                              fontSize: isLarge ? 24 : 16,
                              fontWeight: isBold ? FontWeight.bold : null,
                              color: isColor ? Colors.lightBlue : null,
                            ),
                          ),
                        );
                        messageController.clear();
                        focusNode.requestFocus();
                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a message'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(
                        50,
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: _messages.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
