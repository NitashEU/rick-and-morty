import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/enums.cubit.dart';
import 'package:rick_and_morty/utility/list.utility.dart';

class EnumInput<T, TBloc extends EnumsCubit<TState>, TState> extends StatelessWidget {
  EnumInput({
    this.values,
    this.id,
    this.name,
    this.label,
    this.plural = false,
    this.multi = false,
    this.textMap,
    this.iconMap,
    this.iconSizeMap,
  });

  final String id;
  final String name;
  final String label;
  final List<T> values;
  final bool plural;
  final bool multi;
  final Map<T, String> textMap;
  final Map<T, IconData> iconMap;
  final Map<T, int> iconSizeMap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TBloc, TState>(
      builder: (context, state) {
        var widgets = List.generate(
          values.length + (plural ?? false ? 1 : 0),
          (i) {
            final isAny = i == values.length;
            final value = isAny ? null : values[i];
            final selected = context.watch<TBloc>().enumMatches(isAny ? null : value, id);
            final text = textMap[value];
            return Flexible(
              flex: 1,
              child: InkWell(
                onTap: selected && !multi
                    ? null
                    : () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<TBloc>().enumChanged(isAny ? null : value, id);
                      },
                child: Container(
                  height: 44,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: selected ? Colors.lightBlueAccent.withOpacity(0.8) : Colors.grey.withOpacity(0.4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...(iconMap == null
                          ? []
                          : [
                              Icon(
                                iconMap[value],
                                size: iconSizeMap[value].toDouble(),
                              ),
                              SizedBox(width: 4),
                            ]),
                      FittedBox(
                        child: Text(
                          text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
        var rows = <Widget>[];
        if (label != null) {
          // rows.add(InputLabel(text: label));
        }
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets.joinCustom(SizedBox(width: 12)),
        ));
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        );
      },
    );
  }
}
