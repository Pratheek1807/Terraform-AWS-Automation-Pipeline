module vpc {
  source = "./vpc"
  
}

module web {
  source = "./web"
  sn = module.vpc.pb_sn
  sg = module.vpc.sg
}
