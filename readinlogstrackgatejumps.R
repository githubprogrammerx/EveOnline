setwd("C:/Users/ptimusk/Dropbox/EveOnline/logs/Gamelogs/")

file_list <- list.files()

for (file in file_list[1:10]){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE,quote="", sep="\t")
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE,  quote="", sep="\t")
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }
        
}
for (file in file_list[11:25000]){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE,quote="", sep="\t")
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE,  quote="", sep="\t")
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }
        
}

for (file in file_list[25001:50000]){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE,quote="", sep="\t")
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE,  quote="", sep="\t")
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }
        
}
for (file in file_list[50001:85000]){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE,quote="", sep="\t")
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE,  quote="", sep="\t")
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }
        
}
for (file in file_list[85001:120078]){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE,quote="", sep="\t")
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE,  quote="", sep="\t")
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }
        
}
sessionstartlist <- dataset[grepl(  "Session started" , dataset[,1]) > 0,1]
sessionstartlisttimes<-as.POSIXct(strptime(str_extract(sessionstartlist,"([[:digit:]]{4})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%Y.%m.%d %H:%M:%S", tz="UTC"))
starttimes<-as.POSIXct(strptime(str_extract(sessionstartlist,"([[:digit:]]{4})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%Y.%m.%d %H:%M:%S", tz="UTC"))
Gatejumplist <- as.character(dataset[grepl(  "Jumping" , dataset[,1]) > 0,1])
gatetimes<-as.POSIXct(strptime(str_extract(Gatejumplist,"([[:digit:]]{4})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%Y.%m.%d %H:%M:%S", tz="UTC"))
GateJumpstart<-substr(Gatejumplist[],53,(str_locate(Gatejumplist[],"([[:punct:]]{1})([[:blank:]]{1})([[:alpha:]]{2})([[:blank:]]{1})")[,1]-1))
GateJumpend<-substr(Gatejumplist[],(str_locate(Gatejumplist[],"([[:punct:]]{1})([[:blank:]]{1})([[:alpha:]]{2})([[:blank:]]{1})")[,2]+1),(str_locate(Gatejumplist[],"([[:punct:]]{1})([[:blank:]]{1})([[:alpha:]]{2})([[:blank:]]{1})([[:alpha:]]{+})([[:blank:]])")[,2]-1))
Jumps<-cbind.data.frame(gatetimes,GateJumpstart,GateJumpend)