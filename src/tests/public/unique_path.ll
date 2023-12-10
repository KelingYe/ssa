declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @uniquePaths( i32 %r100, i32 %r102 ) {
uniquePaths:
  %r190 = add i32 0, 0
  %r191 = add i32 0, 0
  %r108 = alloca [ 9 x i32 ]
  %r192 = add i32 0, 0
  %r193 = add i32 0, 0
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  %r196 = add i32 0, 0
  %r197 = add i32 %r100, 0
  %r198 = add i32 %r102, 0
  br label %bb1

bb1:
  %r105 = icmp eq i32 %r197, 1
  br i1 %r105, label %bb2, label %bb5

bb5:
  %r107 = icmp eq i32 %r198, 1
  br i1 %r107, label %bb2, label %bb3

bb2:
  ret i32 1
bb3:
  br label %bb4

bb4:
  %r199 = add i32 0, 0
  br label %bb6

bb6:
  %r200 = phi i32 [ %r199, %bb4 ], [ %r224, %bb7 ]
  %r201 = phi i32 [ %r194, %bb4 ], [ %r223, %bb7 ]
  %r116 = icmp slt i32 %r200, %r197
  br i1 %r116, label %bb7, label %bb8

bb7:
  %r118 = mul i32 %r200, 3
  %r120 = add i32 %r118, %r198
  %r121 = sub i32 %r120, 1
  %r223 = add i32 %r121, 0
  %r123 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r223
  store i32 1, i32* %r123
  %r125 = add i32 %r200, 1
  %r224 = add i32 %r125, 0
  br label %bb6

bb8:
  %r202 = add i32 0, 0
  br label %bb9

bb9:
  %r203 = phi i32 [ %r202, %bb8 ], [ %r222, %bb10 ]
  %r204 = phi i32 [ %r201, %bb8 ], [ %r221, %bb10 ]
  %r128 = icmp slt i32 %r203, %r198
  br i1 %r128, label %bb10, label %bb11

bb10:
  %r130 = sub i32 %r197, 1
  %r131 = mul i32 %r130, 3
  %r133 = add i32 %r131, %r203
  %r221 = add i32 %r133, 0
  %r135 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r221
  store i32 1, i32* %r135
  %r137 = add i32 %r203, 1
  %r222 = add i32 %r137, 0
  br label %bb9

bb11:
  %r139 = sub i32 %r197, 2
  %r205 = add i32 %r139, 0
  br label %bb12

bb12:
  %r206 = phi i32 [ %r193, %bb11 ], [ %r212, %bb17 ]
  %r207 = phi i32 [ %r205, %bb11 ], [ %r216, %bb17 ]
  %r208 = phi i32 [ %r196, %bb11 ], [ %r213, %bb17 ]
  %r209 = phi i32 [ %r195, %bb11 ], [ %r214, %bb17 ]
  %r210 = phi i32 [ %r204, %bb11 ], [ %r215, %bb17 ]
  %r141 = sub i32 0, 1
  %r142 = icmp sgt i32 %r207, %r141
  br i1 %r142, label %bb13, label %bb14

bb13:
  %r144 = sub i32 %r198, 2
  %r211 = add i32 %r144, 0
  br label %bb15

bb15:
  %r212 = phi i32 [ %r211, %bb13 ], [ %r220, %bb16 ]
  %r213 = phi i32 [ %r208, %bb13 ], [ %r219, %bb16 ]
  %r214 = phi i32 [ %r209, %bb13 ], [ %r218, %bb16 ]
  %r215 = phi i32 [ %r210, %bb13 ], [ %r217, %bb16 ]
  %r146 = sub i32 0, 1
  %r147 = icmp sgt i32 %r212, %r146
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r149 = mul i32 %r207, 3
  %r151 = add i32 %r149, %r212
  %r217 = add i32 %r151, 0
  %r153 = add i32 %r207, 1
  %r154 = mul i32 %r153, 3
  %r156 = add i32 %r154, %r212
  %r218 = add i32 %r156, 0
  %r158 = mul i32 %r207, 3
  %r160 = add i32 %r158, %r212
  %r161 = add i32 %r160, 1
  %r219 = add i32 %r161, 0
  %r164 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r218
  %r163 = load i32, i32* %r164
  %r167 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r219
  %r166 = load i32, i32* %r167
  %r168 = add i32 %r163, %r166
  %r170 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r217
  store i32 %r168, i32* %r170
  %r172 = sub i32 %r212, 1
  %r220 = add i32 %r172, 0
  br label %bb15

bb17:
  %r174 = sub i32 %r207, 1
  %r216 = add i32 %r174, 0
  br label %bb12

bb14:
  %r176 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 0
  %r175 = load i32, i32* %r176
  ret i32 %r175
}

define i32 @main( ) {
main:
  %r227 = add i32 0, 0
  %r228 = add i32 0, 0
  call void @_sysy_starttime(i32 40)
  %r229 = add i32 3, 0
  %r179 = call i32 @uniquePaths(i32 %r229, i32 %r229)
  %r230 = add i32 %r179, 0
  call void @_sysy_stoptime(i32 45)
  ret i32 %r230
}

