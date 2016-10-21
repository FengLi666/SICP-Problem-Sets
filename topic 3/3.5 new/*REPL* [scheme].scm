MIT/GNU Scheme running under OS X

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Saturday May 17, 2014 at 2:39:25 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/x86-64 4.118
  Edwin 3.116

1 ]=> the-empty-stream

;Value: ()

1 ]=> (stream-null? the-empty-stream)

;Value: #t

1 ]=> (apply + (list 1 2 3 4))

;Value: 10

1 ]=> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.50.scm")

;Unable to find file "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.50.scm" because: File does not exist.
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

2 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.50.scm")

;Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.50.scm"...
;Ill-formed clause: proc
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

3 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.50.scm")

;  Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.50.scm"... done
;Value: stream-map-advanced

3 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;  Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"...
;Ill-formed clause: proc
;To continue, call RESTART with an option number:
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

4 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;        Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: stream-enumerate-interval
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a value to use instead of stream-enumerate-interval.
; (RESTART 5) => Define stream-enumerate-interval to a given value.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

5 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;        Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;          Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: stream-cons
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a value to use instead of stream-cons.
; (RESTART 6) => Define stream-cons to a given value.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

6 error> cons-stream

;Syntactic keyword may not be used as an expression: #[keyword-value-item 13]
;To continue, call RESTART with an option number:
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

7 error> cons-stream

;Syntactic keyword may not be used as an expression: #[keyword-value-item 14]
;To continue, call RESTART with an option number:
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

8 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;          Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;            Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: stream-cons
;To continue, call RESTART with an option number:
; (RESTART 10) => Specify a value to use instead of stream-cons.
; (RESTART 9) => Define stream-cons to a given value.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

9 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;            Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: display-line
;To continue, call RESTART with an option number:
; (RESTART 11) => Specify a value to use instead of display-line.
; (RESTART 10) => Define display-line to a given value.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

10 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;                Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done

0
;              ... done
;Value: x

10 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Value: stream-enmuerate-interval

10 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;                Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done

0
;              ... done
;Value: x

10 error> (stream-ref x 5)

;The procedure #[compiled-procedure 15 ("stream" #x5) #x1a #x10d243052] has been called with 2 arguments; it requires exactly 1 argument.
;To continue, call RESTART with an option number:
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

11 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm")

;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.51.scm"...
;                Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done

0
;              ... done
;Value: x

11 error> (stream-ref x 5)

1
2
3
4
5
;Unspecified return value

11 error> (stream-ref x 7)

6
7
;Unspecified return value

11 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.53.scm")

;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.53.scm"...
;                Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;              ... done
;Value: s

11 error> (display-stream s 20)

1
2
4
8
16
32
64
128
256
512
1024
2048
4096
8192
16384
32768
65536
131072
262144
524288
1048576
;Value: done

11 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;              Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: integers
;To continue, call RESTART with an option number:
; (RESTART 13) => Specify a value to use instead of integers.
; (RESTART 12) => Define integers to a given value.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

12 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                  Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: integers
;To continue, call RESTART with an option number:
; (RESTART 14) => Specify a value to use instead of integers.
; (RESTART 13) => Define integers to a given value.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

13 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                  Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;Unbound variable: integers
;To continue, call RESTART with an option number:
; (RESTART 15) => Specify a value to use instead of integers.
; (RESTART 14) => Define integers to a given value.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

14 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: one

14 error> (display-stream one 10)

1
1
1
1
1
1
1
1
1
1
1
;Value: done

14 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: integers

14 error> (display-stream integers 10)

1
2
3
4
5
6
7
8
9
10
11
;Value: done

14 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: factorials

14 error> (display-stream factorials 10)

1
;Unbound variable: mul-stream
;To continue, call RESTART with an option number:
; (RESTART 16) => Specify a value to use instead of mul-stream.
; (RESTART 15) => Define mul-stream to a given value.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

15 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: factorials

15 error> (display-stream factorials 10)

1
;Unbound variable: stream-amp-advanced
;To continue, call RESTART with an option number:
; (RESTART 17) => Specify a value to use instead of stream-amp-advanced.
; (RESTART 16) => Define stream-amp-advanced to a given value.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

16 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: factorials

16 error> (display-stream factorials 10)

1
1
2
6
24
120
720
5040
40320
362880
3628800
;Value: done

16 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.54.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: factorials

16 error> (display-stream factorials 10)

1
2
6
24
120
720
5040
40320
362880
3628800
39916800
;Value: done

16 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

16 error> (display-stream (partial-sum integers))

;The procedure #[compound-procedure 16 display-stream] has been called with 1 argument; it requires exactly 2 arguments.
;To continue, call RESTART with an option number:
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

17 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

17 error> (display-stream (partial-sum integers) 10)

1
;Unbound variable: partial
;To continue, call RESTART with an option number:
; (RESTART 19) => Specify a value to use instead of partial.
; (RESTART 18) => Define partial to a given value.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

18 error> (display-stream (partial-sum integers) 10)

1
;Aborting!: maximum recursion depth exceeded

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

18 error> (display-stream (partial-sum integers) 10)

1
3
5
7
9
11
13
15
17
19
21
;Value: done

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

18 error> (display-stream (partial-sum integers) 10)

1
3
6
10
15
21
28
36
45
55
66
;Value: done

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

18 error> (display-stream (partial-sum integers) 10)

1
3
6
10
15
21
28
36
45
55
66
;Value: done

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

18 error> (display-stream (partial-sum integers) 10)

1
3
6
10
15
21
28
36
45
55
66
;Value: done

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")
;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: partial-sum

18 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.56.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.56.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: merge

18 error> (merge integers one)

;Value 17: (1 . #[promise 18])

18 error> (merge (stream- integers) one)

;Unbound variable: stream-
;To continue, call RESTART with an option number:
; (RESTART 20) => Specify a value to use instead of stream-.
; (RESTART 19) => Define stream- to a given value.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

19 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.56.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.56.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: merge

19 error> (define twos (stream-filter oven? integers))

;Unbound variable: oven?
;To continue, call RESTART with an option number:
; (RESTART 21) => Specify a value to use instead of oven?.
; (RESTART 20) => Define oven? to a given value.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

20 error> (oven? 2)

;Unbound variable: oven?
;To continue, call RESTART with an option number:
; (RESTART 22) => Specify a value to use instead of oven?.
; (RESTART 21) => Define oven? to a given value.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

21 error> (ovan? 2)

;Unbound variable: ovan?
;To continue, call RESTART with an option number:
; (RESTART 23) => Specify a value to use instead of ovan?.
; (RESTART 22) => Define ovan? to a given value.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

22 error> (even? 2)

;Value: #t

22 error> (define twos (stream-filter even? integers))

;Unbound variable: stream-empty?
;To continue, call RESTART with an option number:
; (RESTART 24) => Specify a value to use instead of stream-empty?.
; (RESTART 23) => Define stream-empty? to a given value.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

23 error> (load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.56.scm")

;                    Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.56.scm"...
;                      Loading "Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm"... done
;                    ... done
;Value: merge

23 error> (define twos (stream-filter even? integers))

;Value: twos

23 error> (display-stream twos 10)

2
4
6
8
10
12
14
16
18
20
22
;Value: done

23 error> (define twos (stream-filter (not even?) integers))

;The object #f is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 24) => Specify a procedure to use in its place.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

24 error> (define twos (stream-filter (lambda (x) (not (even? x))) integers))

;Value: twos

24 error> (define twos (stream-filter even? integers))

;Value: twos

24 error> (define odds (stream-filter (lambda (x) (not (even? x))) integers))