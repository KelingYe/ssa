declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@N = global i32 0
define i32 @insert( i32* %r100, i32 %r101 ) {
insert:
  %r162 = add i32 0, 0
  %r163 = add i32 0, 0
  %r164 = add i32 0, 0
  %r165 = add i32 0, 0
  %r166 = add i32 %r101, 0
  br label %bb1

bb1:
  %r167 = add i32 0, 0
  br label %bb2

bb2:
  %r168 = phi i32 [ %r167, %bb1 ], [ %r174, %bb3 ]
  %r108 = getelementptr i32, i32* %r100, i32 %r168
  %r107 = load i32, i32* %r108
  %r109 = icmp sgt i32 %r166, %r107
  br i1 %r109, label %bb5, label %bb4

bb5:
  %r111 = load i32, i32* @N
  %r112 = icmp slt i32 %r168, %r111
  br i1 %r112, label %bb3, label %bb4

bb3:
  %r114 = add i32 %r168, 1
  %r174 = add i32 %r114, 0
  br label %bb2

bb4:
  %r115 = load i32, i32* @N
  %r169 = add i32 %r115, 0
  br label %bb6

bb6:
  %r170 = phi i32 [ %r169, %bb4 ], [ %r173, %bb7 ]
  %r171 = phi i32 [ %r165, %bb4 ], [ %r172, %bb7 ]
  %r118 = icmp sgt i32 %r170, %r168
  br i1 %r118, label %bb7, label %bb8

bb7:
  %r121 = sub i32 %r170, 1
  %r172 = add i32 %r121, 0
  %r124 = getelementptr i32, i32* %r100, i32 %r172
  %r123 = load i32, i32* %r124
  %r126 = getelementptr i32, i32* %r100, i32 %r170
  store i32 %r123, i32* %r126
  %r129 = getelementptr i32, i32* %r100, i32 %r168
  store i32 %r166, i32* %r129
  %r131 = sub i32 %r170, 1
  %r173 = add i32 %r131, 0
  br label %bb6

bb8:
  ret i32 0
}

define i32 @main( ) {
main:
  %r132 = alloca [ 11 x i32 ]
  %r177 = add i32 0, 0
  %r178 = add i32 0, 0
  call void @_sysy_starttime(i32 27)
  store i32 10, i32* @N
  %r133 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 0
  store i32 1, i32* %r133
  %r134 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 1
  store i32 3, i32* %r134
  %r135 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 2
  store i32 4, i32* %r135
  %r136 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 3
  store i32 7, i32* %r136
  %r137 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 4
  store i32 8, i32* %r137
  %r138 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 5
  store i32 11, i32* %r138
  %r139 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 6
  store i32 13, i32* %r139
  %r140 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 7
  store i32 18, i32* %r140
  %r141 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 8
  store i32 56, i32* %r141
  %r142 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 9
  store i32 78, i32* %r142
  %r179 = add i32 0, 0
  %r145 = call i32 @getint()
  %r180 = add i32 %r145, 0
  %r146 = call i32 @insert(i32* %r132, i32 %r180)
  %r181 = add i32 %r146, 0
  br label %bb9

bb9:
  %r182 = phi i32 [ %r179, %main ], [ %r186, %bb10 ]
  %r183 = phi i32 [ %r181, %main ], [ %r185, %bb10 ]
  %r149 = load i32, i32* @N
  %r150 = icmp slt i32 %r182, %r149
  br i1 %r150, label %bb10, label %bb11

bb10:
  %r153 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 %r182
  %r152 = load i32, i32* %r153
  %r184 = add i32 %r152, 0
  call void @putint(i32 %r184)
  %r185 = add i32 10, 0
  call void @putch(i32 %r185)
  %r157 = add i32 %r182, 1
  %r186 = add i32 %r157, 0
  br label %bb9

bb11:
  call void @_sysy_stoptime(i32 54)
  ret i32 0
}

