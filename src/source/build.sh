
#!/bin/bash
cd $(dirname $0)
#html2f90 M_Compare_Float_Numbers.HTML|f90cpp|prep F90 TESPRG90  > ../M_Compare_Float_Numbers.f90
#	|f90cpp $(INC) -D$(TARGET_REV) -D$(MYTARGET) $(ALLEXTENSIONS) >$(TMPDIR)/$(*F).f90.tmp
prep  F90  TESTPRG90 --comment  doxygen  --verbose  -i  paranoid.[fF][fF] -o ../../app/paranoid.f90
prep  F90  TESTPRG90 --comment  doxygen  --verbose  -i  version.[fF][fF] -o ../../app/version.f90
cp ../../docs/man3.html ../../docs/index.html
cp ../../docs/BOOK_M_Compare_Float_Numbers.html ../../docs/index.html
