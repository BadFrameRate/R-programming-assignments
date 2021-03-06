corr<-function(directory,threshold=0){
  if(directory!="specdata") print("Wrong folder")
  else{
    all_files<-list.files(directory)
    n_obs<-complete(directory)
    above_thresh<-as.numeric(n_obs$id[n_obs$obs>threshold])
    if(length(above_thresh)==0) above_thresh
    else{
      corr<-numeric(length(above_thresh))
      for(i in 1:length(above_thresh)){
        openfile<-read.csv(paste(directory,all_files[above_thresh[i]],sep="/"))
        corr[i]<-cor(openfile[,2],openfile[,3],use="pairwise.complete.obs")
      }
      names(corr)<-above_thresh
      corr
    }
  }
}