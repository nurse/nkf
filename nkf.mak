# Visual C++ 2005 Express Edition
CC = cl
LD=link
CFLAGS = -O2 -DMSDOS -DWIN32 -D__WIN32__ -D_CRT_SECURE_NO_DEPRECATE
LD_FLAGS = 
LIBS = user32.lib kernel32.lib gdi32.lib
RC = rc

all: nkf.exe nkf32.dll

nkf.exe : nkf.obj config.h utf8tbl.obj version.res
	$(CC) $(CFLAGS) nkf.obj utf8tbl.obj version.res /link setargv.obj

nkf32.dll: nkf32.obj utf8tbl.obj dll.res
	$(LD) $(LDFLAGS) /DLL /DEF:dll.def nkf32.obj utf8tbl.obj dll.res

nkf.obj : nkf.c config.h
	$(CC) $(CFLAGS) -c nkf.c

nkf32.obj: nkf32.c nkf.c nkf32dll.c config.h nkf.h
	$(CC) $(CFLAGS) /DLL -DWIN32DLL -DTOMIME -DGETKANJICODE -DFILECONVERT1 -DFILECONVERT2 -DUNICODESUPPORT /c nkf32.c

utf8tbl.obj : utf8tbl.c config.h
	$(CC) $(CFLAGS) /c utf8tbl.c

version.res: version.rc
    $(RC) $(RCFLAGS) version.rc

dll.res: dll.rc
    $(RC) $(RCFLAGS) dll.rc

clean:
	-del nkf.obj
	-del nkf32.obj
	-del nkf32.exp
	-del utf8tbl.obj
	-del version.res
	-del dll.res
	-del nkf.exe
	-del nkf32.dll
	-del nkf32.lib
