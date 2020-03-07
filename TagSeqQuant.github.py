import subprocess 
import os 
import commands
import sys
InputName=sys.argv[1]
trans_ref=sys.argv[2]
genome_ref=sys.argv[3]
all_fastq=InputName+".fastq"
tag_fastq=InputName+".tag.fastq"
nontag_fastq=InputName+".nontag.fastq"


commands.getoutput("fastqc %s %s %s" %(all_fastq,tag_fastq,nontag_fastq))
commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  trans.NAD.paf" %(trans_ref,tag_fastq))
commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  trans.all.paf" %(trans_ref,all_fastq))
commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  trans.nonNAD.paf" %(trans_ref,nontag_fastq))


commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  genome.NAD.paf" %(genome_ref, tag_fastq))
commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  genome.all.paf" %(genome_ref, all_fastq))
commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  genome.nonNAD.paf" %(genome_ref ,nontag_fastq))


commands.getoutput("minimap2 -ax splice -uf -k14 %s %s >  genome.NAD.sam" %(genome_ref, tag_fastq))
commands.getoutput("minimap2 -ax splice -uf -k14 %s %s >  trans.NAD.sam" %(trans_ref, tag_fastq))

commands.getoutput("minimap2 -ax splice -uf -k14 %s %s >  genome.nonNAD.sam" %(genome_ref, nontag_fastq))
commands.getoutput("minimap2 -ax splice -uf -k14 %s %s >  trans.nonNAD.sam" %(trans_ref,nontag_fastq))


commands.getoutput("samtools view -b -S genome.NAD.sam >NAD.bam")
commands.getoutput("samtools view -b -S genome.nonNAD.sam >nonNAD.bam")
commands.getoutput("samtools sort -T NAD.sort -o NAD.sort.bam NAD.bam")
commands.getoutput("samtools sort -T nonNAD.sort -o nonNAD.sort.bam nonNAD.bam")
commands.getoutput("samtools index nonNAD.sort.bam")
commands.getoutput("samtools index NAD.sort.bam")

commands.getoutput("Rscript --vanilla TagSeqQuant.github.r")


