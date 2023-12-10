declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@N = global i32 0
@newline = global i32 0
define i32 @mod( i32 %r100, i32 %r102 ) {
mod:
  %r145 = add i32 0, 0
  %r146 = add i32 0, 0
  %r147 = add i32 %r100, 0
  %r148 = add i32 %r102, 0
  br label %bb1

bb1:
  %r107 = sdiv i32 %r147, %r148
  %r109 = mul i32 %r107, %r148
  %r110 = sub i32 %r147, %r109
  ret i32 %r110
}

define i32 @split( i32 %r111, i32* %r113 ) {
split:
  %r151 = add i32 0, 0
  %r152 = add i32 0, 0
  %r153 = add i32 %r111, 0
  br label %bb2

bb2:
  %r115 = load i32, i32* @N
  %r116 = sub i32 %r115, 1
  %r154 = add i32 %r116, 0
  br label %bb3

bb3:
  %r155 = phi i32 [ %r154, %bb2 ], [ %r158, %bb4 ]
  %r156 = phi i32 [ %r153, %bb2 ], [ %r157, %bb4 ]
  %r118 = sub i32 0, 1
  %r119 = icmp ne i32 %r155, %r118
  br i1 %r119, label %bb4, label %bb5

bb4:
  %r120 = call i32 @mod(i32 %r156, i32 10)
  %r123 = getelementptr i32, i32* %r113, i32 %r155
  store i32 %r120, i32* %r123
  %r125 = sdiv i32 %r156, 10
  %r157 = add i32 %r125, 0
  %r127 = sub i32 %r155, 1
  %r158 = add i32 %r127, 0
  br label %bb3

bb5:
  ret i32 0
}

define i32 @main( ) {
main:
  %r162 = add i32 0, 0
  %r163 = add i32 0, 0
  %r130 = alloca [ 4 x i32 ]
  %r164 = add i32 0, 0
  call void @_sysy_starttime(i32 26)
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %r165 = add i32 1478, 0
  %r131 = call i32 @split(i32 %r165, i32* %r130)
  %r166 = add i32 %r131, 0
  %r167 = add i32 0, 0
  br label %bb6

bb6:
  %r168 = phi i32 [ %r167, %main ], [ %r171, %bb7 ]
  %r169 = phi i32 [ %r164, %main ], [ %r170, %bb7 ]
  %r135 = icmp slt i32 %r168, 4
  br i1 %r135, label %bb7, label %bb8

bb7:
  %r138 = getelementptr [4 x i32 ], [4 x i32 ]* %r130, i32 0, i32 %r168
  %r137 = load i32, i32* %r138
  %r170 = add i32 %r137, 0
  call void @putint(i32 %r170)
  %r140 = load i32, i32* @newline
  call void @putch(i32 %r140)
  %r142 = add i32 %r168, 1
  %r171 = add i32 %r142, 0
  br label %bb6

bb8:
  call void @_sysy_stoptime(i32 42)
  ret i32 0
}

