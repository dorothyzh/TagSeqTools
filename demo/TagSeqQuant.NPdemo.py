import subprocess 
import os 
import commands
import sys
import argparse

parser = argparse.ArgumentParser(description='Check Input files and parameters')
parser.add_argument("-n",'--name' , 
                   help='Input fastq sample name (prefix of tag fastq and nontag fastq should be same)')
parser.add_argument("-g",'--genome' ,
                   help='genome reference')
parser.add_argument('-tr','--trans', 
                   help='transcriptome refernce')

args = parser.parse_args()

def TagSeqQuant(InputName,trans_ref,genome_ref):
	all_fastq=InputName+".fastq"
	tag_fastq=InputName+".tag.fastq"
	nontag_fastq=InputName+".nontag.fastq"

	print("Start QC........................................")
	commands.getoutput("mkdir QC_results")
	commands.getoutput("fastqc --outdir QC_results %s %s %s" %(all_fastq,tag_fastq,nontag_fastq))

	print("Start Mapping....................................")
	commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  trans.NAD.paf" %(trans_ref,tag_fastq))
	commands.getoutput("minimap2 -cx splice -uf -k14 %s %s >  trans.nonNAD.paf" %(trans_ref,nontag_fastq))
	commands.getoutput("minimap2 -ax splice -uf -k14 %s %s >  genome.NAD.sam" %(genome_ref, tag_fastq))
	commands.getoutput("minimap2 -ax splice -uf -k14 %s %s >  genome.nonNAD.sam" %(genome_ref, nontag_fastq))

	commands.getoutput("samtools view -b -S genome.NAD.sam >NAD.bam && samtools sort -T NAD.sort -o NAD.sort.bam NAD.bam && samtools index NAD.sort.bam && rm genome.NAD.sam NAD.bam && samtools stats NAD.sort.bam >NAD_Mapping_statistics.txt")
	commands.getoutput("samtools view -b -S genome.nonNAD.sam >nonNAD.bam && samtools sort -T nonNAD.sort -o nonNAD.sort.bam nonNAD.bam && samtools index nonNAD.sort.bam && rm genome.nonNAD.sam nonNAD.bam && samtools stats nonNAD.sort.bam>nonNAD_Mapping_statistics.txt")
	commands.getoutput("plot-bamstats NAD_Mapping_statistics.txt -p Mapping_statistics/NAD_map && plot-bamstats nonNAD_Mapping_statistics.txt -p Mapping_statistics/nonNAD_map")
	commands.getoutput("mkdir Mapping_results && mv *bam* *txt Mapping_results")

	print("Start Quantification..............................")

	commands.getoutput("Rscript --vanilla TagSeqQuant.NPdemo.r")

	commands.getoutput("mkdir Quantification_results && mv *txt *paf Quantification_results")

TagSeqQuant(args.name,args.trans,args.genome)
