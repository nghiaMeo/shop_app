import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/presentation/auth/bloc/state/age_display_state.dart';

import '../bloc/age_display_cubit.dart';
import '../bloc/age_selection_cubit.dart';

class AgesWidget extends StatelessWidget {
  const AgesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
          builder: (context, state) {
        if (state is AgesLoading) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if (state is AgesLoaded) {
          return _ages(state.ages);
        }
        if (state is AgesLoadFailure) {
          return Container(
            alignment: Alignment.center,
            child: Text(state.message),
          );
        }

        return const SizedBox();
      }),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context
                  .read<AgeSelectionCubit>()
                  .selectAge(ages[index].data()['value']);
            },
            child: Center(
              child: Text(
                ages[index].data()['value'],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
            color: context.isDarkMode
                ? Colors.white.withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            thickness: 1),
        itemCount: ages.length);
  }
}
