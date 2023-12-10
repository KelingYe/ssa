declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @mod( i32 %r100, i32 %r102 ) {
mod:
  %r148 = add i32 0, 0
  %r149 = add i32 0, 0
  %r150 = add i32 %r100, 0
  %r151 = add i32 %r102, 0
  br label %bb1

bb1:
  %r107 = sdiv i32 %r150, %r151
  %r109 = mul i32 %r107, %r151
  %r110 = sub i32 %r150, %r109
  ret i32 %r110
}

define i32 @palindrome( i32 %r111 ) {
palindrome:
  %r155 = add i32 0, 0
  %r113 = alloca [ 4 x i32 ]
  %r156 = add i32 0, 0
  %r157 = add i32 0, 0
  %r158 = add i32 %r111, 0
  br label %bb2

bb2:
  %r159 = add i32 0, 0
  br label %bb3

bb3:
  %r160 = phi i32 [ %r158, %bb2 ], [ %r165, %bb4 ]
  %r161 = phi i32 [ %r159, %bb2 ], [ %r166, %bb4 ]
  %r117 = icmp slt i32 %r161, 4
  br i1 %r117, label %bb4, label %bb5

bb4:
  %r118 = call i32 @mod(i32 %r160, i32 10)
  %r121 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 %r161
  store i32 %r118, i32* %r121
  %r123 = sdiv i32 %r160, 10
  %r165 = add i32 %r123, 0
  %r125 = add i32 %r161, 1
  %r166 = add i32 %r125, 0
  br label %bb3

bb5:
  %r127 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 0
  %r126 = load i32, i32* %r127
  %r129 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 3
  %r128 = load i32, i32* %r129
  %r130 = icmp eq i32 %r126, %r128
  br i1 %r130, label %bb9, label %bb7

bb9:
  %r132 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 1
  %r131 = load i32, i32* %r132
  %r134 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 2
  %r133 = load i32, i32* %r134
  %r135 = icmp eq i32 %r131, %r133
  br i1 %r135, label %bb6, label %bb7

bb6:
  %r163 = add i32 1, 0
  br label %bb8

bb7:
  %r164 = add i32 0, 0
  br label %bb8

bb8:
  %r162 = phi i32 [ %r163, %bb6 ], [ %r164, %bb7 ]
  ret i32 %r162
}

define i32 @main( ) {
main:
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  call void @_sysy_starttime(i32 30)
  %r171 = add i32 1221, 0
  %r139 = call i32 @palindrome(i32 %r171)
  %r172 = add i32 %r139, 0
  %r142 = icmp eq i32 %r172, 1
  br i1 %r142, label %bb10, label %bb11

bb10:
  call void @putint(i32 %r171)
  br label %bb12

bb11:
  %r175 = add i32 0, 0
  call void @putint(i32 %r175)
  br label %bb12

bb12:
  %r173 = phi i32 [ %r172, %bb10 ], [ %r175, %bb11 ]
  %r174 = add i32 10, 0
  call void @putch(i32 %r174)
  call void @_sysy_stoptime(i32 47)
  ret i32 0
}

