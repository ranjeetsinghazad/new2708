module "rg" {
  source = "../module/01_rg"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../module/02_vnet"
  vnets  = var.vnets

}
module "snet" {
  depends_on = [module.vnet]
  source     = "../module/03_subnet"
  snets      = var.snets

}
module "pip" {
  depends_on = [module.rg]
  source     = "../module/05_pip"
  pips       = var.pips
}

module "nic" {
  depends_on = [module.snet, module.pip]
  source     = "../module/06_nic"
  nics       = var.nics

}