# glm.predict
R GNU Package to test the parallel regression assumption with the Brand-Test for polr() models. 

## Example

Here an example how you can use the function `brant()`. First we estimate an ordinal logistic regression.

```
data = MASS::survey
data$Smoke = ordered(MASS::survey$Smoke,levels=c("Never","Occas","Regul","Heavy"))
model1 = MASS::polr(Smoke ~ Sex + Height, data=data, Hess=TRUE)
summary(model1)
```

Now we can test the parallel regression assumption.

```
library(brant)
brant(model1)
```

We see that the assumption hold, as we cannot reject H0.

## Installation

If you want to install the stable version from CRAN you can do that with the following command:

`install.packages("glm.predict")`
  
If you want to install the newest developer version from GitHub, you can do that with the package remotes:

```
install.packages("remotes")
remotes::install_github("benjaminschlegel/brant")
```

You might need to install Rtools (for Windows) or XCode (for Mac OS) to install the package from GitHub.