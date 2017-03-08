library(foreign)
library(ggplot2)
library(data.table)
library(gmodels)


data <- read.csv("~/Desktop/Open Data Science/IODS-project/raportti.csv")
View(data)

data <- data.frame(data)


#Demographics
data$jobfunction <- factor(data$X1.1.Which.of.the.following.most.closely.matches.your.primary.job.function..,
                           levels = c(0:6),
                           labels = c("Developing software", "Testing software", "UX Design", "Management", "Operations", "Architecture", "Other"))
data$worktime <- data$X1.2.How.long.have.you.been.working.in.your.current.company.role.
data$birthyear <- data$X1.3.What.is.your.year.of.birth.
data$birthyear[31] <- data$birthyear[31] + 1900 # Fix data entry error
data$age <- CURRENTYEAR - data$birthyear

#2.1
data$useractivities.specifying.requirements <- data$Specifying.requirements
data$useractivities.designing.software <- data$Designing.software
data$useractivities.implementing.software <- data$Implementing.software
data$useractivities.testing <- data$Testing
data$useractivities.after.release <- data$The.activities.after.release
data$useractivities.other <- data$Other
data$useractivities.other.open <- data$If.other..please.specify..separate.with.commas.
data$useractivities.options <- c("Specifying requirements", "Designing software", "Implementing software", "Testing", "The activities after release", "Other")

#2.2

data$userinv.S1 <- data$X2.2..How.much.do.you.agree.with.the.following.statements...I.know.who.uses.the.software.I.contribute.to.in.my.work
data$userinv.S2 <- data$X2.2..How.much.do.you.agree.with.the.following.statements...I.need.to.ask.for.permission.to.contact.users
data$userinv.S3 <- data$X2.2..How.much.do.you.agree.with.the.following.statements...I.frequently.have.direct.contact.with.users
data$userinv.S4 <- data$X2.2..How.much.do.you.agree.with.the.following.statements...I.have.sufficient.information.about.users..needs
data$userinv.S5 <- data$X2.2..How.much.do.you.agree.with.the.following.statements...I.have.information.about.users.that.is.relevant.for.my.work
data$userinv.S6 <- data$X2.2..How.much.do.you.agree.with.the.following.statements...The.information.I.have.about.users.is.up.to.date
data$userinv.statements <- c(
  "I know who uses the software I contribute to in my work",
  "I need to ask for permission to contact users",
  "I frequently have direct contact with users",
  "I have sufficient information about users’ needs",
  "I have information about users that is relevant for my work",
  "The information I have about users is up to date"
)
data$userinv.options <- c("Completely disagree", "Disagree", "Neither disagree or agree", "Agree", "Completely agree", "I don't know")

write.csv(data, file = "data_final.csv", row.names = FALSE)
attach(data)

