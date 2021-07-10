import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/pages/navigation_drawer.dart';
import 'package:news_app/app/theme/theme_lib.dart';

class EmptyDataPageView extends StatelessWidget {
  final EmptyDataType? dataType;
  final String? title;

  const EmptyDataPageView(this.title, this.dataType, {Key? key})
      : super(key: key);
  static const String routeName = '/emptyDataPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: Center(
        child: Text(dataType?.message ?? '',
            style: AppTheme.CurrentTheme(context).textTheme.bodyText1!.copyWith(
                  fontSize: 28.0,
                ),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class EmptyDataType extends Equatable {
  final String message;

  const EmptyDataType._(this.message);

  static const EmptyDataType ServiceUnavilable =
      EmptyDataType._(AppText.serviceUnavilable);
  static const EmptyDataType NoItemsAvilable =
      EmptyDataType._(AppText.noItemsAvilable);

  @override
  List<Object?> get props => [message];
}
