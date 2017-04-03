# read code_smells.csv file
code_smells_df  <- read.csv("csvFiles/code_smells.csv", header = FALSE)

# read all the layout_smells.csv
layout_smells_df  <- read.csv("csvFiles/layout_smells.csv", header = FALSE)

# Add headers to the dfs
colnames(code_smells_df) <- c("app_name","tag","tag_name","file",
                              "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                              "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                              "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT")

colnames(layout_smells_df) <- c("app_name","tag","tag_name","file",
                                "UF", "NDUI", "U", "OP", "NL")

# total occurrence of DTWC in all the apps
DTWC <- length(which(code_smells_df$DTWC == '1'))

# occurrence of DTWC in each app
DTWC_each_app <- data.frame(table(unlist(code_smells_df$app_name[which(code_smells_df$DTWC == '1')])))

# occurrence of DTWC in each tag
DTWC_each_tag <- data.frame(table(unlist(code_smells_df$tag[which(code_smells_df$DTWC == '1')])))

# add app_name and tag in one col
code_smells_df <- transform(code_smells_df, name_tag=paste(code_smells_df$app_name, code_smells_df$tag, sep="_"))

DTWC_each_tag <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$DTWC == '1')])))

# Splite day and month as x1 and x2 to make the format is Release.Date in apps_ratings_ds
library(stringr)
DTWC_each_tag <- data.frame(DTWC_each_tag, str_split_fixed(DTWC_each_tag$Var1, "_", 2))

# Delete name_tag col after spliting into 2
DTWC_each_tag$Var1 <- NULL

# reorder DTWC_each_tag by column name
DTWC_each_tag <- DTWC_each_tag[c("X1", "X2", "Freq")]

colnames(DTWC_each_tag) = c("app_name","tag","DTWC_freq")

# =====================
# example
df <- data.frame(yad = c("BARBIE", "BARBIE", "BAKUGAN", "BAKUGAN"),
                 per = c("AYLIK",  "AYLIK",  "2 AYLIK", "2 AYLIK"),
                 hmm = 1:4)

unique(df[c("yad", "per")])











