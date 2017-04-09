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


# Added these cols "UF", "NDUI", "U", "OP", "NL" to java_smell df
java_smells_df$UF = '0'
java_smells_df$NDUI = '0'
java_smells_df$U = '0'
java_smells_df$OP = '0'
java_smells_df$NL = '0'

# Added these cols layout_smell df
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

# sort cols name in layout_smells_df
layout_smells_df <- layout_smells_df[c("app_name", "tag", "tag_name","file", "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                                       "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                                       "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT", "UF", "NDUI", "U", "OP", "NL" )]

java_smells_df <- transform(java_smells_df, name_tag=paste(java_smells_df$app_name, java_smells_df$tag, sep="_"))
layout_smells_df <- transform(layout_smells_df, name_tag=paste(layout_smells_df$app_name, layout_smells_df$tag, sep="_"))

# add the two datasets java_smells_df + layout_smells_df
code_smells_df = rbind(java_smells_df, layout_smells_df)

# to sort them
code_smells_df <- code_smells_df[order(code_smells_df$name_tag),]

# to get the total number of the unique apps
length(unique(code_smells_df$app_name))


# total occurrence of DTWC in all the apps
DTWC_all_app <- length(which(code_smells_df$DTWC == '1'))

# merge app_name and tag in one col
# code_smells_df <- transform(code_smells_df, name_tag=paste(code_smells_df$app_name, code_smells_df$tag, sep="_"))

# smells occurrence in each tag in all the apps
#1. "DTWC"
DTWC <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$DTWC == '1')])))

#2. "DR"
DR <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$DR == '1')])))

#3. "DW",
DW <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$DW == '1')])))

#4. "IDFP",
IDFP <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$IDFP == '1')])))

#5. "IDS", 
IDS <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$IDS == '1')])))

#6. "ISQLQ", 
ISQLQ <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$ISQLQ == '1')])))

#7. "IGS",
IGS <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$IGS == '1')])))

#8. "LIC", 
LIC <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$LIC == '1')])))

#9. "LT",
LT <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$LT == '1')])))

#10. "MIM", 
MIM <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$MIM == '1')])))

#11. "NLMR", 
NLMR <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$NLMR == '1')])))

#12. "PD",
PD <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$PD == '1')])))

#13. "RAM", 
RAM <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$RAM == '1')])))

#14. "SL", 
SL <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$SL == '1')])))

#15. "UC", 
UC <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$UC == '1')])))

#16. "SCC", 
SCC <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$SCC == '1')])))

#17. "IFB", 
IFB <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$IFB == '1')])))

#18. "UP", 
UP <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$UP == '1')])))

#19. "BDTOSN", 
BDTOSN <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$BDTOSN == '1')])))

#20. "DD", 
DD <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$DD == '1')])))

#21. "ERB", 
ERB <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$ERB == '1')])))

#22. "NIOOIMT",
NIOOIMT <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$NIOOIMT == '1')])))

#23. "THI",
THI <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$THI == '1')])))

#24. "UV", 
UV <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$UV == '1')])))

#25. "PDT"
PDT <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$PDT == '1')])))
 
# For layout files- smells occurrence in each tag in all the apps
#1. "UF"
UF <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$UF == '1')])))

#2. "NDUI"
NDUI <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$NDUI == '1')])))

#3. "U" 
U <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$U == '1')])))

#4. "OP"
OP <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$OP == '1')])))

#5. "NL"
NL <- data.frame(table(unlist(code_smells_df$name_tag[which(code_smells_df$NL == '1')])))



# Merge all smells df in one tabel 
# total smells in each tag
total_smells = Reduce(function(x, y) merge(x, y, by='Var1', all=TRUE), list(DTWC, DR, DW, IDFP, IDS, ISQLQ, IGS, LIC,
                                                  LT, MIM, NLMR, PD, RAM, SL, UC, SCC,
                                                  IFB, UP, BDTOSN, DD, ERB, NIOOIMT, THI, UV, PDT,
                                                  UF, NDUI, U, OP, NL))


# change headers names in total_smells df
colnames(total_smells) <- c("app_name_tag_name",
                              "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                              "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                              "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT",
                              "UF", "NDUI", "U", "OP", "NL")

# add new col called 'total' to hold the total number of smell in each tag
total_smells$total <- rowSums(total_smells[,c( "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                                               "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                                               "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT",
                                               "UF", "NDUI", "U", "OP", "NL")], na.rm=T)

# Splite app_name_tag_name as x1 and x2
library(stringr)
total_smells <- data.frame(total_smells, str_split_fixed(total_smells$app_name_tag_name, "_", 2))

# Delete app_name_tag_name col after spliting into 2
total_smells$app_name_tag_name <- NULL

# reorder total_smells df column names as:
total_smells <- total_smells[c("X1", "X2", "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                               "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                               "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT", 
                               "UF", "NDUI", "U", "OP", "NL", "total")]

# change X1 and X2 col names to 'app_name' and 'tag'
colnames(total_smells)[colnames(total_smells) == 'X1'] <- 'app_name'
colnames(total_smells)[colnames(total_smells) == 'X2'] <- 'tag'

#==============================================================================
# to get app catgoery
# read all the layout_smells.csv
apps_details_df  <- read.csv("csvFiles/apps_details.csv", header = TRUE)
apps_details_gp_df  <- read.csv("csvFiles/GOOGLE_PLAY_APP.csv", header = TRUE)

# Delete unwanted cols from apps_details_df df
apps_details_df$LICENSE <- NULL
apps_details_df$REPO_TYPE <- NULL
apps_details_df$ISSUE_TRACKER <- NULL
apps_details_df$SUMMARY <- NULL
apps_details_df$SOURCE <- NULL
apps_details_df$WEBSITE <- NULL
apps_details_df$FRIENDLY_NAME <- NULL

colnames(apps_details_gp_df)

# Delete unwanted cols from apps_details_gp_df df
apps_details_gp_df$ID <- NULL
apps_details_gp_df$TITLE <- NULL
apps_details_gp_df$DESCRIPTION <- NULL


# change col 1 name in apps_details_df df from 'NAME' to 'app_name'
colnames(apps_details_df)[colnames(apps_details_df) == 'NAME'] <- 'app_name'
# change col name in apps_details_df df from 'ID' to 'AppID'
colnames(apps_details_df)[colnames(apps_details_df) == 'ID'] <- 'APPID'

# merage apps_details_df and apps_details_gp_df
apps_details_df = merge(apps_details_df, apps_details_gp_df, by = 'APPID', all = TRUE)

colnames(apps_details_df)[colnames(apps_details_df) == 'NAME'] <- 'package_name'


total_smells = merge(apps_details_df, total_smells, by = 'app_name')

colnames(total_smells)
# reorder total_smells df column names as:
total_smells <- total_smells[c("APPID","app_name", "tag", "package_name", "CATEGORY", "GENRE",
                               "DEVELOPER", "RATING", "MIN_VERSION", "INSTALLS", "CURRENT_VERSION",
                               "URL", "TOTAL_REVIEWS", "SCORE","UPDATED_TEXT","UPDATED_TICKS",
                               "IS_TOP_DEVELOPER", "IS_EDITOR_PICK",
                               "DTWC", "DR", "DW", "IDFP", "IDS", "ISQLQ", "IGS", "LIC", "LT", 
                               "MIM", "NLMR", "PD", "RAM", "SL", "UC", "SCC", "IFB", "UP", "BDTOSN",
                               "DD", "ERB", "NIOOIMT", "THI", "UV", "PDT", 
                               "UF", "NDUI", "U", "OP", "NL", "total")]

# sort by tag
total_smells <- total_smells[order(total_smells$tag),]
# sort by id
total_smells <- total_smells[order(total_smells$APPID),]

# To get the last tag of each app:
total_smells_last_tag = do.call(rbind,lapply(split(total_smells, total_smells$APPID), function(x) tail(x, 1) ) )


#======= To get the total number of smells in each category 

# to count the smell in each category
smells_in_each_category = transform(total_smells_last_tag, num_of_smells= ave(total_smells_last_tag$total, total_smells_last_tag$CATEGORY, FUN=sum))[-2]

# to get the number of app in each category
apps_in_category <- data.frame(table(unlist(smells_in_each_category$CATEGORY)))

# change col 1 name in apps_in_category df from 'Var1' to 'CATEGORY'
colnames(apps_in_category)[colnames(apps_in_category) == 'Var1'] <- 'CATEGORY'
# change col 1 name in apps_in_category df from 'Freq' to 'num_of_apps'
colnames(apps_in_category)[colnames(apps_in_category) == 'Freq'] <- 'num_of_apps'


# get only one instance of each category
smells_in_each_category = do.call(rbind,lapply(split(smells_in_each_category, smells_in_each_category$CATEGORY), function(x) tail(x, 1) ) )

# from smells_in_each_category keep only the following cols
keeps <- c("CATEGORY", "num_of_smells")
smells_in_each_category = smells_in_each_category[ , keeps, drop = FALSE]

smells_in_each_category = merge(smells_in_each_category, apps_in_category, by = 'CATEGORY')


#================= Plots

# Plot histogram to show number of smells in each category: 
library(ggplot2)

# Histogram to show the number of smells in each category
ggplot(data=smells_in_each_category, aes(x=CATEGORY, y= num_of_smells, fill= CATEGORY)) +
  geom_bar(stat="identity", colour="black") + 
  theme(axis.text.x = element_text(size=8, angle=40)) +
  scale_y_continuous(breaks = round(seq(min(smells_in_each_category$num_of_smells), max(smells_in_each_category$num_of_smells), by = 100),1)) +
  xlab("Categories") +  ylab("Num of smells") + labs(fill = "Categories")+
  geom_text(vjust = -0.5,size=3, aes(y = num_of_smells ,label = num_of_apps)) 





