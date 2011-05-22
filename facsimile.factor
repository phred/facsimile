! Copyright (C) 2011 Fred Alger.
! See http://factorcode.org/license.txt for BSD license.
USING: continuations kernel memory namespaces prettyprint
sequences system ;
IN: facsimile


SYMBOL: facsimile-continuation

: save-and-exit ( continuation -- )
   facsimile-continuation set-global "factor.image" save-image 0 exit ;

: resume ( -- )
    facsimile-continuation get-global continue ;

: test-iteration ( -- )
    10 iota [
        dup
        5 = [ [ save-and-exit ] callcc0 ] when
        .
    ] each ;
