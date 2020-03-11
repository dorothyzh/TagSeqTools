
            set terminal png size 600,500 truecolor
            set output "Mapping_statistics/NAD_map-gc-depth.png"
            set grid xtics ytics y2tics back lc rgb "#cccccc"
            set ylabel "Mapped depth"
            set xlabel "Percentile of mapped sequence ordered by GC content"
            set x2label "GC Content [%]"
            set title "NAD_Mapping_statistics.txt"
            set x2tics ("30" 1.518,"40" 13.015,"50" 99.349)
            set xtics nomirror
            set xrange [0.1:99.9]

            plot '-' using 1:2:3 with filledcurve lt 1 lc rgb "#dedede" t '10-90th percentile' , \
                 '-' using 1:2:3 with filledcurve lt 1 lc rgb "#bbdeff" t '25-75th percentile' , \
                 '-' using 1:2 with lines lc rgb "#0084ff" t 'Median'
        0.434	0.000	0.000
0.651	0.035	0.035
1.518	0.035	0.035
2.603	0.035	0.035
4.121	0.035	0.035
8.026	0.035	0.035
13.015	0.035	0.071
22.993	0.035	0.071
37.527	0.035	0.106
54.230	0.035	0.106
68.764	0.035	0.141
78.308	0.035	0.071
88.503	0.035	0.106
92.842	0.035	0.141
96.312	0.035	0.106
98.482	0.035	0.141
99.349	0.035	0.071
100.000	0.035	0.106
end
0.434	0.000	0.000
0.651	0.035	0.035
1.518	0.035	0.035
2.603	0.035	0.035
4.121	0.035	0.035
8.026	0.035	0.035
13.015	0.035	0.035
22.993	0.035	0.035
37.527	0.035	0.035
54.230	0.035	0.071
68.764	0.035	0.071
78.308	0.035	0.035
88.503	0.035	0.035
92.842	0.035	0.106
96.312	0.035	0.071
98.482	0.035	0.141
99.349	0.035	0.035
100.000	0.035	0.106
end
0.434	0.000
0.651	0.035
1.518	0.035
2.603	0.035
4.121	0.035
8.026	0.035
13.015	0.035
22.993	0.035
37.527	0.035
54.230	0.035
68.764	0.035
78.308	0.035
88.503	0.035
92.842	0.035
96.312	0.035
98.482	0.035
99.349	0.035
100.000	0.035
end
