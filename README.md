## The PARANOID routines

This is a version of the PARANOID program converted to procedures. They can be
embedded into programs such that one can verify the behavior of the options
selected to execute a program, or the simple test program can be used to
experiment with various compiler selections.

  * double-precision Fortran procedure
  * single-precision Fortran procedure
  * C program
```fortran
program test_paranoia
   call paranoia('double')
   call paranoia('single')
end program test_paranoia
$endif

subroutine paranoia(precis)
use M_journal, only : journal
implicit none
character(len=*),parameter :: ident="@(#)paranoia(3f): call doublprecision or real versions of paranoia"
character(len=*),intent(in) :: precis

   if(precis.eq.'single')then
      call journal('*paranoia" single precision test')
      call sparanoia()
   elseif(precis.eq.'double')then
      call journal('*paranoia" double precision test')
      call dparanoia()
   elseif(precis.eq.'all')then
      call journal('*paranoia" single precision test')
      call sparanoia()
      call journal('*paranoia" double precision test')
      call dparanoia()
   else
      call journal('*paranoia* unknown precision request '//precis)
   endif

end subroutine paranoia
```
