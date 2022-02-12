program version
call print_version
contains
subroutine print_version
use,intrinsic :: iso_fortran_env, only : compiler_version, compiler_options
use,intrinsic :: iso_fortran_env, only : stdin=>input_unit, stdout=>output_unit, stderr=>error_unit

use M_strings, only : split
character(len=:),allocatable :: options(:)
integer           :: i
integer           :: io=stdout
character(len=17) :: DATE="Feb 12 2022 11:42:46"
   write(io,'("=================:: ")')
!  COMPILER-RELATED COMPILATION INFORMATION
   write(io,'("Compiler version :: ",a)') COMPILER_VERSION()
   ! source_file_name  most compilers have predefined buildit macros such as ,__DATE__, __FILE__ that preprocessors expand
   write(io,'("Compilation Date :: ",a)') DATE !__DATE__
                                                      ! (hopefully) pretty-print compiler options
   call split(COMPILER_OPTIONS(),options)             ! parse compiler options on ' ' (likely delimiter)
   write(io,'("Compiler options ::")',advance='no')   ! only start new lines when a - begins the option
   do i=1,size(options)
      if(options(i)(1:1).eq.'-'.and.i.ne.1)then
         write(io,'(a)')
         write(io,'("                 :: ",a)',advance='no') trim(options(i))
      else
         write(io,'(" ",a)',advance='no') trim(options(i))
      endif
   enddo
   write(io,'(/,80("="))')
end subroutine print_version
end program version
