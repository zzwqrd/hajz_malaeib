import 'package:flutter/material.dart';

class CustomAutocomplete extends StatefulWidget {
  final String value;
  final String label;
  final IconData? icon;
  final String? headerTitle;
  final bool isRequired;
  final bool isLoading;
  final bool borderless;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSelected;
  final FormFieldValidator<String>? validator;
  final List<String> suggestions;
  final Future<List<String>> Function(String) fetchSuggestions;
  final List<String> Function(String, List<String>) filterSuggestions;

  CustomAutocomplete({
    Key? key,
    required this.value,
    required this.label,
    required this.suggestions,
    this.icon,
    this.headerTitle,
    this.isRequired = false,
    this.isLoading = false,
    this.borderless = true,
    required this.onChanged,
    required this.onSelected,
    this.validator,
    required this.fetchSuggestions,
    required this.filterSuggestions,
  }) : super(key: key);

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredSuggestions = [];
  bool _isFetching = false;
  bool _noSuggestionsFound = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    final input = _controller.text.toLowerCase();
    setState(() {
      if (input.isEmpty) {
        _filteredSuggestions.clear();
        _noSuggestionsFound = false;
      } else {
        _filteredSuggestions =
            widget.filterSuggestions(input, widget.suggestions);
        _fetchBackendSuggestions(input);
        widget.onChanged(_controller.text);
        _noSuggestionsFound = _filteredSuggestions.isEmpty && !_isFetching;
      }
    });
  }

  void _fetchBackendSuggestions(String query) async {
    if (query.isEmpty) return;
    setState(() {
      _isFetching = true;
      _noSuggestionsFound = false;
    });
    final results = await widget.fetchSuggestions(query);
    setState(() {
      _isFetching = false;
      _filteredSuggestions.addAll(results);
      _filteredSuggestions =
          _filteredSuggestions.toSet().toList(); // remove duplicates
      _noSuggestionsFound = _filteredSuggestions.isEmpty;
    });
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _filteredSuggestions.clear();
        _noSuggestionsFound = false;
      });
    }
  }

  void _unfocusField() {
    setState(() {
      _focusNode.unfocus();
      _filteredSuggestions.clear();
      _noSuggestionsFound = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusField,
      child: Column(
        children: <Widget>[
          if (widget.headerTitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.headerTitle!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: widget.label,
              border:
                  widget.borderless ? InputBorder.none : OutlineInputBorder(),
              prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
            ),
            validator: widget.validator,
          ),
          if (_isFetching)
            Center(
              child: CircularProgressIndicator(),
            ),
          if (!_isFetching &&
              _noSuggestionsFound &&
              _controller.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'No suggestions found',
                style: TextStyle(color: Colors.red),
              ),
            ),
          if (_filteredSuggestions.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredSuggestions.length,
                itemBuilder: (context, index) {
                  if (index >= _filteredSuggestions.length) return SizedBox();
                  return ListTile(
                    title: Text(_filteredSuggestions[index],
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      setState(() {
                        _controller.text = _filteredSuggestions[index];
                        _filteredSuggestions.clear();
                        _noSuggestionsFound = false;
                        _focusNode.unfocus();
                        widget.onSelected(_controller.text);
                      });
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
