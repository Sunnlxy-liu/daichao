import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:daichao/widgets/page_loading_wgt.dart';
import 'package:daichao/widgets/page_net_error_wgt.dart';
import 'package:daichao/widgets/page_no_data_wgt.dart';
import 'package:daichao/widgets/page_server_error_wgt.dart';
import 'package:oktoast/oktoast.dart';

class BlocConsumerWgt<B extends BaseBloc> extends StatelessWidget {
  B bloc;
  final BlocWidgetBuilder<BaseState> builder;
  final BlocWidgetListener<BaseState> listener;
  final BlocBuilderCondition<BaseState> buildWhen;
  final BlocListenerCondition<BaseState> listenWhen;
  final List<Type> listenIf;
  final List<Type> buildIf;

  ToastFuture future;

  BlocConsumerWgt({
    this.bloc,
    this.builder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    this.listenIf,
    this.buildIf,
  }) {
    listenIf?.addAll([
      LoadingToastState,
    ]);
    buildIf?.addAll([LoadingState, NoDataState, NetErrorState, ServerErrorState]);
  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      bloc = BlocProvider.of<B>(context);
    }
    return BlocConsumer<B, BaseState>(
      bloc: bloc,
      listenWhen: (oldState, newState) {
        if (listenWhen != null) {
          return listenWhen(oldState, newState);
        }
        if (listenIf != null) {
          return listenIf.any((value) => value == newState.runtimeType);
        }
        return true;
      },
      listener: (context, state) {
        // 如果LoadingToast在显示则先关闭
        if (future != null) {
          future.dismiss();
          future = null;
        }
        if (state is LoadingToastState) {
          // 显示加载中弹窗
          future = ToastUtils.showLoadingToast();
        }
        listener?.call(context, state);
      },
      buildWhen: (oldState, newState) {
        if (buildWhen != null) {
          return buildWhen(oldState, newState);
        }
        if (buildIf != null) {
          return buildIf.any((value) => value == newState.runtimeType);
        }
        return true;
      },
      builder: (context, state) {
        /// 加载中效果（页面内）
        if (state is LoadingState) {
          return LoadingWgt();
        }

        /// 暂无数据UI
        if (state is NoDataState) {
          return NoDataWgt(
            msg: state.msg,
            onTap: () {
              bloc?.add(InitGetDataEvent());
            },
          );
        }

        /// 网络异常UI
        if (state is NetErrorState) {
          return NetErrorWgt(
            onTap: () {
              bloc?.add(InitGetDataEvent());
            },
          );
        }

        /// 服务器异常UI（网络正常）
        if (state is ServerErrorState) {
          return ServerErrorWgt(
            onTap: () {
              bloc?.add(InitGetDataEvent());
            },
          );
        }

        return builder(context, state) ?? Container();
      },
    );
  }
}
