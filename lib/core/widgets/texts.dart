import 'package:flutter/widgets.dart';

import '../constants/app_style.dart';

class AppTextH1 extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextH1(String text, {super.key, TextAlign? textAlign, Color? color})
    : _text = text,
      _textAlign = textAlign,
      _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.h1.copyWith(color: _color),
    );
  }
}

class AppTextH2 extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextH2(String text, {super.key, TextAlign? textAlign, Color? color})
    : _text = text,
      _textAlign = textAlign,
      _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.h2.copyWith(color: _color),
    );
  }
}

class AppTextH3 extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextH3(String text, {super.key, TextAlign? textAlign, Color? color})
    : _text = text,
      _textAlign = textAlign,
      _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.h3.copyWith(color: _color),
    );
  }
}

class AppTextH4 extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextH4(String text, {super.key, TextAlign? textAlign, Color? color})
    : _text = text,
      _textAlign = textAlign,
      _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.h4.copyWith(color: _color),
    );
  }
}

class AppTextH5 extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextH5(String text, {super.key, TextAlign? textAlign, Color? color})
    : _text = text,
      _textAlign = textAlign,
      _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.h5.copyWith(color: _color),
    );
  }
}

class AppTextH6 extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextH6(String text, {super.key, TextAlign? textAlign, Color? color})
    : _text = text,
      _textAlign = textAlign,
      _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.h6.copyWith(color: _color),
    );
  }
}

class AppTextBody extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final Color? _color;

  const AppTextBody(
    String text, {
    super.key,
    TextAlign? textAlign,
    Color? color,
  }) : _text = text,
       _textAlign = textAlign,
       _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: AppStyle.body.copyWith(color: _color),
    );
  }
}
