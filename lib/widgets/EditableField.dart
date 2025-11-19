import 'package:flutter/material.dart';

class EditableField extends StatefulWidget {
  final String label;
  final String value;
  final Function(String) onSave;

  const EditableField({
    super.key,
    required this.label,
    required this.value,
    required this.onSave,
  });

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  bool isEditing = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              isEditing
                  ? SizedBox(
                      width: 180,
                      child: TextField(
                        controller: controller,
                        autofocus: true,
                        onSubmitted: (val) {
                          setState(() {
                            widget.onSave(val);
                            isEditing = false;
                          });
                        },
                      ),
                    )
                  : Text(
                      controller.text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0001FC),
                      ),
                    ),
            ],
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                if (isEditing) {
                  widget.onSave(controller.text);
                }
                isEditing = !isEditing;
              });
            },
            child: Text(
              isEditing ? "Save" : "Change",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA7A9BE),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
