declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @swap( i32* %r100, i32 %r101, i32 %r103 ) {
swap:
  %r222 = add i32 0, 0
  %r223 = add i32 0, 0
  %r224 = add i32 0, 0
  %r225 = add i32 %r101, 0
  %r226 = add i32 %r103, 0
  br label %bb1

bb1:
  %r108 = getelementptr i32, i32* %r100, i32 %r225
  %r107 = load i32, i32* %r108
  %r227 = add i32 %r107, 0
  %r111 = getelementptr i32, i32* %r100, i32 %r226
  %r110 = load i32, i32* %r111
  %r113 = getelementptr i32, i32* %r100, i32 %r225
  store i32 %r110, i32* %r113
  %r116 = getelementptr i32, i32* %r100, i32 %r226
  store i32 %r227, i32* %r116
  ret i32 0
}

define i32 @heap_ajust( i32* %r117, i32 %r118, i32 %r120 ) {
heap_ajust:
  %r233 = add i32 0, 0
  %r234 = add i32 0, 0
  %r235 = add i32 0, 0
  %r236 = add i32 0, 0
  %r237 = add i32 0, 0
  %r238 = add i32 %r118, 0
  %r239 = add i32 %r120, 0
  br label %bb2

bb2:
  %r240 = add i32 %r238, 0
  %r126 = mul i32 %r240, 2
  %r127 = add i32 %r126, 1
  %r241 = add i32 %r127, 0
  br label %bb3

bb3:
  %r242 = phi i32 [ %r241, %bb2 ], [ %r249, %bb12 ]
  %r243 = phi i32 [ %r237, %bb2 ], [ %r245, %bb12 ]
  %r244 = phi i32 [ %r240, %bb2 ], [ %r248, %bb12 ]
  %r130 = add i32 %r239, 1
  %r131 = icmp slt i32 %r242, %r130
  br i1 %r131, label %bb4, label %bb5

bb4:
  %r134 = add i32 %r242, 1
  %r245 = add i32 %r134, 0
  %r137 = icmp slt i32 %r242, %r239
  br i1 %r137, label %bb9, label %bb7

bb9:
  %r140 = getelementptr i32, i32* %r117, i32 %r242
  %r139 = load i32, i32* %r140
  %r143 = getelementptr i32, i32* %r117, i32 %r245
  %r142 = load i32, i32* %r143
  %r144 = icmp slt i32 %r139, %r142
  br i1 %r144, label %bb6, label %bb7

bb6:
  %r146 = add i32 %r242, 1
  %r250 = add i32 %r146, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r246 = phi i32 [ %r250, %bb6 ], [ %r242, %bb7 ]
  %r149 = getelementptr i32, i32* %r117, i32 %r244
  %r148 = load i32, i32* %r149
  %r152 = getelementptr i32, i32* %r117, i32 %r246
  %r151 = load i32, i32* %r152
  %r153 = icmp sgt i32 %r148, %r151
  br i1 %r153, label %bb10, label %bb11

bb10:
  ret i32 0
bb11:
  %r154 = call i32 @swap(i32* %r117, i32 %r244, i32 %r246)
  %r247 = add i32 %r154, 0
  %r248 = add i32 %r246, 0
  %r159 = mul i32 %r248, 2
  %r160 = add i32 %r159, 1
  %r249 = add i32 %r160, 0
  br label %bb12

bb12:
  br label %bb3

bb5:
  ret i32 0
}

define i32 @heap_sort( i32* %r161, i32 %r162 ) {
heap_sort:
  %r255 = add i32 0, 0
  %r256 = add i32 0, 0
  %r257 = add i32 0, 0
  %r258 = add i32 0, 0
  %r259 = add i32 %r162, 0
  br label %bb14

bb14:
  %r167 = sdiv i32 %r259, 2
  %r168 = sub i32 %r167, 1
  %r260 = add i32 %r168, 0
  br label %bb15

bb15:
  %r261 = phi i32 [ %r257, %bb14 ], [ %r273, %bb16 ]
  %r262 = phi i32 [ %r260, %bb14 ], [ %r274, %bb16 ]
  %r170 = sub i32 0, 1
  %r171 = icmp sgt i32 %r262, %r170
  br i1 %r171, label %bb16, label %bb17

bb16:
  %r173 = sub i32 %r259, 1
  %r272 = add i32 %r173, 0
  %r174 = call i32 @heap_ajust(i32* %r161, i32 %r262, i32 %r272)
  %r273 = add i32 %r174, 0
  %r178 = sub i32 %r262, 1
  %r274 = add i32 %r178, 0
  br label %bb15

bb17:
  %r180 = sub i32 %r259, 1
  %r263 = add i32 %r180, 0
  br label %bb18

bb18:
  %r264 = phi i32 [ %r261, %bb17 ], [ %r270, %bb19 ]
  %r265 = phi i32 [ %r258, %bb17 ], [ %r267, %bb19 ]
  %r266 = phi i32 [ %r263, %bb17 ], [ %r271, %bb19 ]
  %r182 = icmp sgt i32 %r266, 0
  br i1 %r182, label %bb19, label %bb20

bb19:
  %r267 = add i32 0, 0
  %r184 = call i32 @swap(i32* %r161, i32 %r267, i32 %r266)
  %r268 = add i32 %r184, 0
  %r188 = sub i32 %r266, 1
  %r269 = add i32 %r188, 0
  %r189 = call i32 @heap_ajust(i32* %r161, i32 %r267, i32 %r269)
  %r270 = add i32 %r189, 0
  %r193 = sub i32 %r266, 1
  %r271 = add i32 %r193, 0
  br label %bb18

bb20:
  ret i32 0
}

define i32 @main( ) {
main:
  %r194 = alloca [ 10 x i32 ]
  %r277 = add i32 0, 0
  %r278 = add i32 0, 0
  call void @_sysy_starttime(i32 50)
  store i32 10, i32* @n
  %r195 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 0
  store i32 4, i32* %r195
  %r196 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 1
  store i32 3, i32* %r196
  %r197 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 2
  store i32 9, i32* %r197
  %r198 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 3
  store i32 2, i32* %r198
  %r199 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 4
  store i32 0, i32* %r199
  %r200 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 5
  store i32 1, i32* %r200
  %r201 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 6
  store i32 6, i32* %r201
  %r202 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 7
  store i32 5, i32* %r202
  %r203 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 8
  store i32 7, i32* %r203
  %r204 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 9
  store i32 8, i32* %r204
  %r279 = add i32 0, 0
  %r207 = load i32, i32* @n
  %r206 = call i32 @heap_sort(i32* %r194, i32 %r207)
  %r280 = add i32 %r206, 0
  br label %bb21

bb21:
  %r281 = phi i32 [ %r278, %main ], [ %r284, %bb22 ]
  %r282 = phi i32 [ %r280, %main ], [ %r285, %bb22 ]
  %r209 = load i32, i32* @n
  %r210 = icmp slt i32 %r282, %r209
  br i1 %r210, label %bb22, label %bb23

bb22:
  %r214 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 %r282
  %r213 = load i32, i32* %r214
  %r283 = add i32 %r213, 0
  call void @putint(i32 %r283)
  %r284 = add i32 10, 0
  call void @putch(i32 %r284)
  %r218 = add i32 %r282, 1
  %r285 = add i32 %r218, 0
  br label %bb21

bb23:
  call void @_sysy_stoptime(i32 66)
  ret i32 0
}

