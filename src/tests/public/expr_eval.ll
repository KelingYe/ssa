declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@TOKEN_NUM = global i32 0
@TOKEN_OTHER = global i32 1
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
define i32 @next_char( ) {
next_char:
  %r100 = call i32 @getch()
  store i32 %r100, i32* @last_char
  %r101 = load i32, i32* @last_char
  ret i32 %r101
}

define i32 @is_space( i32 %r102 ) {
is_space:
  %r293 = add i32 0, 0
  %r294 = add i32 %r102, 0
  br label %bb1

bb1:
  %r105 = icmp eq i32 %r294, 32
  br i1 %r105, label %bb2, label %bb5

bb5:
  %r107 = icmp eq i32 %r294, 10
  br i1 %r107, label %bb2, label %bb3

bb2:
  ret i32 1
bb3:
  ret i32 0
}

define i32 @is_num( i32 %r108 ) {
is_num:
  %r296 = add i32 0, 0
  %r297 = add i32 %r108, 0
  br label %bb8

bb8:
  %r111 = icmp sge i32 %r297, 48
  br i1 %r111, label %bb12, label %bb10

bb12:
  %r113 = icmp sle i32 %r297, 57
  br i1 %r113, label %bb9, label %bb10

bb9:
  ret i32 1
bb10:
  ret i32 0
}

define i32 @next_token( ) {
next_token:
  br label %bb15

bb15:
  %r115 = load i32, i32* @last_char
  %r114 = call i32 @is_space(i32 %r115)
  %r116 = icmp ne i32 %r114, 0
  br i1 %r116, label %bb16, label %bb17

bb16:
  call void @next_char()
  br label %bb15

bb17:
  %r118 = load i32, i32* @last_char
  %r117 = call i32 @is_num(i32 %r118)
  %r119 = icmp ne i32 %r117, 0
  br i1 %r119, label %bb18, label %bb19

bb18:
  %r120 = load i32, i32* @last_char
  %r121 = sub i32 %r120, 48
  store i32 %r121, i32* @num
  br label %bb21

bb21:
  %r123 = call i32 @next_char()
  %r122 = call i32 @is_num(i32 %r123)
  %r124 = icmp ne i32 %r122, 0
  br i1 %r124, label %bb22, label %bb23

bb22:
  %r125 = load i32, i32* @num
  %r126 = mul i32 %r125, 10
  %r127 = load i32, i32* @last_char
  %r128 = add i32 %r126, %r127
  %r129 = sub i32 %r128, 48
  store i32 %r129, i32* @num
  br label %bb21

bb23:
  %r130 = load i32, i32* @TOKEN_NUM
  store i32 %r130, i32* @cur_token
  br label %bb20

bb19:
  %r131 = load i32, i32* @last_char
  store i32 %r131, i32* @other
  call void @next_char()
  %r132 = load i32, i32* @TOKEN_OTHER
  store i32 %r132, i32* @cur_token
  br label %bb20

bb20:
  %r133 = load i32, i32* @cur_token
  ret i32 %r133
}

define i32 @panic( ) {
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

define i32 @get_op_prec( i32 %r135 ) {
get_op_prec:
  %r299 = add i32 0, 0
  %r300 = add i32 %r135, 0
  br label %bb24

bb24:
  %r138 = icmp eq i32 %r300, 43
  br i1 %r138, label %bb25, label %bb28

bb28:
  %r140 = icmp eq i32 %r300, 45
  br i1 %r140, label %bb25, label %bb26

bb25:
  ret i32 10
bb26:
  br label %bb27

bb27:
  %r142 = icmp eq i32 %r300, 42
  br i1 %r142, label %bb29, label %bb33

bb33:
  %r144 = icmp eq i32 %r300, 47
  br i1 %r144, label %bb29, label %bb32

bb32:
  %r146 = icmp eq i32 %r300, 37
  br i1 %r146, label %bb29, label %bb30

bb29:
  ret i32 20
bb30:
  br label %bb31

bb31:
  ret i32 0
}

define void @stack_push( i32* %r147, i32 %r148 ) {
stack_push:
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 %r148, 0
  br label %bb36

bb36:
  %r151 = getelementptr i32, i32* %r147, i32 0
  %r150 = load i32, i32* %r151
  %r152 = add i32 %r150, 1
  %r153 = getelementptr i32, i32* %r147, i32 0
  store i32 %r152, i32* %r153
  %r156 = getelementptr i32, i32* %r147, i32 0
  %r155 = load i32, i32* %r156
  %r306 = add i32 %r155, 0
  %r159 = getelementptr i32, i32* %r147, i32 %r306
  store i32 %r305, i32* %r159
  ret void
}

define i32 @stack_pop( i32* %r160 ) {
stack_pop:
  %r309 = add i32 0, 0
  %r310 = add i32 0, 0
  %r163 = getelementptr i32, i32* %r160, i32 0
  %r162 = load i32, i32* %r163
  %r311 = add i32 %r162, 0
  %r167 = getelementptr i32, i32* %r160, i32 %r311
  %r166 = load i32, i32* %r167
  %r312 = add i32 %r166, 0
  %r169 = getelementptr i32, i32* %r160, i32 0
  %r168 = load i32, i32* %r169
  %r170 = sub i32 %r168, 1
  %r171 = getelementptr i32, i32* %r160, i32 0
  store i32 %r170, i32* %r171
  ret i32 %r312
}

define i32 @stack_peek( i32* %r173 ) {
stack_peek:
  %r314 = add i32 0, 0
  %r176 = getelementptr i32, i32* %r173, i32 0
  %r175 = load i32, i32* %r176
  %r315 = add i32 %r175, 0
  %r179 = getelementptr i32, i32* %r173, i32 %r315
  %r178 = load i32, i32* %r179
  ret i32 %r178
}

define i32 @stack_size( i32* %r180 ) {
stack_size:
  %r182 = getelementptr i32, i32* %r180, i32 0
  %r181 = load i32, i32* %r182
  ret i32 %r181
}

define i32 @mod( i32 %r183, i32 %r185 ) {
mod:
  %r318 = add i32 0, 0
  %r319 = add i32 0, 0
  %r320 = add i32 %r183, 0
  %r321 = add i32 %r185, 0
  br label %bb37

bb37:
  %r190 = sdiv i32 %r320, %r321
  %r192 = mul i32 %r190, %r321
  %r193 = sub i32 %r320, %r192
  ret i32 %r193
}

define i32 @eval_op( i32 %r194, i32 %r196, i32 %r198 ) {
eval_op:
  %r325 = add i32 0, 0
  %r326 = add i32 0, 0
  %r327 = add i32 0, 0
  %r328 = add i32 %r194, 0
  %r329 = add i32 %r196, 0
  %r330 = add i32 %r198, 0
  br label %bb38

bb38:
  %r201 = icmp eq i32 %r328, 43
  br i1 %r201, label %bb39, label %bb40

bb39:
  %r204 = add i32 %r329, %r330
  ret i32 %r204
bb40:
  br label %bb41

bb41:
  %r206 = icmp eq i32 %r328, 45
  br i1 %r206, label %bb42, label %bb43

bb42:
  %r209 = sub i32 %r329, %r330
  ret i32 %r209
bb43:
  br label %bb44

bb44:
  %r211 = icmp eq i32 %r328, 42
  br i1 %r211, label %bb45, label %bb46

bb45:
  %r214 = mul i32 %r329, %r330
  ret i32 %r214
bb46:
  br label %bb47

bb47:
  %r216 = icmp eq i32 %r328, 47
  br i1 %r216, label %bb48, label %bb49

bb48:
  %r219 = sdiv i32 %r329, %r330
  ret i32 %r219
bb49:
  br label %bb50

bb50:
  %r221 = icmp eq i32 %r328, 37
  br i1 %r221, label %bb51, label %bb52

bb51:
  %r222 = call i32 @mod(i32 %r329, i32 %r330)
  ret i32 %r222
bb52:
  br label %bb53

bb53:
  ret i32 0
}

define i32 @eval( ) {
eval:
  %r225 = alloca [ 256 x i32 ]
  %r226 = alloca [ 256 x i32 ]
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

bb59:
  %r348 = phi i32 [ %r347, %eval ], [ %r367, %bb60 ]
  %r229 = icmp slt i32 %r348, 256
  br i1 %r229, label %bb60, label %bb61

bb60:
  %r231 = getelementptr [256 x i32 ], [256 x i32 ]* %r225, i32 0, i32 %r348
  store i32 0, i32* %r231
  %r233 = getelementptr [256 x i32 ], [256 x i32 ]* %r226, i32 0, i32 %r348
  store i32 0, i32* %r233
  %r235 = add i32 %r348, 1
  %r367 = add i32 %r235, 0
  br label %bb59

bb61:
  %r236 = load i32, i32* @cur_token
  %r237 = load i32, i32* @TOKEN_NUM
  %r238 = icmp ne i32 %r236, %r237
  br i1 %r238, label %bb62, label %bb63

bb62:
  %r239 = call i32 @panic()
  ret i32 %r239
bb63:
  br label %bb64

bb64:
  %r240 = load i32, i32* @num
  call void @stack_push(i32* %r225, i32 %r240)
  call void @next_token()
  br label %bb65

bb65:
  %r349 = phi i32 [ %r343, %bb64 ], [ %r361, %bb77 ]
  %r350 = phi i32 [ %r340, %bb64 ], [ %r360, %bb77 ]
  %r351 = phi i32 [ %r341, %bb64 ], [ %r362, %bb77 ]
  %r352 = phi i32 [ %r342, %bb64 ], [ %r363, %bb77 ]
  %r241 = load i32, i32* @cur_token
  %r242 = load i32, i32* @TOKEN_OTHER
  %r243 = icmp eq i32 %r241, %r242
  br i1 %r243, label %bb66, label %bb67

bb66:
  %r245 = load i32, i32* @other
  %r360 = add i32 %r245, 0
  %r246 = call i32 @get_op_prec(i32 %r360)
  %r248 = icmp eq i32 %r246, 0
  br i1 %r248, label %bb68, label %bb69

bb68:
  br label %bb67

bb69:
  br label %bb70

bb70:
  call void @next_token()
  br label %bb71

bb71:
  %r361 = phi i32 [ %r349, %bb70 ], [ %r366, %bb72 ]
  %r362 = phi i32 [ %r351, %bb70 ], [ %r364, %bb72 ]
  %r363 = phi i32 [ %r352, %bb70 ], [ %r365, %bb72 ]
  %r249 = call i32 @stack_size(i32* %r226)
  %r250 = icmp ne i32 %r249, 0
  br i1 %r250, label %bb74, label %bb73

bb74:
  %r252 = call i32 @stack_peek(i32* %r226)
  %r251 = call i32 @get_op_prec(i32 %r252)
  %r253 = call i32 @get_op_prec(i32 %r360)
  %r255 = icmp sge i32 %r251, %r253
  br i1 %r255, label %bb72, label %bb73

bb72:
  %r257 = call i32 @stack_pop(i32* %r226)
  %r364 = add i32 %r257, 0
  %r259 = call i32 @stack_pop(i32* %r225)
  %r365 = add i32 %r259, 0
  %r261 = call i32 @stack_pop(i32* %r225)
  %r366 = add i32 %r261, 0
  %r262 = call i32 @eval_op(i32 %r364, i32 %r366, i32 %r365)
  call void @stack_push(i32* %r225, i32 %r262)
  br label %bb71

bb73:
  call void @stack_push(i32* %r226, i32 %r360)
  %r267 = load i32, i32* @cur_token
  %r268 = load i32, i32* @TOKEN_NUM
  %r269 = icmp ne i32 %r267, %r268
  br i1 %r269, label %bb75, label %bb76

bb75:
  %r270 = call i32 @panic()
  ret i32 %r270
bb76:
  br label %bb77

bb77:
  %r271 = load i32, i32* @num
  call void @stack_push(i32* %r225, i32 %r271)
  call void @next_token()
  br label %bb65

bb67:
  %r353 = phi i32 [ %r350, %bb65 ], [ %r360, %bb68 ]
  call void @next_token()
  br label %bb78

bb78:
  %r354 = phi i32 [ %r346, %bb67 ], [ %r359, %bb79 ]
  %r355 = phi i32 [ %r345, %bb67 ], [ %r358, %bb79 ]
  %r356 = phi i32 [ %r344, %bb67 ], [ %r357, %bb79 ]
  %r272 = call i32 @stack_size(i32* %r226)
  %r273 = icmp ne i32 %r272, 0
  br i1 %r273, label %bb79, label %bb80

bb79:
  %r275 = call i32 @stack_pop(i32* %r226)
  %r357 = add i32 %r275, 0
  %r277 = call i32 @stack_pop(i32* %r225)
  %r358 = add i32 %r277, 0
  %r279 = call i32 @stack_pop(i32* %r225)
  %r359 = add i32 %r279, 0
  %r280 = call i32 @eval_op(i32 %r357, i32 %r359, i32 %r358)
  call void @stack_push(i32* %r225, i32 %r280)
  br label %bb78

bb80:
  %r284 = call i32 @stack_peek(i32* %r225)
  ret i32 %r284
}

define i32 @main( ) {
main:
  %r369 = add i32 0, 0
  call void @_sysy_starttime(i32 205)
  %r286 = call i32 @getint()
  %r370 = add i32 %r286, 0
  call void @getch()
  call void @next_token()
  br label %bb84

bb84:
  %r371 = phi i32 [ %r370, %main ], [ %r372, %bb85 ]
  %r288 = icmp ne i32 %r371, 0
  br i1 %r288, label %bb85, label %bb86

bb85:
  %r289 = call i32 @eval()
  call void @putint(i32 %r289)
  call void @putch(i32 10)
  %r291 = sub i32 %r371, 1
  %r372 = add i32 %r291, 0
  br label %bb84

bb86:
  call void @_sysy_stoptime(i32 214)
  ret i32 0
}

