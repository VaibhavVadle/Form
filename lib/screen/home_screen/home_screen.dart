import 'package:flutter/material.dart';
import 'package:form/core/constants/app_sizes.dart';
import 'package:form/core/constants/app_strings.dart';
import 'package:form/core/constants/app_theme.dart';
import 'package:form/core/extensions/build_context_ex.dart';
import 'package:form/providers/home_provider.dart';
import 'package:form/widgets/app_button.dart';
import 'package:form/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    HomeProvider provider = context.read<HomeProvider>();
    provider.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Socket Demo",
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.s24.sp,
          ),
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          Sizes.s15.w,
          Sizes.s0.w,
          Sizes.s15.w,
          context.bottomViewInsets + Sizes.s15.w,
        ),
        child: AppOutlineButton.icon(
          label: "Send",
          icon: Padding(
            padding: EdgeInsets.only(right: Sizes.s15.w),
            child: const Icon(Icons.send),
          ),
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              provider.addData(controller.text);
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.s16.w,
          vertical: Sizes.s24.h,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.disabled,
                hintText: "Enter some text",
                validator: (value) {
                  if (value!.isEmpty || value == "") {
                    return "Field should not be empty";
                  }
                  return null;
                },
                filled: false,
              ),
              SizedBox(height: Sizes.s10.h),
              Expanded(
                child: Container(
                  width: context.width,
                  height: context.height,
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.s15.h,
                    horizontal: Sizes.s15.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.s15.r),
                    border: Border.all(
                      color: AppThemeData.borderColor,
                      width: Sizes.s1.w,
                    ),
                  ),
                  child: StreamBuilder(
                    stream: provider.stream,
                    initialData: "",
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: context.colorScheme.primary,
                            strokeWidth: Sizes.s1.w,
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Center(
                          child: Text(
                            AppString.noData,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.s16.sp,
                            ),
                          ),
                        );
                      } else if (snapshot.connectionState ==
                              ConnectionState.active &&
                          snapshot.hasData) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.s10.w,
                                  vertical: Sizes.s8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(Sizes.s15.r),
                                    bottomRight: Radius.circular(Sizes.s15.r),
                                    topRight: Radius.circular(Sizes.s15.r),
                                    topLeft: Radius.circular(Sizes.s0.r),
                                  ),
                                ),
                                child: Text(
                                  snapshot.data,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Sizes.s16.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          AppString.noData,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.s16.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
