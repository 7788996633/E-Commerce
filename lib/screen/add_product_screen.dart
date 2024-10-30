import 'package:flutter/material.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/screen/nproducts_screen.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _priceFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();
  final _desFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(_updateImageUrl);
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void myDispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _desFocusNode.dispose();
    _quantityFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }

    _form.currentState!.save();
    Provider.of<Products>(context, listen: false).addPro(
        _titleController.text,
        double.parse(_priceController.text),
        int.parse(_quantityController.text),
        "desc",
        "https://th.bing.com/th/id/OIP.lqjcXopokM6uqMaN2e7O5wHaEK?pid=ImgDet&rs=1");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewProductsScreen(),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 232, 241),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
 Provider.of<Products>(context, listen: false).addPro(
        _titleController.text,
        double.parse(_priceController.text),
        int.parse(_quantityController.text),
        "desc",
        _imageUrlController.text);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewProductsScreen(),
    ),);            },
            icon: const Icon(Icons.save),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 63, 124, 155),
        title: const Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter title please";
                  }
                },
                decoration: const InputDecoration(labelText: "Title"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              TextFormField(
                controller: _priceController,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else if (double.tryParse(value) == 0
                      //  ||
                      //     double.parse(value) < 0)
                      ) {
                    return "Invalid price";
                  } else {
                    return "Enter price please";
                  }
                },
                decoration: const InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_quantityFocusNode);
                },
              ),
              TextFormField(
                controller: _quantityController,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else if (int.tryParse(value) == 0) {
                    return "Invalid quantity";
                  } else {
                    return "Enter quantity please";
                  }
                },
                decoration: const InputDecoration(labelText: "Quantity"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _quantityFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_desFocusNode);
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty && value.length > 10) {
                    return null;
                  } else if (value.isNotEmpty && value.length < 10) {
                    return "short description";
                  } else if (value.isEmpty) {
                    return "Enter description please";
                  }
                  return null;
                },
                focusNode: _desFocusNode,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: "Description"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFocusNode);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Text("Enter a URL")
                        : FittedBox(
                            child: Image(
                              image: AssetImage(
                                " assets/${_imageUrlController.text}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _imageUrlController,
                      validator: (value) {
                        if (value!.isNotEmpty && value.startsWith("http") ||
                            value.isNotEmpty && value.startsWith("https")) {
                          return null;
                        } else if (value.isNotEmpty &&
                                !value.startsWith("http") ||
                            value.isNotEmpty && !value.startsWith("https")) {
                          return "Enter valid image url please";
                        } else if (value.isEmpty) {
                          return "Enter image url please";
                        }
                        return null;
                      },
                      maxLines: 3,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(labelText: "Image"),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      focusNode: _imageUrlFocusNode,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
