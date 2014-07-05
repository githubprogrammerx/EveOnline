
filename abcd 'C:\Users\ptimusk\Dropbox\EveOnline\logs\Gamelogs\' ;
/* read in all txt log files from 6 years of playing Eve Online*/
data fileDATA;
   infile abcd('*.txt')  ;
   input filename $256. ;
  
/*   date = input(scan(filename,1,'_'),yymmdd8.);*/
/*   session = input(scan(filename,2,'_'),12.);*/
/*   format date yymmdd10. ;*/
run;
libname about 'C:\Users\ptimusk\Dropbox\EveOnline\logs\Gamelogs';
/* write 556902 record dataset to a saved dataset*/
data about.Alllogs20140701;
set filedata;
run;
/* start parsing of gate jump data to reate time stamped 
Markov chain data showing star systems jumped as the markov states
aka drunken internet spaceship pilot walking*/
data about.GateJumpList;
set about.Alllogs20140701;
where filename contains "Jumping";

run;

/* R code with regex below will be converted to SAS code later*/
/*Gatejumplist <- as.character(dataset[grepl( "Jumping" , dataset[,1]) > 0,1])
gatetimes<-as.POSIXct(strptime(str_extract(Gatejumplist,"([[:digit:]]{4})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%Y.%m.%d %H:%M:%S", tz="UTC"))
GateJumpstart<-substr(Gatejumplist[],53,(str_locate(Gatejumplist[],"([[:punct:]]{1})([[:blank:]]{1})([[:alpha:]]{2})([[:blank:]]{1})")[,1]-1))
GateJumpend<-substr(Gatejumplist[],(str_locate(Gatejumplist[],"([[:punct:]]{1})([[:blank:]]{1})([[:alpha:]]{2})([[:blank:]]{1})")[,2]+1),(str_locate(Gatejumplist[],"([[:punct:]]{1})([[:blank:]]{1})([[:alpha:]]{2})([[:blank:]]{1})([[:alpha:]]{+})([[:blank:]])")[,2]-1))
Jumps<-cbind.data.frame(gatetimes,GateJumpstart,GateJumpend)*/
