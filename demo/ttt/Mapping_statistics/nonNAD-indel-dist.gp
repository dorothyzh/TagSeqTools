
        set terminal png size 600,400 truecolor
        set output "Mapping_statistics/nonNAD-indel-dist.png"
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
        set title "nonNAD_Mapping_statistics.txt"
        plot '-' w l ti 'Insertions', '-' w l ti 'Deletions', '-' axes x1y2 w l ti "Ins/Dels ratio"
    1	46644
2	15534
3	5449
4	1917
5	651
6	268
7	99
8	52
9	21
10	13
11	7
12	3
13	3
14	2
15	2
16	1
17	1
18	0
19	0
20	0
21	1
22	1
23	0
24	0
25	0
26	0
27	1
28	0
29	1
34	0
37	0
39	1
58	1
64	1
104	1
212	1
end
1	88224
2	42539
3	19762
4	8975
5	4507
6	2366
7	1337
8	744
9	448
10	288
11	173
12	110
13	78
14	55
15	42
16	25
17	16
18	13
19	4
20	7
21	8
22	2
23	5
24	3
25	3
26	1
27	2
28	1
29	0
34	1
37	1
39	0
58	0
64	0
104	0
212	0
end
1	0.528700
2	0.365171
3	0.275731
4	0.213593
5	0.144442
6	0.113271
7	0.074046
8	0.069892
9	0.046875
10	0.045139
11	0.040462
12	0.027273
13	0.038462
14	0.036364
15	0.047619
16	0.040000
17	0.062500
18	0.000000
19	0.000000
20	0.000000
21	0.125000
22	0.500000
23	0.000000
24	0.000000
25	0.000000
26	0.000000
27	0.500000
28	0.000000
29	0.000000
34	0.000000
37	0.000000
39	0.000000
58	0.000000
64	0.000000
104	0.000000
212	0.000000
end
