import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final Function(String text) onChanged;
  final List<String>? masks;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final VoidCallback? onTap;
  final bool? enabled;
  final int? maxLines;
  final bool? enableInteractiveSelection;
  final Color? labelColor;
  final bool showShadow;
  final AutovalidateMode? autovalidateMode;

  SearchInputField({
    super.key,
    required this.controller,
    this.masks,
    this.keyboardType,
    this.validator,
    this.hint,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.enabled,
    this.maxLines,
    this.enableInteractiveSelection,
    this.labelColor,
    this.showShadow = true,
    this.autovalidateMode,
    required this.onChanged,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return DecoratedBox(
          decoration: BoxDecoration(),
          child: TextFormField(
            onChanged: (value) => onChanged(value),
            maxLines: 1,
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 14),
            onTap: onTap,
            autovalidateMode:
                autovalidateMode ?? AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            obscureText: obscureTextVNValue,
            inputFormatters: masks != null
                ? [TextInputMask(mask: masks)]
                : null,
            validator: validator,
            enableInteractiveSelection: enableInteractiveSelection,
            decoration: InputDecoration(
              errorMaxLines: 3,
              enabled: true,
              border: _defaultBorder,
              contentPadding: EdgeInsets.fromLTRB(14, 12.5, 14, 12),
              enabledBorder: _defaultBorder,
              focusedBorder: _defaultBorder,
              hintText: "Buscar aluno",
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      constraints: const BoxConstraints(),
                      style: IconButton.styleFrom(
                        foregroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                      ),
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: obscureTextVNValue
                          ? Icon(Icons.visibility_outlined, size: 20)
                          : Icon(Icons.visibility_off_outlined, size: 20),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder get _defaultBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey, width: 1),
  );
}
