declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r159 = add i32 0, 0
  %r160 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r161 = add i32 0, 0
  %r162 = add i32 0, 0
  %r163 = add i32 0, 0
  %r164 = add i32 0, 0
  %r165 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r166 = add i32 0, 0
  %r167 = add i32 0, 0
  br label %bb1

bb1:
  %r168 = phi i32 [ %r167, %main ], [ %r185, %bb2 ]
  %r104 = icmp slt i32 %r168, 10
  br i1 %r104, label %bb2, label %bb3

bb2:
  %r106 = add i32 %r168, 1
  %r108 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r168
  store i32 %r106, i32* %r108
  %r110 = add i32 %r168, 1
  %r185 = add i32 %r110, 0
  br label %bb1

bb3:
  %r169 = add i32 10, 0
  %r116 = call i32 @getint()
  %r170 = add i32 %r116, 0
  %r118 = sub i32 %r169, 1
  %r171 = add i32 %r118, 0
  %r172 = add i32 0, 0
  %r121 = add i32 %r171, %r172
  %r122 = sdiv i32 %r121, 2
  %r173 = add i32 %r122, 0
  br label %bb4

bb4:
  %r174 = phi i32 [ %r171, %bb3 ], [ %r181, %bb10 ]
  %r175 = phi i32 [ %r173, %bb3 ], [ %r180, %bb10 ]
  %r176 = phi i32 [ %r172, %bb3 ], [ %r182, %bb10 ]
  %r125 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r175
  %r124 = load i32, i32* %r125
  %r127 = icmp ne i32 %r124, %r170
  br i1 %r127, label %bb7, label %bb6

bb7:
  %r130 = icmp slt i32 %r176, %r174
  br i1 %r130, label %bb5, label %bb6

bb5:
  %r133 = add i32 %r174, %r176
  %r134 = sdiv i32 %r133, 2
  %r180 = add i32 %r134, 0
  %r138 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r180
  %r137 = load i32, i32* %r138
  %r139 = icmp slt i32 %r170, %r137
  br i1 %r139, label %bb8, label %bb9

bb8:
  %r141 = sub i32 %r180, 1
  %r183 = add i32 %r141, 0
  br label %bb10

bb9:
  %r143 = add i32 %r180, 1
  %r184 = add i32 %r143, 0
  br label %bb10

bb10:
  %r181 = phi i32 [ %r183, %bb8 ], [ %r174, %bb9 ]
  %r182 = phi i32 [ %r176, %bb8 ], [ %r184, %bb9 ]
  br label %bb4

bb6:
  %r147 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r175
  %r146 = load i32, i32* %r147
  %r148 = icmp eq i32 %r170, %r146
  br i1 %r148, label %bb11, label %bb12

bb11:
  call void @putint(i32 %r170)
  br label %bb13

bb12:
  %r179 = add i32 0, 0
  call void @putint(i32 %r179)
  br label %bb13

bb13:
  %r177 = phi i32 [ %r170, %bb11 ], [ %r179, %bb12 ]
  %r178 = add i32 10, 0
  call void @putch(i32 %r178)
  call void @_sysy_stoptime(i32 49)
  ret i32 0
}

