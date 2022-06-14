import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: linearGradient2,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cubit.isDark? darkColor: Colors.white,
                      ),
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          prefixIcon: Icon(
                            IconBroken.Search,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),

                    )
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
