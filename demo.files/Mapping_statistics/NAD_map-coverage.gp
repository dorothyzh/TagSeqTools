
            set terminal png size 600,400 truecolor
            set output "Mapping_statistics/NAD_map-coverage.png"
            set grid xtics ytics y2tics back lc rgb "#cccccc"
            set ylabel "Number of mapped bases"
            set xlabel "Coverage"
            set log y
            set style fill solid border -1
            set title "NAD_Mapping_statistics.txt"
            set xrange [:36]
            plot '-' with lines notitle
        1	310411
2	34065
3	13269
4	8612
5	4261
6	4485
7	2118
8	1797
9	419
10	555
11	50
12	82
13	49
14	34
15	80
16	106
17	70
18	461
19	48
20	57
21	211
22	553
23	51
24	1057
25	45
26	66
27	60
28	463
29	16
30	26
31	517
33	1
34	2
36	2
37	1
38	1
40	1
41	3
42	1
43	1
45	2
46	1
47	2
49	2
50	1
51	3
52	2
53	3
54	3
55	2
57	3
58	3
60	1
61	1
64	1
65	2
66	1
67	2
68	3
69	2
70	1
71	7
73	7
74	8
75	12
76	1
77	39
78	2
79	18
80	34
81	3
82	14
85	9
86	23
87	36
88	45
89	462
end
