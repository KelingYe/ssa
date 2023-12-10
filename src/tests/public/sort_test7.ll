declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @Merge( i32* %r100, i32 %r101, i32 %r103, i32 %r105 ) {
Merge:
  %r269 = add i32 0, 0
  %r270 = add i32 0, 0
  %r271 = add i32 0, 0
  %r272 = add i32 0, 0
  %r273 = add i32 0, 0
  %r116 = alloca [ 10 x i32 ]
  %r117 = alloca [ 10 x i32 ]
  %r274 = add i32 0, 0
  %r275 = add i32 0, 0
  %r276 = add i32 0, 0
  %r277 = add i32 0, 0
  %r278 = add i32 %r101, 0
  %r279 = add i32 %r103, 0
  %r280 = add i32 %r105, 0
  br label %bb1

bb1:
  %r110 = sub i32 %r279, %r278
  %r111 = add i32 %r110, 1
  %r281 = add i32 %r111, 0
  %r115 = sub i32 %r280, %r279
  %r282 = add i32 %r115, 0
  %r283 = add i32 0, 0
  %r284 = add i32 0, 0
  br label %bb2

bb2:
  %r285 = phi i32 [ %r283, %bb1 ], [ %r313, %bb3 ]
  %r286 = phi i32 [ %r276, %bb1 ], [ %r312, %bb3 ]
  %r123 = icmp slt i32 %r285, %r281
  br i1 %r123, label %bb3, label %bb4

bb3:
  %r126 = add i32 %r285, %r278
  %r312 = add i32 %r126, 0
  %r129 = getelementptr i32, i32* %r100, i32 %r312
  %r128 = load i32, i32* %r129
  %r131 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r285
  store i32 %r128, i32* %r131
  %r133 = add i32 %r285, 1
  %r313 = add i32 %r133, 0
  br label %bb2

bb4:
  br label %bb5

bb5:
  %r287 = phi i32 [ %r284, %bb4 ], [ %r311, %bb6 ]
  %r288 = phi i32 [ %r286, %bb4 ], [ %r310, %bb6 ]
  %r136 = icmp slt i32 %r287, %r282
  br i1 %r136, label %bb6, label %bb7

bb6:
  %r139 = add i32 %r287, %r279
  %r140 = add i32 %r139, 1
  %r310 = add i32 %r140, 0
  %r143 = getelementptr i32, i32* %r100, i32 %r310
  %r142 = load i32, i32* %r143
  %r145 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r287
  store i32 %r142, i32* %r145
  %r147 = add i32 %r287, 1
  %r311 = add i32 %r147, 0
  br label %bb5

bb7:
  %r289 = add i32 0, 0
  %r290 = add i32 0, 0
  %r291 = add i32 %r278, 0
  br label %bb8

bb8:
  %r292 = phi i32 [ %r289, %bb7 ], [ %r303, %bb14 ]
  %r293 = phi i32 [ %r290, %bb7 ], [ %r304, %bb14 ]
  %r294 = phi i32 [ %r291, %bb7 ], [ %r305, %bb14 ]
  %r152 = icmp ne i32 %r292, %r281
  br i1 %r152, label %bb11, label %bb10

bb11:
  %r155 = icmp ne i32 %r293, %r282
  br i1 %r155, label %bb9, label %bb10

bb9:
  %r158 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r292
  %r157 = load i32, i32* %r158
  %r161 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r293
  %r160 = load i32, i32* %r161
  %r162 = add i32 %r160, 1
  %r163 = icmp slt i32 %r157, %r162
  br i1 %r163, label %bb12, label %bb13

bb12:
  %r166 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r292
  %r165 = load i32, i32* %r166
  %r168 = getelementptr i32, i32* %r100, i32 %r294
  store i32 %r165, i32* %r168
  %r170 = add i32 %r294, 1
  %r306 = add i32 %r170, 0
  %r172 = add i32 %r292, 1
  %r307 = add i32 %r172, 0
  br label %bb14

bb13:
  %r175 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r293
  %r174 = load i32, i32* %r175
  %r177 = getelementptr i32, i32* %r100, i32 %r294
  store i32 %r174, i32* %r177
  %r179 = add i32 %r294, 1
  %r308 = add i32 %r179, 0
  %r181 = add i32 %r293, 1
  %r309 = add i32 %r181, 0
  br label %bb14

bb14:
  %r303 = phi i32 [ %r307, %bb12 ], [ %r292, %bb13 ]
  %r304 = phi i32 [ %r293, %bb12 ], [ %r309, %bb13 ]
  %r305 = phi i32 [ %r306, %bb12 ], [ %r308, %bb13 ]
  br label %bb8

bb10:
  br label %bb15

bb15:
  %r295 = phi i32 [ %r292, %bb10 ], [ %r302, %bb16 ]
  %r296 = phi i32 [ %r294, %bb10 ], [ %r301, %bb16 ]
  %r184 = icmp slt i32 %r295, %r281
  br i1 %r184, label %bb16, label %bb17

bb16:
  %r187 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r295
  %r186 = load i32, i32* %r187
  %r189 = getelementptr i32, i32* %r100, i32 %r296
  store i32 %r186, i32* %r189
  %r191 = add i32 %r296, 1
  %r301 = add i32 %r191, 0
  %r193 = add i32 %r295, 1
  %r302 = add i32 %r193, 0
  br label %bb15

bb17:
  br label %bb18

bb18:
  %r297 = phi i32 [ %r293, %bb17 ], [ %r300, %bb19 ]
  %r298 = phi i32 [ %r296, %bb17 ], [ %r299, %bb19 ]
  %r196 = icmp slt i32 %r297, %r282
  br i1 %r196, label %bb19, label %bb20

bb19:
  %r199 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r297
  %r198 = load i32, i32* %r199
  %r201 = getelementptr i32, i32* %r100, i32 %r298
  store i32 %r198, i32* %r201
  %r203 = add i32 %r298, 1
  %r299 = add i32 %r203, 0
  %r205 = add i32 %r297, 1
  %r300 = add i32 %r205, 0
  br label %bb18

bb20:
  ret i32 0
}

define i32 @MergeSort( i32* %r206, i32 %r207, i32 %r209 ) {
MergeSort:
  %r318 = add i32 0, 0
  %r319 = add i32 0, 0
  %r320 = add i32 0, 0
  %r321 = add i32 0, 0
  %r322 = add i32 %r207, 0
  %r323 = add i32 %r209, 0
  br label %bb21

bb21:
  %r213 = icmp slt i32 %r322, %r323
  br i1 %r213, label %bb22, label %bb23

bb22:
  %r217 = add i32 %r322, %r323
  %r218 = sdiv i32 %r217, 2
  %r326 = add i32 %r218, 0
  %r220 = call i32 @MergeSort(i32* %r206, i32 %r322, i32 %r326)
  %r327 = add i32 %r220, 0
  %r224 = add i32 %r326, 1
  %r328 = add i32 %r224, 0
  %r225 = call i32 @MergeSort(i32* %r206, i32 %r328, i32 %r323)
  %r329 = add i32 %r225, 0
  %r228 = call i32 @Merge(i32* %r206, i32 %r322, i32 %r326, i32 %r323)
  %r330 = add i32 %r228, 0
  br label %bb24

bb23:
  br label %bb24

bb24:
  %r324 = phi i32 [ %r326, %bb22 ], [ %r320, %bb23 ]
  %r325 = phi i32 [ %r330, %bb22 ], [ %r321, %bb23 ]
  ret i32 0
}

define i32 @main( ) {
main:
  %r232 = alloca [ 10 x i32 ]
  %r333 = add i32 0, 0
  %r334 = add i32 0, 0
  call void @_sysy_starttime(i32 71)
  store i32 10, i32* @n
  %r233 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 0
  store i32 4, i32* %r233
  %r234 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 1
  store i32 3, i32* %r234
  %r235 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 2
  store i32 9, i32* %r235
  %r236 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 3
  store i32 2, i32* %r236
  %r237 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 4
  store i32 0, i32* %r237
  %r238 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 5
  store i32 1, i32* %r238
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 6
  store i32 6, i32* %r239
  %r240 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 7
  store i32 5, i32* %r240
  %r241 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 8
  store i32 7, i32* %r241
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 9
  store i32 8, i32* %r242
  %r335 = add i32 0, 0
  %r245 = load i32, i32* @n
  %r246 = sub i32 %r245, 1
  %r336 = add i32 %r246, 0
  %r247 = call i32 @MergeSort(i32* %r232, i32 %r335, i32 %r336)
  %r337 = add i32 %r247, 0
  br label %bb25

bb25:
  %r338 = phi i32 [ %r337, %main ], [ %r342, %bb26 ]
  %r339 = phi i32 [ %r336, %main ], [ %r341, %bb26 ]
  %r251 = load i32, i32* @n
  %r252 = icmp slt i32 %r338, %r251
  br i1 %r252, label %bb26, label %bb27

bb26:
  %r255 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 %r338
  %r254 = load i32, i32* %r255
  %r340 = add i32 %r254, 0
  call void @putint(i32 %r340)
  %r341 = add i32 10, 0
  call void @putch(i32 %r341)
  %r259 = add i32 %r338, 1
  %r342 = add i32 %r259, 0
  br label %bb25

bb27:
  call void @_sysy_stoptime(i32 97)
  ret i32 0
}

