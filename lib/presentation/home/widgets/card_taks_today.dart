import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/presentation/home/widgets/preview_photo.dart';
import 'package:taks_daily_app/src/models/daily_task.dart';

class CardTaksToday extends StatefulWidget {
  const CardTaksToday({
    required this.progress,
    required this.onAdd,
    required this.onComplete,
    required this.onDelete,
    required this.taks,
    required this.date,
    super.key,
  });
  final double progress;
  final Function() onAdd;
  final Function(int, bool) onComplete;
  final Function(int) onDelete;
  final List<DailyTask> taks;
  final String date;

  @override
  State<CardTaksToday> createState() => _CardTaksTodayState();
}

class _CardTaksTodayState extends State<CardTaksToday> {
  List<DailyTask>? tasksSelected;

  void selectedTaskAgrupate() {
    tasksSelected = widget.taks.where((e) => e.isCompleted).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSy16,
      child: Container(
        padding: padSy16,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  AssetsApp.calendar.path,
                  width: 30,
                  height: 30,
                ),
                space8,
                Expanded(
                  child: Text(
                    widget.date,
                    style: TextStyleApp.h2Bold,
                  ),
                ),
              ],
            ),
            gap16,
            Container(
              padding: padSy8.copyWith(
                left: 0,
                right: 0,
              ),
              decoration: const BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  ExpansionWidget(
                    titleBuilder: (
                      double animationValue,
                      _,
                      bool isExpaned,
                      toogleFunction,
                    ) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          toogleFunction(animated: true);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.gray100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Tareas totales: ${widget.taks.length}',
                                      style: TextStyleApp.body.gray,
                                    ),
                                  ),
                                  Icon(
                                    animationValue == 1
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_rounded,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: widget.taks.length * 35,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: widget.taks.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: padSy16.copyWith(
                                  left: 0,
                                  top: 0,
                                  bottom: 8,
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (widget.taks[index].isCompleted) {
                                          widget.onComplete(
                                            widget.taks[index].id,
                                            false,
                                          );
                                        } else {
                                          widget.onComplete(
                                            widget.taks[index].id,
                                            true,
                                          );
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            widget.taks[index].isCompleted
                                                ? Icons.check_box_rounded
                                                : Icons
                                                    .check_box_outline_blank_rounded,
                                            color:
                                                widget.taks[index].isCompleted
                                                    ? AppColors.green
                                                    : AppColors.gray,
                                            size: 24,
                                          ),
                                          space8,
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (widget.taks[index].image != ''
                                                    ? 0.47
                                                    : 0.6),
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                  widget.taks[index].color,
                                                  radix: 16,
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.taks[index].taskName,
                                                style: TextStyleApp.body,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        widget.onDelete(widget.taks[index].id);
                                      },
                                      child: const Icon(
                                        Icons.delete_forever_rounded,
                                        color: AppColors.red,
                                        size: 24,
                                      ),
                                    ),
                                    if (widget.taks[index].image != '') ...[
                                      space8,
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (context) =>
                                                  PreviewPhoto(
                                                imagePath:
                                                    widget.taks[index].image,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.image_rounded,
                                          color: AppColors.green,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        gap8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ButtonCard(
                                label: 'Agregar',
                                color: AppColors.blue50,
                                onPressed: widget.onAdd,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  gap16,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.gray,
                      ),
                    ),
                    child: LinearProgressIndicator(
                      value: widget.progress / 100,
                      minHeight: 6,
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8),
                      backgroundColor: AppColors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.green,
                      ),
                    ),
                  ),
                  gap4,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${widget.progress.round()}% completado',
                      style: TextStyleApp.caption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
