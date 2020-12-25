# some of bash scripts that I use regularly


## **gen_rubbish.sh**:
### this one generate a **_cpp_** file in a pre-defined location (here I chose _**Home/.tmp**_ but you can change it easily)
Also, you can change the editor, I use _**sublime**_, but you can change it to any editor that you can launch from the command line (the editor name, must be in your PATH)


### TODO:
1- add an integration to cmake or make file, so you can easily put more stuff into it and link with other files.

## cppcompile
this is a function I modfied from StackOverflow to scap my cpp file, for headers and include any .cpp files associated with headers.
to use this, just copy paste it in your 
.bash_profile file (usually it is in your HOME directory, if not you can create one) 
and source it using the command: **source ~/.bash_profile**

### mv_compile_commands
This script find **compile_commands.json** in the directory the command was invoked from. If no argument are passed, it will copy the file to same directory it was invoked from. alternatively, you can pass a path as the first argument, to copy the **compile_commands.json** to that path.