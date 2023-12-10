; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }

@TOKEN_NUM = global i32 0
@TOKEN_OTHER = global i32 1
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @before_main, ptr null }]
@llvm.global_dtors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @after_main, ptr null }]
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_sysy_us = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_s = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_m = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_h = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_idx = dso_local global i32 0, align 4
@stderr = external global ptr, align 8
@.str.5 = private unnamed_addr constant [35 x i8] c"Timer@%04d-%04d: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_l1 = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_l2 = dso_local global [1024 x i32] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [25 x i8] c"TOTAL: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_start = dso_local global %struct.timeval zeroinitializer, align 8
@_sysy_end = dso_local global %struct.timeval zeroinitializer, align 8

define i32 @next_char() {
next_char:
  %r100 = call i32 @getch()
  store i32 %r100, ptr @last_char, align 4
  %r101 = load i32, ptr @last_char, align 4
  ret i32 %r101
}

define i32 @is_space(i32 %r102) {
is_space:
  %r293 = add i32 0, 0
  %r294 = add i32 %r102, 0
  br label %bb1

bb1:                                              ; preds = %is_space
  %r105 = icmp eq i32 %r294, 32
  br i1 %r105, label %bb2, label %bb5

bb5:                                              ; preds = %bb1
  %r107 = icmp eq i32 %r294, 10
  br i1 %r107, label %bb2, label %bb3

bb2:                                              ; preds = %bb5, %bb1
  ret i32 1

bb3:                                              ; preds = %bb5
  ret i32 0
}

define i32 @is_num(i32 %r108) {
is_num:
  %r296 = add i32 0, 0
  %r297 = add i32 %r108, 0
  br label %bb8

bb8:                                              ; preds = %is_num
  %r111 = icmp sge i32 %r297, 48
  br i1 %r111, label %bb12, label %bb10

bb12:                                             ; preds = %bb8
  %r113 = icmp sle i32 %r297, 57
  br i1 %r113, label %bb9, label %bb10

bb9:                                              ; preds = %bb12
  ret i32 1

bb10:                                             ; preds = %bb12, %bb8
  ret i32 0
}

define i32 @next_token() {
next_token:
  br label %bb15

bb15:                                             ; preds = %bb16, %next_token
  %r115 = load i32, ptr @last_char, align 4
  %r114 = call i32 @is_space(i32 %r115)
  %r116 = icmp ne i32 %r114, 0
  br i1 %r116, label %bb16, label %bb17

bb16:                                             ; preds = %bb15
  call void @next_char()
  br label %bb15

bb17:                                             ; preds = %bb15
  %r118 = load i32, ptr @last_char, align 4
  %r117 = call i32 @is_num(i32 %r118)
  %r119 = icmp ne i32 %r117, 0
  br i1 %r119, label %bb18, label %bb19

bb18:                                             ; preds = %bb17
  %r120 = load i32, ptr @last_char, align 4
  %r121 = sub i32 %r120, 48
  store i32 %r121, ptr @num, align 4
  br label %bb21

bb21:                                             ; preds = %bb22, %bb18
  %r123 = call i32 @next_char()
  %r122 = call i32 @is_num(i32 %r123)
  %r124 = icmp ne i32 %r122, 0
  br i1 %r124, label %bb22, label %bb23

bb22:                                             ; preds = %bb21
  %r125 = load i32, ptr @num, align 4
  %r126 = mul i32 %r125, 10
  %r127 = load i32, ptr @last_char, align 4
  %r128 = add i32 %r126, %r127
  %r129 = sub i32 %r128, 48
  store i32 %r129, ptr @num, align 4
  br label %bb21

bb23:                                             ; preds = %bb21
  %r130 = load i32, ptr @TOKEN_NUM, align 4
  store i32 %r130, ptr @cur_token, align 4
  br label %bb20

bb19:                                             ; preds = %bb17
  %r131 = load i32, ptr @last_char, align 4
  store i32 %r131, ptr @other, align 4
  call void @next_char()
  %r132 = load i32, ptr @TOKEN_OTHER, align 4
  store i32 %r132, ptr @cur_token, align 4
  br label %bb20

bb20:                                             ; preds = %bb19, %bb23
  %r133 = load i32, ptr @cur_token, align 4
  ret i32 %r133
}

define i32 @panic() {
panic:
  call void @putch(i32 112)
  call void @putch(i32 97)
  call void @putch(i32 110)
  call void @putch(i32 105)
  call void @putch(i32 99)
  call void @putch(i32 33)
  call void @putch(i32 10)
  %r134 = sub i32 0, 1
  ret i32 %r134
}

define i32 @get_op_prec(i32 %r135) {
get_op_prec:
  %r299 = add i32 0, 0
  %r300 = add i32 %r135, 0
  br label %bb24

bb24:                                             ; preds = %get_op_prec
  %r138 = icmp eq i32 %r300, 43
  br i1 %r138, label %bb25, label %bb28

bb28:                                             ; preds = %bb24
  %r140 = icmp eq i32 %r300, 45
  br i1 %r140, label %bb25, label %bb26

bb25:                                             ; preds = %bb28, %bb24
  ret i32 10

bb26:                                             ; preds = %bb28
  br label %bb27

bb27:                                             ; preds = %bb26
  %r142 = icmp eq i32 %r300, 42
  br i1 %r142, label %bb29, label %bb33

bb33:                                             ; preds = %bb27
  %r144 = icmp eq i32 %r300, 47
  br i1 %r144, label %bb29, label %bb32

bb32:                                             ; preds = %bb33
  %r146 = icmp eq i32 %r300, 37
  br i1 %r146, label %bb29, label %bb30

bb29:                                             ; preds = %bb32, %bb33, %bb27
  ret i32 20

bb30:                                             ; preds = %bb32
  br label %bb31

bb31:                                             ; preds = %bb30
  ret i32 0
}

define void @stack_push(ptr %r147, i32 %r148) {
stack_push:
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 %r148, 0
  br label %bb36

bb36:                                             ; preds = %stack_push
  %r151 = getelementptr i32, ptr %r147, i32 0
  %r150 = load i32, ptr %r151, align 4
  %r152 = add i32 %r150, 1
  %r153 = getelementptr i32, ptr %r147, i32 0
  store i32 %r152, ptr %r153, align 4
  %r156 = getelementptr i32, ptr %r147, i32 0
  %r155 = load i32, ptr %r156, align 4
  %r306 = add i32 %r155, 0
  %r159 = getelementptr i32, ptr %r147, i32 %r306
  store i32 %r305, ptr %r159, align 4
  ret void
}

define i32 @stack_pop(ptr %r160) {
stack_pop:
  %r309 = add i32 0, 0
  %r310 = add i32 0, 0
  %r163 = getelementptr i32, ptr %r160, i32 0
  %r162 = load i32, ptr %r163, align 4
  %r311 = add i32 %r162, 0
  %r167 = getelementptr i32, ptr %r160, i32 %r311
  %r166 = load i32, ptr %r167, align 4
  %r312 = add i32 %r166, 0
  %r169 = getelementptr i32, ptr %r160, i32 0
  %r168 = load i32, ptr %r169, align 4
  %r170 = sub i32 %r168, 1
  %r171 = getelementptr i32, ptr %r160, i32 0
  store i32 %r170, ptr %r171, align 4
  ret i32 %r312
}

define i32 @stack_peek(ptr %r173) {
stack_peek:
  %r314 = add i32 0, 0
  %r176 = getelementptr i32, ptr %r173, i32 0
  %r175 = load i32, ptr %r176, align 4
  %r315 = add i32 %r175, 0
  %r179 = getelementptr i32, ptr %r173, i32 %r315
  %r178 = load i32, ptr %r179, align 4
  ret i32 %r178
}

define i32 @stack_size(ptr %r180) {
stack_size:
  %r182 = getelementptr i32, ptr %r180, i32 0
  %r181 = load i32, ptr %r182, align 4
  ret i32 %r181
}

define i32 @mod(i32 %r183, i32 %r185) {
mod:
  %r318 = add i32 0, 0
  %r319 = add i32 0, 0
  %r320 = add i32 %r183, 0
  %r321 = add i32 %r185, 0
  br label %bb37

bb37:                                             ; preds = %mod
  %r190 = sdiv i32 %r320, %r321
  %r192 = mul i32 %r190, %r321
  %r193 = sub i32 %r320, %r192
  ret i32 %r193
}

define i32 @eval_op(i32 %r194, i32 %r196, i32 %r198) {
eval_op:
  %r325 = add i32 0, 0
  %r326 = add i32 0, 0
  %r327 = add i32 0, 0
  %r328 = add i32 %r194, 0
  %r329 = add i32 %r196, 0
  %r330 = add i32 %r198, 0
  br label %bb38

bb38:                                             ; preds = %eval_op
  %r201 = icmp eq i32 %r328, 43
  br i1 %r201, label %bb39, label %bb40

bb39:                                             ; preds = %bb38
  %r204 = add i32 %r329, %r330
  ret i32 %r204

bb40:                                             ; preds = %bb38
  br label %bb41

bb41:                                             ; preds = %bb40
  %r206 = icmp eq i32 %r328, 45
  br i1 %r206, label %bb42, label %bb43

bb42:                                             ; preds = %bb41
  %r209 = sub i32 %r329, %r330
  ret i32 %r209

bb43:                                             ; preds = %bb41
  br label %bb44

bb44:                                             ; preds = %bb43
  %r211 = icmp eq i32 %r328, 42
  br i1 %r211, label %bb45, label %bb46

bb45:                                             ; preds = %bb44
  %r214 = mul i32 %r329, %r330
  ret i32 %r214

bb46:                                             ; preds = %bb44
  br label %bb47

bb47:                                             ; preds = %bb46
  %r216 = icmp eq i32 %r328, 47
  br i1 %r216, label %bb48, label %bb49

bb48:                                             ; preds = %bb47
  %r219 = sdiv i32 %r329, %r330
  ret i32 %r219

bb49:                                             ; preds = %bb47
  br label %bb50

bb50:                                             ; preds = %bb49
  %r221 = icmp eq i32 %r328, 37
  br i1 %r221, label %bb51, label %bb52

bb51:                                             ; preds = %bb50
  %r222 = call i32 @mod(i32 %r329, i32 %r330)
  ret i32 %r222

bb52:                                             ; preds = %bb50
  br label %bb53

bb53:                                             ; preds = %bb52
  ret i32 0
}

define i32 @eval() {
eval:
  %r225 = alloca [256 x i32], align 4
  %r226 = alloca [256 x i32], align 4
  %r339 = add i32 0, 0
  %r340 = add i32 0, 0
  %r341 = add i32 0, 0
  %r342 = add i32 0, 0
  %r343 = add i32 0, 0
  %r344 = add i32 0, 0
  %r345 = add i32 0, 0
  %r346 = add i32 0, 0
  %r347 = add i32 0, 0
  br label %bb59

bb59:                                             ; preds = %bb60, %eval
  %r348 = phi i32 [ %r347, %eval ], [ %r367, %bb60 ]
  %r229 = icmp slt i32 %r348, 256
  br i1 %r229, label %bb60, label %bb61

bb60:                                             ; preds = %bb59
  %r231 = getelementptr [256 x i32], ptr %r225, i32 0, i32 %r348
  store i32 0, ptr %r231, align 4
  %r233 = getelementptr [256 x i32], ptr %r226, i32 0, i32 %r348
  store i32 0, ptr %r233, align 4
  %r235 = add i32 %r348, 1
  %r367 = add i32 %r235, 0
  br label %bb59

bb61:                                             ; preds = %bb59
  %r236 = load i32, ptr @cur_token, align 4
  %r237 = load i32, ptr @TOKEN_NUM, align 4
  %r238 = icmp ne i32 %r236, %r237
  br i1 %r238, label %bb62, label %bb63

bb62:                                             ; preds = %bb61
  %r239 = call i32 @panic()
  ret i32 %r239

bb63:                                             ; preds = %bb61
  br label %bb64

bb64:                                             ; preds = %bb63
  %r240 = load i32, ptr @num, align 4
  call void @stack_push(ptr %r225, i32 %r240)
  call void @next_token()
  br label %bb65

bb65:                                             ; preds = %bb77, %bb64
  %r349 = phi i32 [ %r343, %bb64 ], [ %r361, %bb77 ]
  %r350 = phi i32 [ %r340, %bb64 ], [ %r360, %bb77 ]
  %r351 = phi i32 [ %r341, %bb64 ], [ %r362, %bb77 ]
  %r352 = phi i32 [ %r342, %bb64 ], [ %r363, %bb77 ]
  %r241 = load i32, ptr @cur_token, align 4
  %r242 = load i32, ptr @TOKEN_OTHER, align 4
  %r243 = icmp eq i32 %r241, %r242
  br i1 %r243, label %bb66, label %bb67

bb66:                                             ; preds = %bb65
  %r245 = load i32, ptr @other, align 4
  %r360 = add i32 %r245, 0
  %r246 = call i32 @get_op_prec(i32 %r360)
  %r248 = icmp eq i32 %r246, 0
  br i1 %r248, label %bb68, label %bb69

bb68:                                             ; preds = %bb66
  br label %bb67

bb69:                                             ; preds = %bb66
  br label %bb70

bb70:                                             ; preds = %bb69
  call void @next_token()
  br label %bb71

bb71:                                             ; preds = %bb72, %bb70
  %r361 = phi i32 [ %r349, %bb70 ], [ %r366, %bb72 ]
  %r362 = phi i32 [ %r351, %bb70 ], [ %r364, %bb72 ]
  %r363 = phi i32 [ %r352, %bb70 ], [ %r365, %bb72 ]
  %r249 = call i32 @stack_size(ptr %r226)
  %r250 = icmp ne i32 %r249, 0
  br i1 %r250, label %bb74, label %bb73

bb74:                                             ; preds = %bb71
  %r252 = call i32 @stack_peek(ptr %r226)
  %r251 = call i32 @get_op_prec(i32 %r252)
  %r253 = call i32 @get_op_prec(i32 %r360)
  %r255 = icmp sge i32 %r251, %r253
  br i1 %r255, label %bb72, label %bb73

bb72:                                             ; preds = %bb74
  %r257 = call i32 @stack_pop(ptr %r226)
  %r364 = add i32 %r257, 0
  %r259 = call i32 @stack_pop(ptr %r225)
  %r365 = add i32 %r259, 0
  %r261 = call i32 @stack_pop(ptr %r225)
  %r366 = add i32 %r261, 0
  %r262 = call i32 @eval_op(i32 %r364, i32 %r366, i32 %r365)
  call void @stack_push(ptr %r225, i32 %r262)
  br label %bb71

bb73:                                             ; preds = %bb74, %bb71
  call void @stack_push(ptr %r226, i32 %r360)
  %r267 = load i32, ptr @cur_token, align 4
  %r268 = load i32, ptr @TOKEN_NUM, align 4
  %r269 = icmp ne i32 %r267, %r268
  br i1 %r269, label %bb75, label %bb76

bb75:                                             ; preds = %bb73
  %r270 = call i32 @panic()
  ret i32 %r270

bb76:                                             ; preds = %bb73
  br label %bb77

bb77:                                             ; preds = %bb76
  %r271 = load i32, ptr @num, align 4
  call void @stack_push(ptr %r225, i32 %r271)
  call void @next_token()
  br label %bb65

bb67:                                             ; preds = %bb68, %bb65
  %r353 = phi i32 [ %r350, %bb65 ], [ %r360, %bb68 ]
  call void @next_token()
  br label %bb78

bb78:                                             ; preds = %bb79, %bb67
  %r354 = phi i32 [ %r346, %bb67 ], [ %r359, %bb79 ]
  %r355 = phi i32 [ %r345, %bb67 ], [ %r358, %bb79 ]
  %r356 = phi i32 [ %r344, %bb67 ], [ %r357, %bb79 ]
  %r272 = call i32 @stack_size(ptr %r226)
  %r273 = icmp ne i32 %r272, 0
  br i1 %r273, label %bb79, label %bb80

bb79:                                             ; preds = %bb78
  %r275 = call i32 @stack_pop(ptr %r226)
  %r357 = add i32 %r275, 0
  %r277 = call i32 @stack_pop(ptr %r225)
  %r358 = add i32 %r277, 0
  %r279 = call i32 @stack_pop(ptr %r225)
  %r359 = add i32 %r279, 0
  %r280 = call i32 @eval_op(i32 %r357, i32 %r359, i32 %r358)
  call void @stack_push(ptr %r225, i32 %r280)
  br label %bb78

bb80:                                             ; preds = %bb78
  %r284 = call i32 @stack_peek(ptr %r225)
  ret i32 %r284
}

define i32 @main() {
main:
  %r369 = add i32 0, 0
  call void @_sysy_starttime(i32 205)
  %r286 = call i32 @getint()
  %r370 = add i32 %r286, 0
  call void @getch()
  call void @next_token()
  br label %bb84

bb84:                                             ; preds = %bb85, %main
  %r371 = phi i32 [ %r370, %main ], [ %r372, %bb85 ]
  %r288 = icmp ne i32 %r371, 0
  br i1 %r288, label %bb85, label %bb86

bb85:                                             ; preds = %bb84
  %r289 = call i32 @eval()
  call void @putint(i32 %r289)
  call void @putch(i32 10)
  %r291 = sub i32 %r371, 1
  %r372 = add i32 %r291, 0
  br label %bb84

bb86:                                             ; preds = %bb84
  call void @_sysy_stoptime(i32 214)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @before_main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %18, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 1024
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %7
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %10
  store i32 0, ptr %11, align 4
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %13
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %16
  store i32 0, ptr %17, align 4
  br label %18

18:                                               ; preds = %5
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %1, align 4
  br label %2, !llvm.loop !6

21:                                               ; preds = %2
  store i32 1, ptr @_sysy_idx, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @after_main() #0 {
  %1 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  br label %2

2:                                                ; preds = %63, %0
  %3 = load i32, ptr %1, align 4
  %4 = load i32, ptr @_sysy_idx, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %66

6:                                                ; preds = %2
  %7 = load ptr, ptr @stderr, align 8
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.5, i32 noundef %11, i32 noundef %15, i32 noundef %19, i32 noundef %23, i32 noundef %27, i32 noundef %31)
  %33 = load i32, ptr %1, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = load i32, ptr @_sysy_us, align 16
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr @_sysy_us, align 16
  %39 = load i32, ptr %1, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr @_sysy_s, align 16
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr @_sysy_s, align 16
  %45 = load i32, ptr @_sysy_us, align 16
  %46 = srem i32 %45, 1000000
  store i32 %46, ptr @_sysy_us, align 16
  %47 = load i32, ptr %1, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr @_sysy_m, align 16
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr @_sysy_m, align 16
  %53 = load i32, ptr @_sysy_s, align 16
  %54 = srem i32 %53, 60
  store i32 %54, ptr @_sysy_s, align 16
  %55 = load i32, ptr %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr @_sysy_h, align 16
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr @_sysy_h, align 16
  %61 = load i32, ptr @_sysy_m, align 16
  %62 = srem i32 %61, 60
  store i32 %62, ptr @_sysy_m, align 16
  br label %63

63:                                               ; preds = %6
  %64 = load i32, ptr %1, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %1, align 4
  br label %2, !llvm.loop !8

66:                                               ; preds = %2
  %67 = load ptr, ptr @stderr, align 8
  %68 = load i32, ptr @_sysy_h, align 16
  %69 = load i32, ptr @_sysy_m, align 16
  %70 = load i32, ptr @_sysy_s, align 16
  %71 = load i32, ptr @_sysy_us, align 16
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %67, ptr noundef @.str.6, i32 noundef %68, i32 noundef %69, i32 noundef %70, i32 noundef %71)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %1)
  %3 = load i32, ptr %1, align 4
  ret i32 %3
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %3 = load i8, ptr %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %3)
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  br label %6, !llvm.loop !9

19:                                               ; preds = %6
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %6)
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %8, !llvm.loop !10

22:                                               ; preds = %8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_sysy_starttime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr @_sysy_idx, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %5
  store i32 %3, ptr %6, align 4
  %7 = call i32 @gettimeofday(ptr noundef @_sysy_start, ptr noundef null) #3
  ret void
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_sysy_stoptime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 @gettimeofday(ptr noundef @_sysy_end, ptr noundef null) #3
  %4 = load i32, ptr %2, align 4
  %5 = load i32, ptr @_sysy_idx, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %6
  store i32 %4, ptr %7, align 4
  %8 = load i64, ptr @_sysy_end, align 8
  %9 = load i64, ptr @_sysy_start, align 8
  %10 = sub nsw i64 %8, %9
  %11 = mul nsw i64 1000000, %10
  %12 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @_sysy_end, i32 0, i32 1), align 8
  %13 = add nsw i64 %11, %12
  %14 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @_sysy_start, i32 0, i32 1), align 8
  %15 = sub nsw i64 %13, %14
  %16 = load i32, ptr @_sysy_idx, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %19 to i64
  %21 = add nsw i64 %20, %15
  %22 = trunc i64 %21 to i32
  store i32 %22, ptr %18, align 4
  %23 = load i32, ptr @_sysy_idx, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = sdiv i32 %26, 1000000
  %28 = load i32, ptr @_sysy_idx, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %31, %27
  store i32 %32, ptr %30, align 4
  %33 = load i32, ptr @_sysy_idx, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = srem i32 %36, 1000000
  store i32 %37, ptr %35, align 4
  %38 = load i32, ptr @_sysy_idx, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = sdiv i32 %41, 60
  %43 = load i32, ptr @_sysy_idx, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, %42
  store i32 %47, ptr %45, align 4
  %48 = load i32, ptr @_sysy_idx, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = srem i32 %51, 60
  store i32 %52, ptr %50, align 4
  %53 = load i32, ptr @_sysy_idx, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = sdiv i32 %56, 60
  %58 = load i32, ptr @_sysy_idx, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = add nsw i32 %61, %57
  store i32 %62, ptr %60, align 4
  %63 = load i32, ptr @_sysy_idx, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = srem i32 %66, 60
  store i32 %67, ptr %65, align 4
  %68 = load i32, ptr @_sysy_idx, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr @_sysy_idx, align 4
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
