declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@TAPE_LEN = global i32 65536
@BUFFER_LEN = global i32 32768
@tape = global [ 65536 x i32 ] zeroinitializer
@program = global [ 32768 x i32 ] zeroinitializer
@ptr = global i32 0
define void @read_program( ) {
read_program:
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r102 = call i32 @getint()
  %r186 = add i32 %r102, 0
  br label %bb1

bb1:
  %r187 = phi i32 [ %r185, %read_program ], [ %r188, %bb2 ]
  %r105 = icmp slt i32 %r187, %r186
  br i1 %r105, label %bb2, label %bb3

bb2:
  %r106 = call i32 @getch()
  %r108 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r187
  store i32 %r106, i32* %r108
  %r110 = add i32 %r187, 1
  %r188 = add i32 %r110, 0
  br label %bb1

bb3:
  %r112 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r187
  store i32 0, i32* %r112
  ret void
}

define void @interpret( i32* %r113 ) {
interpret:
  %r192 = add i32 0, 0
  %r193 = add i32 0, 0
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  br label %bb4

bb4:
  %r196 = phi i32 [ %r192, %interpret ], [ %r210, %bb27 ]
  %r197 = phi i32 [ %r195, %interpret ], [ %r213, %bb27 ]
  %r198 = phi i32 [ %r193, %interpret ], [ %r212, %bb27 ]
  %r119 = getelementptr i32, i32* %r113, i32 %r197
  %r118 = load i32, i32* %r119
  %r120 = icmp ne i32 %r118, 0
  br i1 %r120, label %bb5, label %bb6

bb5:
  %r123 = getelementptr i32, i32* %r113, i32 %r197
  %r122 = load i32, i32* %r123
  %r199 = add i32 %r122, 0
  %r125 = icmp eq i32 %r199, 62
  br i1 %r125, label %bb7, label %bb8

bb7:
  %r126 = load i32, i32* @ptr
  %r127 = add i32 %r126, 1
  store i32 %r127, i32* @ptr
  br label %bb9

bb8:
  br label %bb9

bb9:
  %r129 = icmp eq i32 %r199, 60
  br i1 %r129, label %bb10, label %bb11

bb10:
  %r130 = load i32, i32* @ptr
  %r131 = sub i32 %r130, 1
  store i32 %r131, i32* @ptr
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r133 = icmp eq i32 %r199, 43
  br i1 %r133, label %bb13, label %bb14

bb13:
  %r134 = load i32, i32* @ptr
  %r136 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r134
  %r135 = load i32, i32* %r136
  %r137 = add i32 %r135, 1
  %r138 = load i32, i32* @ptr
  %r139 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r138
  store i32 %r137, i32* %r139
  br label %bb15

bb14:
  br label %bb15

bb15:
  %r141 = icmp eq i32 %r199, 45
  br i1 %r141, label %bb16, label %bb17

bb16:
  %r142 = load i32, i32* @ptr
  %r144 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r142
  %r143 = load i32, i32* %r144
  %r145 = sub i32 %r143, 1
  %r146 = load i32, i32* @ptr
  %r147 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r146
  store i32 %r145, i32* %r147
  br label %bb18

bb17:
  br label %bb18

bb18:
  %r149 = icmp eq i32 %r199, 46
  br i1 %r149, label %bb19, label %bb20

bb19:
  %r150 = load i32, i32* @ptr
  %r152 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r150
  %r151 = load i32, i32* %r152
  call void @putch(i32 %r151)
  br label %bb21

bb20:
  br label %bb21

bb21:
  %r154 = icmp eq i32 %r199, 44
  br i1 %r154, label %bb22, label %bb23

bb22:
  %r155 = call i32 @getch()
  %r156 = load i32, i32* @ptr
  %r157 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r156
  store i32 %r155, i32* %r157
  br label %bb24

bb23:
  br label %bb24

bb24:
  %r159 = icmp eq i32 %r199, 93
  br i1 %r159, label %bb28, label %bb26

bb28:
  %r160 = load i32, i32* @ptr
  %r162 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r160
  %r161 = load i32, i32* %r162
  %r163 = icmp ne i32 %r161, 0
  br i1 %r163, label %bb25, label %bb26

bb25:
  %r200 = add i32 1, 0
  br label %bb29

bb29:
  %r201 = phi i32 [ %r199, %bb25 ], [ %r205, %bb37 ]
  %r202 = phi i32 [ %r197, %bb25 ], [ %r204, %bb37 ]
  %r203 = phi i32 [ %r200, %bb25 ], [ %r207, %bb37 ]
  %r165 = icmp sgt i32 %r203, 0
  br i1 %r165, label %bb30, label %bb31

bb30:
  %r167 = sub i32 %r202, 1
  %r204 = add i32 %r167, 0
  %r170 = getelementptr i32, i32* %r113, i32 %r204
  %r169 = load i32, i32* %r170
  %r205 = add i32 %r169, 0
  %r172 = icmp eq i32 %r205, 91
  br i1 %r172, label %bb32, label %bb33

bb32:
  %r174 = sub i32 %r203, 1
  %r209 = add i32 %r174, 0
  br label %bb34

bb33:
  br label %bb34

bb34:
  %r206 = phi i32 [ %r209, %bb32 ], [ %r203, %bb33 ]
  %r176 = icmp eq i32 %r205, 93
  br i1 %r176, label %bb35, label %bb36

bb35:
  %r178 = add i32 %r206, 1
  %r208 = add i32 %r178, 0
  br label %bb37

bb36:
  br label %bb37

bb37:
  %r207 = phi i32 [ %r208, %bb35 ], [ %r206, %bb36 ]
  br label %bb29

bb31:
  br label %bb27

bb26:
  br label %bb27

bb27:
  %r210 = phi i32 [ %r201, %bb31 ], [ %r199, %bb26 ]
  %r211 = phi i32 [ %r202, %bb31 ], [ %r197, %bb26 ]
  %r212 = phi i32 [ %r203, %bb31 ], [ %r198, %bb26 ]
  %r180 = add i32 %r211, 1
  %r213 = add i32 %r180, 0
  br label %bb4

bb6:
  ret void
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 76)
  call void @read_program()
  call void @interpret(i32* @program)
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 80)
  ret i32 0
}

