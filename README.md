# sierra-qhmc-quda

A full set of compile and run scripts for QHMC+QUDA on Sierra.

Instructions:

1. Clone or download this repo wherever you'd like it.  

Clone: `git clone https://[username]@github.com/weinbe2/sierra-qhmc-quda`

2. Before modifying anything, modify `env.sh`:
* Set `GITDIR` to the full path to your local copy of the git repository, including the `sierra-qhmc-quda`. 
* Set `BASEDIR` to the full path to the directory where you'd like your build and installation to go. This directory must exist before proceeding with the install.

3. Run the scripts in order: `step01_mkdir.sh`, `step02_qmp.sh`, ...

You can also just run `doall.sh`, but (for now) that's not advised. There's very little error checking in these scripts at the moment, so if one step breaks, the rest of the steps will keep trying to chug along until they break too...

4. You're done!

The build of `qhmc` lives in `$BASEDIR/lqcd/install/qhmc-quda/bin`. As needed for other purposes, the build of QUDA lives in `$BASEDIR/quda/build`. 

If you hit any issues with these scripts, please let me know at evansweinberg@gmail.com or eweinberg@nvidia.com. 
