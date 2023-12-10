declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r151 = add i32 0, 0
  %r152 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r153 = add i32 0, 0
  %r154 = add i32 0, 0
  %r155 = add i32 0, 0
  %r156 = add i32 0, 0
  %r157 = add i32 0, 0
  %r158 = add i32 0, 0
  %r159 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r160 = add i32 0, 0
  %r161 = add i32 0, 0
  br label %bb1

bb1:
  %r162 = phi i32 [ %r161, %main ], [ %r182, %bb2 ]
  %r104 = icmp slt i32 %r162, 10
  br i1 %r104, label %bb2, label %bb3

bb2:
  %r106 = add i32 %r162, 1
  %r108 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r162
  store i32 %r106, i32* %r108
  %r110 = add i32 %r162, 1
  %r182 = add i32 %r110, 0
  br label %bb1

bb3:
  %r163 = add i32 10, 0
  %r116 = call i32 @getint()
  %r164 = add i32 %r116, 0
  %r118 = sub i32 %r163, 1
  %r165 = add i32 %r118, 0
  %r166 = add i32 0, 0
  %r121 = add i32 %r165, %r166
  %r122 = sdiv i32 %r121, 2
  %r167 = add i32 %r122, 0
  %r168 = add i32 0, 0
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  br label %bb4

bb4:
  %r171 = phi i32 [ %r170, %bb3 ], [ %r177, %bb10 ]
  %r172 = phi i32 [ %r169, %bb3 ], [ %r179, %bb10 ]
  %r173 = phi i32 [ %r168, %bb3 ], [ %r178, %bb10 ]
  %r126 = icmp slt i32 %r172, 10
  br i1 %r126, label %bb7, label %bb6

bb7:
  %r128 = icmp eq i32 %r173, 0
  br i1 %r128, label %bb5, label %bb6

bb5:
  %r131 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r172
  %r130 = load i32, i32* %r131
  %r133 = icmp eq i32 %r130, %r164
  br i1 %r133, label %bb8, label %bb9

bb8:
  %r180 = add i32 1, 0
  %r181 = add i32 %r172, 0
  br label %bb10

bb9:
  br label %bb10

bb10:
  %r177 = phi i32 [ %r181, %bb8 ], [ %r171, %bb9 ]
  %r178 = phi i32 [ %r180, %bb8 ], [ %r173, %bb9 ]
  %r136 = add i32 %r172, 1
  %r179 = add i32 %r136, 0
  br label %bb4

bb6:
  %r138 = icmp eq i32 %r173, 1
  br i1 %r138, label %bb11, label %bb12

bb11:
  call void @putint(i32 %r171)
  br label %bb13

bb12:
  %r176 = add i32 0, 0
  call void @putint(i32 %r176)
  br label %bb13

bb13:
  %r174 = phi i32 [ %r164, %bb11 ], [ %r176, %bb12 ]
  %r175 = add i32 10, 0
  call void @putch(i32 %r175)
  call void @_sysy_stoptime(i32 53)
  ret i32 0
}

