setup.git
=========
ATTENTION! Feel free to use and fork these scripts, but bear in mind that MY DETAILS are hardcoded in here so please check and change them as appropriate.

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/startup-class/setup.git
./setup/setup.sh   

```

Alternatively, just do
```
bash <(wget -q https://raw.githubusercontent.com/derwinmcgeary/setup/master/setup_WHATEVER.sh -O - )
```
Where WHATEVER will vary depending on which scripts I add here, for example:
For RStudio
```
bash <(wget -q https://raw.githubusercontent.com/derwinmcgeary/setup/master/setup_rstudio.sh -O - )
```
For Android dev
```
bash <(wget -q https://raw.githubusercontent.com/derwinmcgeary/setup/master/setup_android.sh -O - )
```

So cut and paste those lines to automate everything.

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.





