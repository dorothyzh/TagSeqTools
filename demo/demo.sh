SECONDS=0
# do some work
python TagSeek.github.py -f demo -t 'CCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAACCUGAA' -s 12
python TagSeqQuant.github.py demo TAIR10.trans.fa TAIR10.genome.fa

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
