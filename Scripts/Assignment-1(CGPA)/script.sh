#!/bin/bash

$(pdftotext -layout S1.pdf S1.txt)
$(pdftotext -layout S2.pdf S2.txt)

$(tr -d '\040\011\012\015\014'< S1.txt > S1tmp.txt)
$(sed -i 's/MDL16CS/\nMDL16CS/g' S1tmp.txt)
$(mv S1tmp.txt S1.txt)

$(tr -d '\040\011\012\015\014'< S2.txt > S2tmp.txt)
$(sed -i 's/MDL16CS/\nMDL16CS/g' S2tmp.txt)
$(mv S2tmp.txt S2.txt)

$(grep -v "APJABDULKALAMTECHNOLOGICALUNIVERSITY" S1.txt > S1tmp.txt)
$(mv S1tmp.txt S1.txt)
$(grep -v "ELECTRONICSANDBIOMEDICALENGINEERINGCourse" S1.txt > S1tmp.txt)
$(mv S1tmp.txt S1.txt)

$(grep -v "APJABDULKALAMTECHNOLOGICALUNIVERSITY" S2.txt > S2tmp.txt)
$(mv S2tmp.txt S2.txt)
$(grep -v "ELECTRONICSANDBIOMEDICALENGINEERINGCourse" S2.txt > S2tmp.txt)
$(mv S2tmp.txt S2.txt)

$(sed -i 's/MA101(/ /g' S1.txt)
$(sed -i 's/),PH100(/ /g' S1.txt)
$(sed -i 's/),BE110(/ /g' S1.txt)
$(sed -i 's/),BE10105(/ /g' S1.txt)
$(sed -i 's/),BE103(/ /g' S1.txt)
$(sed -i 's/),EE100(/ /g' S1.txt)
$(sed -i 's/),PH110(/ /g' S1.txt)
$(sed -i 's/),EE110(/ /g' S1.txt)
$(sed -i 's/),CS110(/ /g' S1.txt)
$(sed -i 's/)/ /g' S1.txt)

$(sed -i 's/CY100(/ /g' S2.txt)
$(sed -i 's/),BE100(/ /g' S2.txt)
$(sed -i 's/),EC100(/ /g' S2.txt)
$(sed -i 's/),CY110(/ /g' S2.txt)
$(sed -i 's/),EC110(/ /g' S2.txt)
$(sed -i 's/),MA102(/ /g' S2.txt)
$(sed -i 's/),BE102(/ /g' S2.txt)
$(sed -i 's/),CS120(/ /g' S2.txt)
$(sed -i 's/),CS100(/ /g' S2.txt)
$(sed -i 's/)/ /g' S2.txt)


$(> S1CGPA.txt)
$(> S2CGPA.txt)

mapfile < S1.txt;
for j in `seq 0 121`;
do
	ARRAY=(${MAPFILE[$j]});
	sum=0;
	for i in "${ARRAY[@]}";
	do
		case $i in
			"O")let "sum+=10";;
			"A+")let "sum+=9";;
			"A")let "sum+=8";;
			"B+")let "sum+=7";;
			"B")let "sum+=6";;
			"C")let "sum+=5";;
			"P")let "sum+=4";;
			"F");;
			"FE");;
			*)roll=$i
		esac
	done
	sum=$(printf "%.1f" "$(echo "$sum/9" | bc -l;)")
	echo "$roll $sum" >> S1CGPA.txt;
done

mapfile < S2.txt;
for j in `seq 0 121`;
do
        ARRAY=(${MAPFILE[$j]});
        sum=0;
        for i in "${ARRAY[@]}";
        do
                case $i in
                        "O")let "sum+=10";;
                        "A+")let "sum+=9";;
                        "A")let "sum+=8";;
                        "B+")let "sum+=7";;
                        "B")let "sum+=6";;
                        "C")let "sum+=5";;
                        "P")let "sum+=4";;
                        "F");;
                        "FE");;
                        *)roll=$i
                esac
        done
        sum=$(printf "%.1f" "$(echo "$sum/9" | bc -l;)")
        echo "$roll $sum" >> S2CGPA.txt;
done

$(rm S1.txt)
$(rm S2.txt)
