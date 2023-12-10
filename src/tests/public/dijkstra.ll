declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@INF = global i32 65535
%array2D = type { [16 x i32 ] }
@e = global [ 16 x %array2D ] zeroinitializer
@book = global [ 16 x i32 ] zeroinitializer
@dis = global [ 16 x i32 ] zeroinitializer
@n = global i32 0
@m = global i32 0
@v1 = global i32 0
@v2 = global i32 0
@w = global i32 0
define void @Dijkstra( ) {
Dijkstra:
  %r242 = add i32 0, 0
  %r243 = add i32 0, 0
  %r244 = add i32 0, 0
  %r245 = add i32 0, 0
  %r246 = add i32 0, 0
  %r247 = add i32 1, 0
  br label %bb1

bb1:
  %r248 = phi i32 [ %r247, %Dijkstra ], [ %r270, %bb2 ]
  %r102 = load i32, i32* @n
  %r103 = icmp sle i32 %r248, %r102
  br i1 %r103, label %bb2, label %bb3

bb2:
  %r105 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r106 = getelementptr %array2D, %array2D* %r105, i32 0, i32 0
  %r108 = getelementptr [16 x i32 ], [16 x i32 ]* %r106, i32 0, i32 %r248
  %r107 = load i32, i32* %r108
  %r110 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r248
  store i32 %r107, i32* %r110
  %r112 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r248
  store i32 0, i32* %r112
  %r114 = add i32 %r248, 1
  %r270 = add i32 %r114, 0
  br label %bb1

bb3:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  %r249 = add i32 1, 0
  br label %bb4

bb4:
  %r250 = phi i32 [ %r245, %bb3 ], [ %r258, %bb16 ]
  %r251 = phi i32 [ %r246, %bb3 ], [ %r262, %bb16 ]
  %r252 = phi i32 [ %r244, %bb3 ], [ %r259, %bb16 ]
  %r253 = phi i32 [ %r249, %bb3 ], [ %r263, %bb16 ]
  %r254 = phi i32 [ %r243, %bb3 ], [ %r260, %bb16 ]
  %r117 = load i32, i32* @n
  %r118 = sub i32 %r117, 1
  %r119 = icmp sle i32 %r253, %r118
  br i1 %r119, label %bb5, label %bb6

bb5:
  %r121 = load i32, i32* @INF
  %r255 = add i32 %r121, 0
  %r256 = add i32 0, 0
  %r257 = add i32 1, 0
  br label %bb7

bb7:
  %r258 = phi i32 [ %r257, %bb5 ], [ %r267, %bb12 ]
  %r259 = phi i32 [ %r256, %bb5 ], [ %r265, %bb12 ]
  %r260 = phi i32 [ %r255, %bb5 ], [ %r266, %bb12 ]
  %r125 = load i32, i32* @n
  %r126 = icmp sle i32 %r258, %r125
  br i1 %r126, label %bb8, label %bb9

bb8:
  %r130 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r258
  %r129 = load i32, i32* %r130
  %r131 = icmp sgt i32 %r260, %r129
  br i1 %r131, label %bb13, label %bb11

bb13:
  %r134 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r258
  %r133 = load i32, i32* %r134
  %r135 = icmp eq i32 %r133, 0
  br i1 %r135, label %bb10, label %bb11

bb10:
  %r138 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r258
  %r137 = load i32, i32* %r138
  %r268 = add i32 %r137, 0
  %r269 = add i32 %r258, 0
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r265 = phi i32 [ %r269, %bb10 ], [ %r259, %bb11 ]
  %r266 = phi i32 [ %r268, %bb10 ], [ %r260, %bb11 ]
  %r141 = add i32 %r258, 1
  %r267 = add i32 %r141, 0
  br label %bb7

bb9:
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r259
  store i32 1, i32* %r143
  %r261 = add i32 1, 0
  br label %bb14

bb14:
  %r262 = phi i32 [ %r261, %bb9 ], [ %r264, %bb19 ]
  %r146 = load i32, i32* @n
  %r147 = icmp sle i32 %r262, %r146
  br i1 %r147, label %bb15, label %bb16

bb15:
  %r150 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r259
  %r151 = getelementptr %array2D, %array2D* %r150, i32 0, i32 0
  %r153 = getelementptr [16 x i32 ], [16 x i32 ]* %r151, i32 0, i32 %r262
  %r152 = load i32, i32* %r153
  %r154 = load i32, i32* @INF
  %r155 = icmp slt i32 %r152, %r154
  br i1 %r155, label %bb17, label %bb18

bb17:
  %r158 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r262
  %r157 = load i32, i32* %r158
  %r161 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r259
  %r160 = load i32, i32* %r161
  %r164 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r259
  %r165 = getelementptr %array2D, %array2D* %r164, i32 0, i32 0
  %r167 = getelementptr [16 x i32 ], [16 x i32 ]* %r165, i32 0, i32 %r262
  %r166 = load i32, i32* %r167
  %r168 = add i32 %r160, %r166
  %r169 = icmp sgt i32 %r157, %r168
  br i1 %r169, label %bb20, label %bb21

bb20:
  %r172 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r259
  %r171 = load i32, i32* %r172
  %r175 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r259
  %r176 = getelementptr %array2D, %array2D* %r175, i32 0, i32 0
  %r178 = getelementptr [16 x i32 ], [16 x i32 ]* %r176, i32 0, i32 %r262
  %r177 = load i32, i32* %r178
  %r179 = add i32 %r171, %r177
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r262
  store i32 %r179, i32* %r181
  br label %bb22

bb21:
  br label %bb22

bb22:
  br label %bb19

bb18:
  br label %bb19

bb19:
  %r183 = add i32 %r262, 1
  %r264 = add i32 %r183, 0
  br label %bb14

bb16:
  %r185 = add i32 %r253, 1
  %r263 = add i32 %r185, 0
  br label %bb4

bb6:
  ret void
}

define i32 @main( ) {
main:
  %r275 = add i32 0, 0
  %r276 = add i32 0, 0
  %r277 = add i32 0, 0
  %r278 = add i32 0, 0
  call void @_sysy_starttime(i32 53)
  %r187 = call i32 @getint()
  store i32 %r187, i32* @n
  %r188 = call i32 @getint()
  store i32 %r188, i32* @m
  %r279 = add i32 1, 0
  br label %bb23

bb23:
  %r280 = phi i32 [ %r279, %main ], [ %r294, %bb28 ]
  %r281 = phi i32 [ %r276, %main ], [ %r293, %bb28 ]
  %r190 = load i32, i32* @n
  %r191 = icmp sle i32 %r280, %r190
  br i1 %r191, label %bb24, label %bb25

bb24:
  %r292 = add i32 1, 0
  br label %bb26

bb26:
  %r293 = phi i32 [ %r292, %bb24 ], [ %r295, %bb31 ]
  %r194 = load i32, i32* @n
  %r195 = icmp sle i32 %r293, %r194
  br i1 %r195, label %bb27, label %bb28

bb27:
  %r198 = icmp eq i32 %r280, %r293
  br i1 %r198, label %bb29, label %bb30

bb29:
  %r201 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r280
  %r202 = getelementptr %array2D, %array2D* %r201, i32 0, i32 0
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r202, i32 0, i32 %r293
  store i32 0, i32* %r203
  br label %bb31

bb30:
  %r204 = load i32, i32* @INF
  %r207 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r280
  %r208 = getelementptr %array2D, %array2D* %r207, i32 0, i32 0
  %r209 = getelementptr [16 x i32 ], [16 x i32 ]* %r208, i32 0, i32 %r293
  store i32 %r204, i32* %r209
  br label %bb31

bb31:
  %r211 = add i32 %r293, 1
  %r295 = add i32 %r211, 0
  br label %bb26

bb28:
  %r213 = add i32 %r280, 1
  %r294 = add i32 %r213, 0
  br label %bb23

bb25:
  %r282 = add i32 1, 0
  br label %bb32

bb32:
  %r283 = phi i32 [ %r277, %bb25 ], [ %r289, %bb33 ]
  %r284 = phi i32 [ %r278, %bb25 ], [ %r290, %bb33 ]
  %r285 = phi i32 [ %r282, %bb25 ], [ %r291, %bb33 ]
  %r215 = load i32, i32* @m
  %r216 = icmp sle i32 %r285, %r215
  br i1 %r216, label %bb33, label %bb34

bb33:
  %r218 = call i32 @getint()
  %r289 = add i32 %r218, 0
  %r220 = call i32 @getint()
  %r290 = add i32 %r220, 0
  %r221 = call i32 @getint()
  %r224 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r289
  %r225 = getelementptr %array2D, %array2D* %r224, i32 0, i32 0
  %r226 = getelementptr [16 x i32 ], [16 x i32 ]* %r225, i32 0, i32 %r290
  store i32 %r221, i32* %r226
  %r228 = add i32 %r285, 1
  %r291 = add i32 %r228, 0
  br label %bb32

bb34:
  call void @Dijkstra()
  %r286 = add i32 1, 0
  br label %bb35

bb35:
  %r287 = phi i32 [ %r286, %bb34 ], [ %r288, %bb36 ]
  %r230 = load i32, i32* @n
  %r231 = icmp sle i32 %r287, %r230
  br i1 %r231, label %bb36, label %bb37

bb36:
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r287
  %r233 = load i32, i32* %r234
  call void @putint(i32 %r233)
  call void @putch(i32 32)
  %r236 = add i32 %r287, 1
  %r288 = add i32 %r236, 0
  br label %bb35

bb37:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 91)
  ret i32 0
}

