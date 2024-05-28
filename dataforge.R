phdethnicity$supervisors <- c("Burgers, K.; Kooten, H.T.", "Derks, F.; Petruski, D.", "van der Poel, Lisa; Rutten, Pieter", "Bise, Marie", "Koenen, Jip; Doornbos, Hella", "Jonsson, Nils; Wang, Jing; Veenma, Rick", "Krijns-de Goede, A.; Fijter, O.E.A.", "Donk, T. van den")

save(phdethnicity, file="./data/processed/phdethnicity.rda")

profs <- profs[c(1:2),]

profs[c(3:13),1] <- c("Hannah T. Kooten", "D. Petruski", "P. Rutten", "Marie Bise", "H. Doornbos", "R. Veenma", "Jing Wang", "Jing Wang", "Onno Fijter", "T. van den Donk", "T. van den Donk")
profs[c(3:13),2] <- c("full", "full", "full", "full", "full", "full", "associate", "full", "full", "full", "full")
profs[c(3:13),3] <- c(2008, 1996, 2000, 2000, 2008, 2010, 2007, 2014, 2011, 1995, 2010)
profs[c(3:13),4] <- rep(NA, times=nrow(profs))
profs[c(3:13),5] <- c("Hannah T. Kooten", "D. Petruski", "P. Rutten", "Marie Bise", "H. Doornbos", "R. Veenma", "Jing Wang", "Jing Wang", "Onno Fijter", "T. van den Donk", "T. van den Donk")
profs[c(3:13),6] <- c("hannah", NA, NA, "marie", NA, NA, "jing", "jing", "onno", NA, "titia")
profs[c(3:13),7] <- c("H.T.", "D.", "P.", "M.L.", "H.", "R.", "J.", "J.", "O.", "T.", "T.")
profs[c(3:13),8] <- c("kooten", "petruski", "rutten", "bise", "doornbos", "veenma", "wang", "wang", "fijter", "donk", "donk")
profs[c(3:13),9] <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, "van den", "van den")

profs <- profs[c(3:13),]

save(profs, file="./data/professors/profs.rda")
