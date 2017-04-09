# read code_smells.csv file
java_smells_df  <- read.csv("csvFiles/code_smells.csv", header = FALSE)

# read all the layout_smells.csv
layout_smells_df  <- read.csv("csvFiles/layout_smells.csv", header = FALSE)

# Add headers to the dfs
colnames(java_smells_df) <- c("app_name","tag","tag_name","file",
                              "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                              "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                              "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT")

colnames(layout_smells_df) <- c("app_name","tag","tag_name","file",
                                "UF", "NDUI", "U", "OP", "NL")


# Added these cols "UF", "NDUI", "U", "OP", "NL"
java_smells_df$UF = '0'
java_smells_df$NDUI = '0'
java_smells_df$U = '0'
java_smells_df$OP = '0'
java_smells_df$NL = '0'

layout_smells_df$DTWC = '0'
layout_smells_df$DR = '0'
layout_smells_df$DW = '0'
layout_smells_df$IDFP = '0'
layout_smells_df$IDS = '0'
layout_smells_df$ISQLQ = '0'
layout_smells_df$IGS = '0'
layout_smells_df$LIC = '0'
layout_smells_df$LT = '0'
layout_smells_df$MIM = '0'
layout_smells_df$NLMR = '0'
layout_smells_df$PD = '0'
layout_smells_df$RAM = '0'
layout_smells_df$SL = '0'
layout_smells_df$UC = '0'
layout_smells_df$SCC = '0'
layout_smells_df$IFB = '0'
layout_smells_df$UP = '0'
layout_smells_df$BDTOSN = '0'
layout_smells_df$DD = '0'
layout_smells_df$ERB = '0'
layout_smells_df$NIOOIMT = '0'
layout_smells_df$THI = '0'
layout_smells_df$UV = '0'
layout_smells_df$PDT = '0'

layout_smells_df <- layout_smells_df[c("app_name", "tag", "tag_name","file", "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                                       "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                                       "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT", "UF", "NDUI", "U", "OP", "NL" )]


# occurrence of each smells in each App

#1. "DTWC"
DTWC_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$DTWC == '1')])))

#2. "DR"
DR_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$DR == '1')])))

#3. "DW",
DW_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$DW == '1')])))

#4. "IDFP",
IDFP_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$IDFP == '1')])))

#5. "IDS", 
IDS_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$IDS == '1')])))

#6. "ISQLQ", 
ISQLQ_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$ISQLQ == '1')])))

#7. "IGS",
IGS_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$IGS == '1')])))

#8. "LIC", 
LIC_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$LIC == '1')])))

#9. "LT",
LT_each_app<- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$LT == '1')])))

#10. "MIM", 
MIM_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$MIM == '1')])))

#11. "NLMR", 
NLMR_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$NLMR == '1')])))

#12. "PD",
PD_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$PD == '1')])))

#13. "RAM", 
RAM_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$RAM == '1')])))

#14. "SL", 
SL_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$SL == '1')])))

#15. "UC", 
UC_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$UC == '1')])))

#16. "SCC", 
SCC_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$SCC == '1')])))

#17. "IFB", 
IFB_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$IFB == '1')])))

#18. "UP", 
UP_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$UP == '1')])))

#19. "BDTOSN", 
BDTOSN_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$BDTOSN == '1')])))

#20. "DD", 
DD_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$DD == '1')])))

#21. "ERB", 
ERB_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$ERB == '1')])))

#22. "NIOOIMT",
NIOOIMT_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$NIOOIMT == '1')])))

#23. "THI",
THI_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$THI == '1')])))

#24. "UV", 
UV_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$UV == '1')])))

#25. "PDT"
PDT_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$PDT == '1')])))

# For layout files- smells occurrence in each tag in all the apps
#1. "UF"
UF_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$UF == '1')])))

#2. "NDUI"
NDUI_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$NDUI == '1')])))

#3. "U" 
U_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$U == '1')])))

#4. "OP"
OP_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$OP == '1')])))

#5. "NL"
NL_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$NL == '1')])))

# Merge all smells df in one tabel 
apps_total_smells = Reduce(function(x, y) merge(x, y, by='Var1', all=TRUE), list(DTWC, DR, DW, IDFP, IDS, ISQLQ, IGS, LIC,
                                                                                 LT, MIM, NLMR, PD, RAM, SL, UC, SCC,
                                                                                 IFB, UP, BDTOSN, DD, ERB, NIOOIMT, THI, UV, PDT,
                                                                                 UF, NDUI, U, OP, NL))
