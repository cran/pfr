# in addition to everything in the header and source for the model, we need:
#- modname_approx_LL
#- modname_approx_filt

cpptemp_bswc_export <- 
r"(// replace every instance of <TODO> with your own code! 

double modname_approx_LL(const Rcpp::NumericVector& obsTS, const Rcpp::NumericVector& params){

  // instantiate model with arg params
  classMODNAME mod(<TODO>);

  // calculate likelihood by iterating through time series
  double ans(0.0);
  ovec yt, ytm1;
  for (int i = 1; i < obsTS.length(); i++){
    yt << obsTS[i]; ytm1 << obsTS[i-1];
    mod.filter(yt, ytm1);
    ans += mod.getLogCondLike();
  }
  return ans;
}


Rcpp::NumericVector modname_approx_filt(
    const Rcpp::NumericVector& obsTS,
    const Rcpp::NumericVector& params){
  
  // instantiate model with arg params
  classMODNAME mod(<TODO>);

  // instantiate container for filter means
  Rcpp::NumericVector ans(obsTS.size() - 1);

  // create a function to evaluate on particle samples
  std::vector<func> pf_fs;
  pf_fs.emplace_back([](const svec& xt, const cvec& zt)-> DynMat{ return xt; });

  // iterate through data and save filter means
  ovec yt, ytm1;
  for (int i = 1; i < obsTS.length(); i++){
    yt << obsTS[i]; ytm1 << obsTS[i-1];
    mod.filter(yt, ytm1, pf_fs);
    ans[i-1] = mod.getExpectations()[0](0,0);
  }
  return ans;
}
)"

