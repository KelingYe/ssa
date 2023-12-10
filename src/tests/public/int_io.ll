declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@ascii_0 = global i32 48
define i32 @my_getint( ) {
my_getint:
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  br label %bb1

bb1:
  %r172 = phi i32 [ %r170, %my_getint ], [ %r180, %bb4 ]
  %r102 = icmp sgt i32 1, 0
  br i1 %r102, label %bb2, label %bb3

bb2:
  %r103 = call i32 @getch()
  %r104 = load i32, i32* @ascii_0
  %r105 = sub i32 %r103, %r104
  %r180 = add i32 %r105, 0
  %r107 = icmp slt i32 %r180, 0
  br i1 %r107, label %bb4, label %bb7

bb7:
  %r109 = icmp sgt i32 %r180, 9
  br i1 %r109, label %bb4, label %bb5

bb4:
  br label %bb1

bb5:
  br label %bb3

bb3:
  %r173 = phi i32 [ %r172, %bb1 ], [ %r180, %bb5 ]
  %r174 = add i32 %r173, 0
  br label %bb8

bb8:
  %r175 = phi i32 [ %r173, %bb3 ], [ %r178, %bb13 ]
  %r176 = phi i32 [ %r174, %bb3 ], [ %r179, %bb13 ]
  %r111 = icmp sgt i32 1, 0
  br i1 %r111, label %bb9, label %bb10

bb9:
  %r112 = call i32 @getch()
  %r113 = load i32, i32* @ascii_0
  %r114 = sub i32 %r112, %r113
  %r178 = add i32 %r114, 0
  %r116 = icmp sge i32 %r178, 0
  br i1 %r116, label %bb14, label %bb12

bb14:
  %r118 = icmp sle i32 %r178, 9
  br i1 %r118, label %bb11, label %bb12

bb11:
  %r120 = mul i32 %r176, 10
  %r122 = add i32 %r120, %r178
  %r179 = add i32 %r122, 0
  br label %bb13

bb12:
  br label %bb10

bb13:
  br label %bb8

bb10:
  %r177 = phi i32 [ %r175, %bb8 ], [ %r178, %bb12 ]
  ret i32 %r176
}

define i32 @mod( i32 %r124, i32 %r126 ) {
mod:
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 %r124, 0
  %r186 = add i32 %r126, 0
  br label %bb18

bb18:
  %r131 = sdiv i32 %r185, %r186
  %r133 = mul i32 %r131, %r186
  %r134 = sub i32 %r185, %r133
  ret i32 %r134
}

define void @my_putint( i32 %r135 ) {
my_putint:
  %r189 = add i32 0, 0
  %r137 = alloca [ 16 x i32 ]
  %r190 = add i32 0, 0
  %r191 = add i32 %r135, 0
  br label %bb19

bb19:
  %r192 = add i32 0, 0
  br label %bb20

bb20:
  %r193 = phi i32 [ %r192, %bb19 ], [ %r198, %bb21 ]
  %r194 = phi i32 [ %r191, %bb19 ], [ %r197, %bb21 ]
  %r140 = icmp sgt i32 %r194, 0
  br i1 %r140, label %bb21, label %bb22

bb21:
  %r141 = call i32 @mod(i32 %r194, i32 10)
  %r143 = load i32, i32* @ascii_0
  %r144 = add i32 %r141, %r143
  %r146 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r193
  store i32 %r144, i32* %r146
  %r148 = sdiv i32 %r194, 10
  %r197 = add i32 %r148, 0
  %r150 = add i32 %r193, 1
  %r198 = add i32 %r150, 0
  br label %bb20

bb22:
  br label %bb23

bb23:
  %r195 = phi i32 [ %r193, %bb22 ], [ %r196, %bb24 ]
  %r152 = icmp sgt i32 %r195, 0
  br i1 %r152, label %bb24, label %bb25

bb24:
  %r154 = sub i32 %r195, 1
  %r196 = add i32 %r154, 0
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r196
  %r156 = load i32, i32* %r157
  call void @putch(i32 %r156)
  br label %bb23

bb25:
  ret void
}

define i32 @main( ) {
main:
  %r201 = add i32 0, 0
  %r202 = add i32 0, 0
  call void @_sysy_starttime(i32 51)
  %r159 = call i32 @my_getint()
  %r203 = add i32 %r159, 0
  br label %bb26

bb26:
  %r204 = phi i32 [ %r203, %main ], [ %r207, %bb27 ]
  %r205 = phi i32 [ %r202, %main ], [ %r206, %bb27 ]
  %r161 = icmp sgt i32 %r204, 0
  br i1 %r161, label %bb27, label %bb28

bb27:
  %r163 = call i32 @my_getint()
  %r206 = add i32 %r163, 0
  call void @my_putint(i32 %r206)
  call void @putch(i32 10)
  %r166 = sub i32 %r204, 1
  %r207 = add i32 %r166, 0
  br label %bb26

bb28:
  call void @_sysy_stoptime(i32 58)
  ret i32 0
}

