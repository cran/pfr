## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(pfr)
#removed ths from yaml header:
#bibliography: REFERENCES.bib
# requires pandoc-citeproc, btu no way to make user download that
#knitr::opts_knit$set(root.dir = rprojroot::find_rstudio_root_file())

## ---- out.width="100%", echo=F------------------------------------------------
knitr::include_graphics("ssm_diagram_1-1.png")

## ---- eval = FALSE------------------------------------------------------------
#  library(pfr)
#  createPFCPPTemplates("svol_leverage", "BSWC", fileDir = "./")

## ----eval = FALSE-------------------------------------------------------------
#  svol_lev <- buildModelFuncs(".", "svol_leverage")

## ----eval = FALSE-------------------------------------------------------------
#  svol_lev$svol_leverage_bswc_approx_LL(rnorm(100), c(.9, 0.0, 1.0, -.2))
#  svol_lev$svol_leverage_bswc_approx_filt(rnorm(100), c(.9, 0.0, 1.0, -.2))

## ---- eval = FALSE------------------------------------------------------------
#  createPFCPPTemplates("mean_factor_msvol", "APF", fileDir = "./")

## -----------------------------------------------------------------------------
fsvol <- buildModelFuncs(".", "mean_factor_msvol")

## -----------------------------------------------------------------------------
paramEst <- c(1.22, #B
              -1.17, -.01, .08, #mu
              .85, .84, .81, #Phi
              3.7, 3.4, 3.49) #Sigma
fakeData <- matrix(rnorm(50), ncol=2)
fsvol$mean_factor_msvol_apf_approx_LL(fakeData, paramEst)
fsvol$mean_factor_msvol_apf_approx_filt(fakeData, paramEst)

