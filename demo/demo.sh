SECONDS=0
# do some work
tar -zxvf TAIR10.trans.fa.tar.gz 
tar -zxvf TAIR10.genome.fa.tar.gz

python TagSeek.NPdemo.py --fastq demo --tag 'CCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAA' --similarity 12
python TagSeqQuant.NPdemo.py --name demo --trans TAIR10.trans.fa --genome TAIR10.genome.fa

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
