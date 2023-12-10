declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
@m = global i32 0
@to = global [ 5005 x i32 ] zeroinitializer
@next = global [ 5005 x i32 ] zeroinitializer
@head = global [ 1005 x i32 ] zeroinitializer
@cnt = global i32 0
@que = global [ 1005 x i32 ] zeroinitializer
@h = global i32 0
@tail = global i32 0
@inq = global [ 1005 x i32 ] zeroinitializer
define i32 @quickread( ) {
quickread:
  %r257 = add i32 0, 0
  %r258 = add i32 0, 0
  %r259 = add i32 0, 0
  %r101 = call i32 @getch()
  %r260 = add i32 %r101, 0
  %r261 = add i32 0, 0
  %r262 = add i32 0, 0
  br label %bb1

bb1:
  %r263 = phi i32 [ %r260, %quickread ], [ %r266, %bb7 ]
  %r264 = phi i32 [ %r262, %quickread ], [ %r265, %bb7 ]
  %r105 = icmp slt i32 %r263, 48
  br i1 %r105, label %bb2, label %bb4

bb4:
  %r107 = icmp sgt i32 %r263, 57
  br i1 %r107, label %bb2, label %bb3

bb2:
  %r109 = icmp eq i32 %r263, 45
  br i1 %r109, label %bb5, label %bb6

bb5:
  %r267 = add i32 1, 0
  br label %bb7

bb6:
  br label %bb7

bb7:
  %r265 = phi i32 [ %r267, %bb5 ], [ %r264, %bb6 ]
  %r110 = call i32 @getch()
  %r266 = add i32 %r110, 0
  br label %bb1

bb3:
  br label %bb8

bb8:
  %r268 = phi i32 [ %r263, %bb3 ], [ %r271, %bb9 ]
  %r269 = phi i32 [ %r261, %bb3 ], [ %r270, %bb9 ]
  %r112 = icmp sge i32 %r268, 48
  br i1 %r112, label %bb11, label %bb10

bb11:
  %r114 = icmp sle i32 %r268, 57
  br i1 %r114, label %bb9, label %bb10

bb9:
  %r116 = mul i32 %r269, 10
  %r118 = add i32 %r116, %r268
  %r119 = sub i32 %r118, 48
  %r270 = add i32 %r119, 0
  %r120 = call i32 @getch()
  %r271 = add i32 %r120, 0
  br label %bb8

bb10:
  %r122 = icmp ne i32 %r264, 0
  br i1 %r122, label %bb12, label %bb13

bb12:
  %r124 = sub i32 0, %r269
  ret i32 %r124
bb13:
  ret i32 %r269
}

define void @addedge( i32 %r126, i32 %r128 ) {
addedge:
  %r274 = add i32 0, 0
  %r275 = add i32 0, 0
  %r276 = add i32 %r126, 0
  %r277 = add i32 %r128, 0
  br label %bb17

bb17:
  %r131 = load i32, i32* @cnt
  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r131
  store i32 %r277, i32* %r132
  %r135 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r276
  %r134 = load i32, i32* %r135
  %r136 = load i32, i32* @cnt
  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r136
  store i32 %r134, i32* %r137
  %r138 = load i32, i32* @cnt
  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r276
  store i32 %r138, i32* %r140
  %r141 = load i32, i32* @cnt
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* @cnt
  %r144 = load i32, i32* @cnt
  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r144
  store i32 %r276, i32* %r145
  %r148 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r277
  %r147 = load i32, i32* %r148
  %r149 = load i32, i32* @cnt
  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r149
  store i32 %r147, i32* %r150
  %r151 = load i32, i32* @cnt
  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r277
  store i32 %r151, i32* %r153
  %r154 = load i32, i32* @cnt
  %r155 = add i32 %r154, 1
  store i32 %r155, i32* @cnt
  ret void
}

define void @init( ) {
init:
  %r279 = add i32 0, 0
  %r280 = add i32 0, 0
  br label %bb18

bb18:
  %r281 = phi i32 [ %r280, %init ], [ %r282, %bb19 ]
  %r158 = icmp slt i32 %r281, 1005
  br i1 %r158, label %bb19, label %bb20

bb19:
  %r159 = sub i32 0, 1
  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r281
  store i32 %r159, i32* %r161
  %r163 = add i32 %r281, 1
  %r282 = add i32 %r163, 0
  br label %bb18

bb20:
  ret void
}

define void @inqueue( i32 %r164 ) {
inqueue:
  %r284 = add i32 0, 0
  %r285 = add i32 %r164, 0
  br label %bb21

bb21:
  %r167 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r285
  store i32 1, i32* %r167
  %r168 = load i32, i32* @tail
  %r169 = add i32 %r168, 1
  store i32 %r169, i32* @tail
  %r171 = load i32, i32* @tail
  %r172 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r171
  store i32 %r285, i32* %r172
  ret void
}

define i32 @popqueue( ) {
popqueue:
  %r287 = add i32 0, 0
  %r173 = load i32, i32* @h
  %r174 = add i32 %r173, 1
  store i32 %r174, i32* @h
  %r176 = load i32, i32* @h
  %r178 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r176
  %r177 = load i32, i32* %r178
  %r288 = add i32 %r177, 0
  %r179 = load i32, i32* @h
  %r181 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r179
  %r180 = load i32, i32* %r181
  ret i32 %r180
}

define i32 @same( i32 %r182, i32 %r184 ) {
same:
  %r295 = add i32 0, 0
  %r296 = add i32 0, 0
  %r297 = add i32 0, 0
  %r298 = add i32 0, 0
  %r299 = add i32 0, 0
  %r300 = add i32 0, 0
  %r301 = add i32 %r182, 0
  %r302 = add i32 %r184, 0
  br label %bb22

bb22:
  store i32 0, i32* @h
  store i32 0, i32* @tail
  call void @inqueue(i32 %r301)
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 0, 0
  %r306 = add i32 0, 0
  br label %bb23

bb23:
  %r307 = phi i32 [ %r304, %bb22 ], [ %r316, %bb31 ]
  %r308 = phi i32 [ %r306, %bb22 ], [ %r319, %bb31 ]
  %r309 = phi i32 [ %r303, %bb22 ], [ %r317, %bb31 ]
  %r310 = phi i32 [ %r305, %bb22 ], [ %r320, %bb31 ]
  %r191 = load i32, i32* @h
  %r192 = load i32, i32* @tail
  %r193 = icmp slt i32 %r191, %r192
  br i1 %r193, label %bb24, label %bb25

bb24:
  %r194 = call i32 @popqueue()
  %r316 = add i32 %r194, 0
  %r197 = icmp eq i32 %r316, %r302
  br i1 %r197, label %bb26, label %bb27

bb26:
  %r323 = add i32 1, 0
  br label %bb28

bb27:
  br label %bb28

bb28:
  %r317 = phi i32 [ %r323, %bb26 ], [ %r309, %bb27 ]
  %r200 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r316
  %r199 = load i32, i32* %r200
  %r318 = add i32 %r199, 0
  br label %bb29

bb29:
  %r319 = phi i32 [ %r308, %bb28 ], [ %r321, %bb34 ]
  %r320 = phi i32 [ %r318, %bb28 ], [ %r322, %bb34 ]
  %r202 = sub i32 0, 1
  %r203 = icmp ne i32 %r320, %r202
  br i1 %r203, label %bb30, label %bb31

bb30:
  %r206 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r320
  %r205 = load i32, i32* %r206
  %r321 = add i32 %r205, 0
  %r209 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r321
  %r208 = load i32, i32* %r209
  %r210 = icmp eq i32 %r208, 0
  br i1 %r210, label %bb32, label %bb33

bb32:
  %r213 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r320
  %r212 = load i32, i32* %r213
  call void @inqueue(i32 %r212)
  br label %bb34

bb33:
  br label %bb34

bb34:
  %r216 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r320
  %r215 = load i32, i32* %r216
  %r322 = add i32 %r215, 0
  br label %bb29

bb31:
  br label %bb23

bb25:
  %r311 = add i32 0, 0
  br label %bb35

bb35:
  %r312 = phi i32 [ %r308, %bb25 ], [ %r314, %bb36 ]
  %r313 = phi i32 [ %r311, %bb25 ], [ %r315, %bb36 ]
  %r218 = load i32, i32* @tail
  %r219 = icmp sle i32 %r313, %r218
  br i1 %r219, label %bb36, label %bb37

bb36:
  %r222 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r313
  %r221 = load i32, i32* %r222
  %r314 = add i32 %r221, 0
  %r224 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r314
  store i32 0, i32* %r224
  %r226 = add i32 %r313, 1
  %r315 = add i32 %r226, 0
  br label %bb35

bb37:
  ret i32 %r309
}

define i32 @main( ) {
main:
  %r327 = add i32 0, 0
  %r328 = add i32 0, 0
  %r329 = add i32 0, 0
  %r228 = call i32 @quickread()
  store i32 %r228, i32* @n
  %r229 = call i32 @quickread()
  store i32 %r229, i32* @m
  call void @_sysy_starttime(i32 97)
  call void @init()
  %r330 = add i32 0, 0
  %r331 = add i32 0, 0
  %r332 = add i32 0, 0
  br label %bb38

bb38:
  %r333 = phi i32 [ %r330, %main ], [ %r337, %bb47 ]
  %r334 = phi i32 [ %r332, %main ], [ %r338, %bb47 ]
  %r335 = phi i32 [ %r331, %main ], [ %r339, %bb47 ]
  %r233 = load i32, i32* @m
  %r234 = icmp ne i32 %r233, 0
  br i1 %r234, label %bb39, label %bb40

bb39:
  %r235 = call i32 @getch()
  %r336 = add i32 %r235, 0
  br label %bb41

bb41:
  %r337 = phi i32 [ %r336, %bb39 ], [ %r344, %bb42 ]
  %r237 = icmp ne i32 %r337, 81
  br i1 %r237, label %bb44, label %bb43

bb44:
  %r239 = icmp ne i32 %r337, 85
  br i1 %r239, label %bb42, label %bb43

bb42:
  %r240 = call i32 @getch()
  %r344 = add i32 %r240, 0
  br label %bb41

bb43:
  %r242 = icmp eq i32 %r337, 81
  br i1 %r242, label %bb45, label %bb46

bb45:
  %r243 = call i32 @quickread()
  %r340 = add i32 %r243, 0
  %r244 = call i32 @quickread()
  %r341 = add i32 %r244, 0
  %r245 = call i32 @same(i32 %r340, i32 %r341)
  call void @putint(i32 %r245)
  call void @putch(i32 10)
  br label %bb47

bb46:
  %r248 = call i32 @quickread()
  %r342 = add i32 %r248, 0
  %r249 = call i32 @quickread()
  %r343 = add i32 %r249, 0
  call void @addedge(i32 %r342, i32 %r343)
  br label %bb47

bb47:
  %r338 = phi i32 [ %r341, %bb45 ], [ %r343, %bb46 ]
  %r339 = phi i32 [ %r340, %bb45 ], [ %r342, %bb46 ]
  %r252 = load i32, i32* @m
  %r253 = sub i32 %r252, 1
  store i32 %r253, i32* @m
  br label %bb38

bb40:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

