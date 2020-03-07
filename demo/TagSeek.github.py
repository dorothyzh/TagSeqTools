import os
import sys
import re
from Bio import SeqIO
import regex 
import argparse


print("Copyright [2018] [ZHONG Huan]")

print('Licensed under the Apache License, Version 2.0 (the "License");')
print("you may not use this file except in compliance with the License.")
print("You may obtain a copy of the License at")

print("    http://www.apache.org/licenses/LICENSE-2.0")

print("Unless required by applicable law or agreed to in writing, software")
print('distributed under the License is distributed on an "AS IS" BASIS,')
print("WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.")
print("See the License for the specific language governing permissions and")
print("limitations under the License.")
print("")


parser = argparse.ArgumentParser(description='Check Input files and parameters')
parser.add_argument("-f",'--fastq_input_name' , 
                   help='Input fastq file')
parser.add_argument("-t",'--tag_input_sequence' ,
                   help='Tag Sequence')
parser.add_argument('-s','--similarity_tag_cutoff', type=int,
                   help='an integer for similarity cut off')

args = parser.parse_args()

def count_specific(tup, x):
    count = 0
    for ele in tup:
        if (ele == x):
            count = count + 1
    return count


def count_all(tup):
    uniq_tup=tuple(set(tup))
    for ele in uniq_tup:
        pattern=str(ele.split(':')[1])
        final_count=count_specific(tup, ele)
        print("The number of "+pattern+" detected: "+str(final_count))

def TagSeek(Input_fastq_name,Input_tag_sequence,Tag_similarity_cutoff):

	Output_tag_fastq=Input_fastq_name+".tag"
	Output_nontag_fastq=Input_fastq_name+".nontag"
	Input_fastq_name=Input_fastq_name+".fastq"
	#open(Input_fastq_name+'.fastq','w+')
	len=int(Tag_similarity_cutoff)

	countseqs = 0  
	countSEQ_1 = 0  
	start=0
	pattern=tuple()

	for i in range(len+1):
		pattern=pattern+(Input_tag_sequence[i:len+i],)

	pattern=tuple(set(pattern))
	countPattern=tuple()
	sucseqs=0

	for record in SeqIO.parse(Input_fastq_name,"fastq"): # scrolls through fastq file, using SeqIO package  

		countseqs += 1 # counts number of sequences measured  
  		allPatternCounts=0
		
		for p in pattern:
  
			seq1 = regex.search(p, str(record.seq)[:40])
	        	countSEQ_1=0
		
			if seq1:  
   	  			countSEQ_1 +=1
				allPatternCounts +=1  
                        	countPattern=countPattern+(str(countSEQ_1)+":"+p,)
   	
		if allPatternCounts>0:
			output_handle = open(str(Output_tag_fastq+'.fastq'), "a")
			SeqIO.write(record, output_handle, "fastq-sanger")
#			output_handle.close()
			sucseqs +=1		
		else:
                	output_handle = open(str(Output_nontag_fastq+'.fastq'), "a")
                	SeqIO.write(record, output_handle, "fastq-sanger")

	count_all(countPattern) 
 
	print("Fastq file Reading from", Input_fastq_name)
	print("Tag similarity cut off is "+str(Tag_similarity_cutoff))
	print(countseqs, "records analysed.")

TagSeek(args.fastq_input_name,args.tag_input_sequence,args.similarity_tag_cutoff)
