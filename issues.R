# read github_issues_url.csv file
apss  <- read.csv("csvFiles/github_issues_url.csv", header = TRUE)

# read all the results_issues.csv
issues  <- read.csv("csvFiles/issues.csv", header = TRUE)

# read results_labels.csv
labels  <- read.csv("csvFiles/labels.csv", header = TRUE)

# To find exactly which IDs are duplicated in issues df
as.character(issues[which(duplicated(as.character(issues$id))), "id"])
as.character(labels[which(duplicated(as.character(labels$issue_id))), "issue_id"])

# Keep only the none duplicate IDs (Only unque IDs)
issues <- issues[!duplicated(issues$id), ]

# Keep only the none duplicate labels (Only unque labels)
labels <- labels[!duplicated(labels), ]


# count the number of issues in each app (occurrence of repo_url in issues df)
issues_in_apps <- data.frame(table(unlist(issues$repo_url)))

# change col 1 name in issues_in_apps df from 'Var1' to 'repo_url'
colnames(issues_in_apps)[colnames(issues_in_apps) == 'Var1'] <- 'repo_url'
# change col 1 name in issues_in_apps df from 'Freq' to 'total_issues'
colnames(issues_in_apps)[colnames(issues_in_apps) == 'Freq'] <- 'total_issues'

# count the number of the open issues in each app
open_issues <- data.frame(table(unlist(issues$repo_url[which(issues$state == 'open')])))

# change cols name
colnames(open_issues)[colnames(open_issues) == 'Var1'] <- 'repo_url'
colnames(open_issues)[colnames(open_issues) == 'Freq'] <- 'open_issues'

# count the number of the closed issues in each app
closed_isses <- data.frame(table(unlist(issues$repo_url[which(issues$state == 'closed')])))

# change cols name
colnames(closed_isses)[colnames(closed_isses) == 'Var1'] <- 'repo_url'
colnames(closed_isses)[colnames(closed_isses) == 'Freq'] <- 'closed_issues'

# merge the data frames by repo_url (merge func can only take 2 args)
count_issues <- merge(open_issues, closed_isses, by="repo_url")
count_issues <- merge(count_issues, issues_in_apps, by="repo_url")

# another way to merage data frames is:
# count_issues <- cbind.data.frame(issues_in_apps,open_issues,closed_isses)

# total number of open issues
length(which(issues$state == 'open'))

# total number of closed issues
length(which(issues$state == 'closed'))

# number of apps which have labels
length(unique(labels$issue_repo_url))

# number of issues labeled as "bug"
length(which(labels$label == 'bug'))

# number of issues labeled as bug in each app
num_issues_labeled_bug <- data.frame(table(unlist(labels$issue_repo_url[which(labels$label == 'bug')])))

# change cols names
colnames(num_issues_labeled_bug)[colnames(num_issues_labeled_bug) == 'Var1'] <- 'repo_url'
colnames(num_issues_labeled_bug)[colnames(num_issues_labeled_bug) == 'Freq'] <- 'issues_labeled_as_bug'

# from labels df get only issues labeled as bug
issues_with_bug_label <- labels[labels$label == 'bug',]

# check if there is any duplication in issues_with_bug_label df
as.character(issues_with_bug_label[which(duplicated(as.character(issues_with_bug_label$issue_id))), "issue_id"])


# Merage issues df with issues_with_bug_label in a df called issues_bug
  # 1, chnage the col name in issues df from id to issue_id
colnames(issues)[colnames(issues) == 'id'] <- 'issue_id'

  # 2, Merage
issues_bug <- merge(issues_with_bug_label, issues, by="issue_id")

# =============================================================================================

# from issues df get only apps where repo url == https://api.github.com/repos/0xPoly/Strongbox
issues[issues$repo_url == 'https://api.github.com/repos/0xPoly/Strongbox',]

# to Filter data
# load dplyr lib
library(dplyr)   
# get only open issues for where repo_url = https://api.github.com/repos/0xPoly/Strongbox
only_open = data.frame(filter(issues, issues$repo_url == "https://api.github.com/repos/0xPoly/Strongbox", issues$state == 'open'))

# count the number of open issues in a specific repo
data.frame(nrow(filter(issues, issues$repo_url == "https://api.github.com/repos/0xPoly/Strongbox", issues$state == 'open')))