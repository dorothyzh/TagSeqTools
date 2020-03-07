
############################ R--~/nano/leave/2019NAD.at.short.r
######------NAD
paf=read.delim("trans.NAD.paf",header=F)
NADpaf.sub=as.character(subset(paf,V3>15)[,6])
NAD.count=as.data.frame(table(NADpaf.sub))

######------nonNAD
paf=read.delim("trans.nonNAD.paf",header=F)

######------all RNA
allpaf=as.character(paf[,6])
all.count=as.data.frame(table(allpaf))
all.count[is.na(all.count[,2]),2]=0

######------------------combine NAD RNA and total RNA counts
count_convert=function(count,type){
  count$Gene=sapply(as.character(count[,1]),function(x){x=unlist(strsplit(x,split="\\."))[1]})
  count=count[,c(3,2)]
  
  tranTOgene=function(x){	
    id=unique(x[,1])
    out=data.frame(Gene=id,count=0)
    for (j in 1:length(id)){
      bb=x[x[,1]==id[j],]
      out[j,2]=sum(as.numeric(bb[,2]))
    }
    x=out
  }
  
  gene=tranTOgene(count)
  gene$count=as.numeric(gene$count)
  print(paste("total number of ",type,"count",sum(gene$count)))
  gene=gene[order(gene$count,decreasing=T),]
  #dim(gene)
  print(paste("total number of ",type,"count",dim(gene)[1]))
  return(gene)
}

all.count=all.count[!all.count[,1]=="",]
all=count_convert(all.count,"all")

if (file.info("trans.NAD.paf")$size>0){
  
  NAD=count_convert(NAD.count,"NAD")
  
  ab2=merge.data.frame(NAD,all,by="Gene",all=T)
  names(ab2)[2]="NAD.count"
  names(ab2)[3]="total.count"
  ab2[is.na(ab2[,3]),3]=0
  ab2[,3]=ab2[,2]+ab2[,3]
  write.table(ab2,"NAD_total_counts.txt",sep="\t",quote=F,row.names=F)
  
  isoform=merge.data.frame(NAD.count,all.count,by.x="NADpaf.sub",by.y="allpaf",all=T)
  names(isoform)=c("Gene","NAD.count","total.count")
  isoform[is.na(isoform[,3]),3]=0
  isoform[,3]=isoform[,2]+isoform[,3]
  write.table(isoform,"NAD_total_isoform_counts.txt",sep="\t",quote=F,row.names=F)
  
  stat=data.frame(category=c("total number of count","total number of gene","total number of NAD count","total number of NAD gene"),num=c(sum(all$count),dim(all)[1],sum(NAD$count),dim(NAD)[1]))
  write.csv(stat,"stat.csv",quote=F,row.names=F)
} else{
  ab2=all
  names(ab2)[2]="count.total"
  ab2[is.na(ab2[,3]),3]=0
  ab2[,3]=ab2[,2]+ab2[,3]
  write.table(ab2,"NAD_total_counts.txt",sep="\t",quote=F,row.names=F)
  
  isoform=all.count
  names(isoform)=c("Gene","NAD.count","total.count")
  isoform[is.na(isoform[,3]),3]=0
  isoform[,3]=isoform[,2]+isoform[,3]
  write.table(isoform,"NAD_total_isoform_counts.txt",sep="\t",quote=F,row.names=F)
  
  
  stat=data.frame(category=c("total number of count","total number of gene","total number of NAD count","total number of NAD gene"),num=c(sum(all$count),dim(all)[1],0,0))
  write.csv(stat,"stat.csv",quote=F,row.names=F)
  }


