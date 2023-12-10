declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define void @move( i32 %r100, i32 %r102 ) {
move:
  %r139 = add i32 0, 0
  %r140 = add i32 0, 0
  %r141 = add i32 %r100, 0
  %r142 = add i32 %r102, 0
  br label %bb1

bb1:
  call void @putint(i32 %r141)
  call void @putch(i32 32)
  call void @putint(i32 %r142)
  call void @putch(i32 44)
  call void @putch(i32 32)
  ret void
}

define void @hanoi( i32 %r106, i32 %r108, i32 %r110, i32 %r112 ) {
hanoi:
  %r147 = add i32 0, 0
  %r148 = add i32 0, 0
  %r149 = add i32 0, 0
  %r150 = add i32 0, 0
  %r151 = add i32 %r106, 0
  %r152 = add i32 %r108, 0
  %r153 = add i32 %r110, 0
  %r154 = add i32 %r112, 0
  br label %bb2

bb2:
  %r115 = icmp eq i32 %r151, 1
  br i1 %r115, label %bb3, label %bb4

bb3:
  call void @move(i32 %r152, i32 %r154)
  br label %bb5

bb4:
  %r119 = sub i32 %r151, 1
  call void @hanoi(i32 %r119, i32 %r152, i32 %r154, i32 %r153)
  call void @move(i32 %r152, i32 %r154)
  %r126 = sub i32 %r151, 1
  call void @hanoi(i32 %r126, i32 %r153, i32 %r152, i32 %r154)
  br label %bb5

bb5:
  ret void
}

define i32 @main( ) {
main:
  %r156 = add i32 0, 0
  call void @_sysy_starttime(i32 21)
  %r131 = call i32 @getint()
  %r157 = add i32 %r131, 0
  br label %bb6

bb6:
  %r158 = phi i32 [ %r157, %main ], [ %r159, %bb7 ]
  %r133 = icmp sgt i32 %r158, 0
  br i1 %r133, label %bb7, label %bb8

bb7:
  %r134 = call i32 @getint()
  call void @hanoi(i32 %r134, i32 1, i32 2, i32 3)
  call void @putch(i32 10)
  %r136 = sub i32 %r158, 1
  %r159 = add i32 %r136, 0
  br label %bb6

bb8:
  call void @_sysy_stoptime(i32 28)
  ret i32 0
}

