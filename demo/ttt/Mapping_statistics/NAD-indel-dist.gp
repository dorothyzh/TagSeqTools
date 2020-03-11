
        set terminal png size 600,400 truecolor
        set output "Mapping_statistics/NAD-indel-dist.png"
        set grid xtics ytics y2tics back lc rgb "#cccccc"
        set style line 1 linetype 1  linecolor rgb "red"
        set style line 2 linetype 2  linecolor rgb "black"
        set style line 3 linetype 3  linecolor rgb "green"
        set style increment user
        set ylabel "Indel count [log]"
        set xlabel "Indel length"
        set y2label "Insertions/Deletions ratio"
        set log y
        set y2tics nomirror
        set ytics nomirror
        set title "NAD_Mapping_statistics.txt"
        plot '-' w l ti 'Insertions', '-' w l ti 'Deletions', '-' axes x1y2 w l ti "Ins/Dels ratio"
    1	11240
2	4059
3	1400
4	472
5	194
6	93
7	32
8	8
9	4
10	5
11	0
12	2
13	2
14	1
15	0
16	0
17	0
18	0
19	1
22	1
23	0
53	1
83	1
end
1	20203
2	9539
3	4547
4	1972
5	1091
6	571
7	285
8	176
9	99
10	59
11	42
12	27
13	16
14	7
15	8
16	4
17	6
18	3
19	2
22	3
23	1
53	0
83	0
end
1	0.556353
2	0.425516
3	0.307895
4	0.239351
5	0.177819
6	0.162872
7	0.112281
8	0.045455
9	0.040404
10	0.084746
11	0.000000
12	0.074074
13	0.125000
14	0.142857
15	0.000000
16	0.000000
17	0.000000
18	0.000000
19	0.500000
22	0.333333
23	0.000000
53	0.000000
83	0.000000
end
