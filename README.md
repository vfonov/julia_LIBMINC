# LIBMINC build script for LIBMINC_JLL

This is a script to automatically build binary library libminc and minc2-simple 
for using inside julia environment. 

Location of the binaries: https://github.com/vfonov/LIBMINC_jll.jl

This project depends on https://docs.binarybuilder.org/stable/building/ 

# Using

To build binaries and upload them: 

 - Obtain github token: https://github.com/settings/tokens 

 - Set environment variable `GITHUB_TOKEN`  to the token

 - Run, will build the new version and upload it to the github
 - (Optional) `export JULIA_SSH_NO_VERIFY_HOSTS=github.com`


```
julia build_tarballs.jl x86_64-linux-gnu  --deploy=vfonov/LIBMINC_jll.jl
```
