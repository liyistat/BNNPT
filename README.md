# BNNPT
Bagging Nearest-Neighbor Prediction independence Test (R Package)
# Recommended BNNPT package installation
```{r}
source("https://raw.githubusercontent.com/liyistat/install_github_package/master/install_github.R");
install_github("liyistat/BNNPT")
library(BNNPT);
```

# Install BNNPT package by devtools
```{r}
install.packages(c("compiler"));
devtools::install_github("liyistat/BNNPT");
library(BNNPT);
```

# You can also install package dependencies by install_github
```{r}
devtools::install_github("cran/snow");
devtools::install_github("liyistat/BNNPT");
library(BNNPT);
```

# Reference
Yi Wang*, Yi Li*, Xiaoyu Liu*, Weilin Pu, Xiaofeng Wang, Jiucun Wang, Momiao Xiong, Yin Yao Shugart# and Li Jin#. "Bagging Nearest-Neighbor Prediction independence Test: an efficient method for nonlinear dependence of two continuous variables." Scientific reports 7, no. 1 (2017): 12736.
https://github.com/liyistat/BNNPT (*first author, #corresponding author)

# The C++ version of BNNPT software
Available at https://sourceforge.net/projects/bnnpt/.

