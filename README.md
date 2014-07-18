squareGPU
=========

caculate sum of squares by CUDA


Auther: 2014       Barton Xu <xinghua2968@163.com>


build steps:

nvcc.exe -gencode=arch=compute_20,code=\"sm_20,compute_20\" -ccbin "c:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\amd64" -I./ -I"C:\Users\bxu\Documents\CUDA Samples\v6.0\common\inc" -I"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v6.0\include" -I"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v6.0\include" -maxrregcount=0 --machine 64 --compile -cudart static -Xcompiler "/wd 4819" -DWIN32 -D_MBCS -DWIN64 -Xcompiler "/EHsc /W3 /nologo /O2 /Zi /MT /Fd"x64r/square.pdb" " -o "x64r\square.cu.obj" square.cu 


"C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\amd64\link.exe" /OUT:"x64r\square.exe" /NOLOGO /LIBPATH:"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v6.0\lib\x64" /LIBPATH:"C:\Users\bxu\Documents\CUDA Samples\v6.0\common\lib\x64" /LIBPATH:"C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\atlmfc\lib\amd64" /LIBPATH:"C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\lib\amd64" /LIBPATH:"C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Lib\x64" "cudart_static.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /MANIFEST /ManifestFile:"x64r/square.exe.intermediate.manifest" /ALLOWISOLATION /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /PDB:"x64r\square.pdb" /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /LTCG /TLBID:1 /DYNAMICBASE /NXCOMPAT /MACHINE:X64 /ERRORREPORT:QUEUE x64r\square.cu.obj 
