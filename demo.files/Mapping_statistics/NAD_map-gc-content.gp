
            set terminal png size 600,400 truecolor
            set output "Mapping_statistics/NAD_map-gc-content.png"
            set grid xtics ytics y2tics back lc rgb "#cccccc"
            set title "NAD_Mapping_statistics.txt"
            set ylabel "Normalized Frequency"
            set xlabel "GC Content [%]"
            set yrange [0:1.1]
            set label sprintf("%.1f",42.46) at 42.46,1 front offset 1,0
            plot '-' smooth csplines with lines lc 1 title 'First fragments' 
        12	0.000000
25	0.054054
26	0.000000
28	0.027027
30	0.000000
32	0.027027
33	0.000000
34	0.054054
34	0.000000
35	0.027027
35	0.135135
36	0.054054
36	0.189189
37	0.162162
37	0.243243
38	0.216216
38	0.378378
39	0.351351
39	0.432432
40	0.513514
40	0.540541
41	0.621622
41	0.702703
42	1.000000
42	0.837838
43	0.648649
43	0.783784
44	0.567568
45	0.513514
45	0.486486
46	0.297297
47	0.162162
47	0.216216
48	0.054054
48	0.135135
49	0.054054
50	0.027027
51	0.000000
52	0.054054
52	0.000000
53	0.027027
54	0.000000
54	0.027027
55	0.000000
55	0.054054
end
