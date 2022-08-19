# LIBMINC build script for LIBMINC_JLL

This is a script to automatically build binary library libminc and minc2-simple 
for using inside julia environment. 

Location of the binaries: https://github.com/vfonov/LIBMINC_jll.jl


# Using

To build binaries and upload them: 

 - Obtain github token: https://github.com/settings/tokens 

 - Set environment variable `GITHUB_TOKEN`  to the token

 - (Optional) `export JULIA_SSH_NO_VERIFY_HOSTS=github.com`

 - Run

```
julia build_tarballs.jl x86_64-linux-gnu  --deploy=vfonov/LIBMINC_jll.jl
```
