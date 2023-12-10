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
@vis = global [ 1005 x i32 ] zeroinitializer
define i32 @quickread( ) {
quickread:
  %r232 = add i32 0, 0
  %r233 = add i32 0, 0
  %r234 = add i32 0, 0
  %r101 = call i32 @getch()
  %r235 = add i32 %r101, 0
  %r236 = add i32 0, 0
  %r237 = add i32 0, 0
  br label %bb1

bb1:
  %r238 = phi i32 [ %r235, %quickread ], [ %r241, %bb7 ]
  %r239 = phi i32 [ %r237, %quickread ], [ %r240, %bb7 ]
  %r105 = icmp slt i32 %r238, 48
  br i1 %r105, label %bb2, label %bb4

bb4:
  %r107 = icmp sgt i32 %r238, 57
  br i1 %r107, label %bb2, label %bb3

bb2:
  %r109 = icmp eq i32 %r238, 45
  br i1 %r109, label %bb5, label %bb6

bb5:
  %r242 = add i32 1, 0
  br label %bb7

bb6:
  br label %bb7

bb7:
  %r240 = phi i32 [ %r242, %bb5 ], [ %r239, %bb6 ]
  %r110 = call i32 @getch()
  %r241 = add i32 %r110, 0
  br label %bb1

bb3:
  br label %bb8

bb8:
  %r243 = phi i32 [ %r238, %bb3 ], [ %r246, %bb9 ]
  %r244 = phi i32 [ %r236, %bb3 ], [ %r245, %bb9 ]
  %r112 = icmp sge i32 %r243, 48
  br i1 %r112, label %bb11, label %bb10

bb11:
  %r114 = icmp sle i32 %r243, 57
  br i1 %r114, label %bb9, label %bb10

bb9:
  %r116 = mul i32 %r244, 10
  %r118 = add i32 %r116, %r243
  %r119 = sub i32 %r118, 48
  %r245 = add i32 %r119, 0
  %r120 = call i32 @getch()
  %r246 = add i32 %r120, 0
  br label %bb8

bb10:
  %r122 = icmp ne i32 %r239, 0
  br i1 %r122, label %bb12, label %bb13

bb12:
  %r124 = sub i32 0, %r244
  ret i32 %r124
bb13:
  ret i32 %r244
}

define void @addedge( i32 %r126, i32 %r128 ) {
addedge:
  %r249 = add i32 0, 0
  %r250 = add i32 0, 0
  %r251 = add i32 %r126, 0
  %r252 = add i32 %r128, 0
  br label %bb17

bb17:
  %r131 = load i32, i32* @cnt
  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r131
  store i32 %r252, i32* %r132
  %r135 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r251
  %r134 = load i32, i32* %r135
  %r136 = load i32, i32* @cnt
  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r136
  store i32 %r134, i32* %r137
  %r138 = load i32, i32* @cnt
  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r251
  store i32 %r138, i32* %r140
  %r141 = load i32, i32* @cnt
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* @cnt
  %r144 = load i32, i32* @cnt
  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r144
  store i32 %r251, i32* %r145
  %r148 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r252
  %r147 = load i32, i32* %r148
  %r149 = load i32, i32* @cnt
  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r149
  store i32 %r147, i32* %r150
  %r151 = load i32, i32* @cnt
  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r252
  store i32 %r151, i32* %r153
  %r154 = load i32, i32* @cnt
  %r155 = add i32 %r154, 1
  store i32 %r155, i32* @cnt
  ret void
}

define void @init( ) {
init:
  %r254 = add i32 0, 0
  %r255 = add i32 0, 0
  br label %bb18

bb18:
  %r256 = phi i32 [ %r255, %init ], [ %r257, %bb19 ]
  %r158 = icmp slt i32 %r256, 1005
  br i1 %r158, label %bb19, label %bb20

bb19:
  %r159 = sub i32 0, 1
  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r256
  store i32 %r159, i32* %r161
  %r163 = add i32 %r256, 1
  %r257 = add i32 %r163, 0
  br label %bb18

bb20:
  ret void
}

define void @clear( ) {
clear:
  %r259 = add i32 0, 0
  %r260 = add i32 1, 0
  br label %bb21

bb21:
  %r261 = phi i32 [ %r260, %clear ], [ %r262, %bb22 ]
  %r166 = load i32, i32* @n
  %r167 = icmp sle i32 %r261, %r166
  br i1 %r167, label %bb22, label %bb23

bb22:
  %r169 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r261
  store i32 0, i32* %r169
  %r171 = add i32 %r261, 1
  %r262 = add i32 %r171, 0
  br label %bb21

bb23:
  ret void
}

define i32 @same( i32 %r172, i32 %r174 ) {
same:
  %r267 = add i32 0, 0
  %r268 = add i32 0, 0
  %r269 = add i32 0, 0
  %r270 = add i32 0, 0
  %r271 = add i32 %r172, 0
  %r272 = add i32 %r174, 0
  br label %bb24

bb24:
  %r177 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r271
  store i32 1, i32* %r177
  %r180 = icmp eq i32 %r271, %r272
  br i1 %r180, label %bb25, label %bb26

bb25:
  ret i32 1
bb26:
  br label %bb27

bb27:
  %r184 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r271
  %r183 = load i32, i32* %r184
  %r273 = add i32 %r183, 0
  br label %bb28

bb28:
  %r274 = phi i32 [ %r273, %bb27 ], [ %r277, %bb33 ]
  %r275 = phi i32 [ %r270, %bb27 ], [ %r276, %bb33 ]
  %r186 = sub i32 0, 1
  %r187 = icmp ne i32 %r274, %r186
  br i1 %r187, label %bb29, label %bb30

bb29:
  %r191 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r274
  %r190 = load i32, i32* %r191
  %r276 = add i32 %r190, 0
  %r194 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r276
  %r193 = load i32, i32* %r194
  %r195 = icmp eq i32 %r193, 0
  br i1 %r195, label %bb34, label %bb32

bb34:
  %r196 = call i32 @same(i32 %r276, i32 %r272)
  %r199 = icmp ne i32 %r196, 0
  br i1 %r199, label %bb31, label %bb32

bb31:
  ret i32 1
bb32:
  br label %bb33

bb33:
  %r202 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r274
  %r201 = load i32, i32* %r202
  %r277 = add i32 %r201, 0
  br label %bb28

bb30:
  ret i32 0
}

define i32 @main( ) {
main:
  %r281 = add i32 0, 0
  %r282 = add i32 0, 0
  %r283 = add i32 0, 0
  call void @_sysy_starttime(i32 74)
  %r203 = call i32 @quickread()
  store i32 %r203, i32* @n
  %r204 = call i32 @quickread()
  store i32 %r204, i32* @m
  call void @init()
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r286 = add i32 0, 0
  br label %bb37

bb37:
  %r287 = phi i32 [ %r284, %main ], [ %r291, %bb46 ]
  %r288 = phi i32 [ %r286, %main ], [ %r292, %bb46 ]
  %r289 = phi i32 [ %r285, %main ], [ %r293, %bb46 ]
  %r208 = load i32, i32* @m
  %r209 = icmp ne i32 %r208, 0
  br i1 %r209, label %bb38, label %bb39

bb38:
  %r210 = call i32 @getch()
  %r290 = add i32 %r210, 0
  br label %bb40

bb40:
  %r291 = phi i32 [ %r290, %bb38 ], [ %r298, %bb41 ]
  %r212 = icmp ne i32 %r291, 81
  br i1 %r212, label %bb43, label %bb42

bb43:
  %r214 = icmp ne i32 %r291, 85
  br i1 %r214, label %bb41, label %bb42

bb41:
  %r215 = call i32 @getch()
  %r298 = add i32 %r215, 0
  br label %bb40

bb42:
  %r217 = icmp eq i32 %r291, 81
  br i1 %r217, label %bb44, label %bb45

bb44:
  %r218 = call i32 @quickread()
  %r294 = add i32 %r218, 0
  %r219 = call i32 @quickread()
  %r295 = add i32 %r219, 0
  call void @clear()
  %r220 = call i32 @same(i32 %r294, i32 %r295)
  call void @putint(i32 %r220)
  call void @putch(i32 10)
  br label %bb46

bb45:
  %r223 = call i32 @quickread()
  %r296 = add i32 %r223, 0
  %r224 = call i32 @quickread()
  %r297 = add i32 %r224, 0
  call void @addedge(i32 %r296, i32 %r297)
  br label %bb46

bb46:
  %r292 = phi i32 [ %r295, %bb44 ], [ %r297, %bb45 ]
  %r293 = phi i32 [ %r294, %bb44 ], [ %r296, %bb45 ]
  %r227 = load i32, i32* @m
  %r228 = sub i32 %r227, 1
  store i32 %r228, i32* @m
  br label %bb37

bb39:
  call void @_sysy_stoptime(i32 96)
  ret i32 0
}

