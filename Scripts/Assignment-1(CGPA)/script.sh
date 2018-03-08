#!/bin/bash

#Download files
$(wget -q "https://ktu.edu.in/eu/att/attachments.htm?download=file&id=hMcUg%2FGA7hU0MOUh4%2FFRxndixG2o4goWV%2B7LYFH48bc%3D" -O S1.pdf)
$(wget -q "https://ktu.edu.in/eu/att/attachments.htm?download=file&id=B28XbixhL2qNkNOb51le3Q%2BfFwQNveszAdAr7o%2FUwqY%3D" -O S2.pdf)

#Convert to PDF
$(pdftotext -layout S1.pdf S1.txt)
$(pdftotext -layout S2.pdf S2.txt)

# Remove all spaces, newline etc.
$(tr -d '\040\011\012\015\014'< S1.txt > S1tmp.txt)
$(sed -i 's/MDL16CS/\nMDL16CS/g' S1tmp.txt)
$(mv S1tmp.txt S1.txt)

$(tr -d '\040\011\012\015\014'< S2.txt > S2tmp.txt)
$(sed -i 's/MDL16CS/\nMDL16CS/g' S2tmp.txt)
$(mv S2tmp.txt S2.txt)

$(grep -v "APJABDULKALAMTECHNOLOGICALUNIVERSITY" S1.txt > S1tmp.txt)
$(mv S1tmp.txt S1.txt)
$(sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' S1.txt)
$(grep -v "ELECTRONICSANDBIOMEDICALENGINEERINGCourse" S1.txt > S1tmp.txt)
$(mv S1tmp.txt S1.txt)

$(grep -v "APJABDULKALAMTECHNOLOGICALUNIVERSITY" S2.txt > S2tmp.txt)
$(mv S2tmp.txt S2.txt)
$(sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' S2.txt)
$(grep -v "ELECTRONICSANDBIOMEDICALENGINEERINGCourse" S2.txt > S2tmp.txt)
$(mv S2tmp.txt S2.txt)

#Remove subjects
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


$(> S1SGPA.txt)
$(> S2SGPA.txt)

#Calculate SGPA
mapfile < S1.txt;
for j in `seq 0 122`;
do
	ARRAY=(${MAPFILE[$j]});
	sum=0;
	count=0;
	mult=0;
	for i in "${ARRAY[@]}";
	do
		case $count in #Credit value
			1)let mult=4;;
			2)let mult=4;;
			3)let mult=3;;
			4)let mult=3;;
			5)let mult=3;;
			6)let mult=3;;
			7)let mult=1;;
			8)let mult=1;;
			9)let mult=1;;
		esac
		case $i in
			"O")sum=$(printf "%f" "$(echo "$sum + $mult * 10"| bc -l)");;
			"A+")sum=$(printf "%f" "$(echo "$sum + $mult * 9"| bc -l)");;
			"A")sum=$(printf "%f" "$(echo "$sum + $mult * 8.5"| bc -l)");;
			"B+")sum=$(printf "%f" "$(echo "$sum + $mult * 8"| bc -l)");;
			"B")sum=$(printf "%f" "$(echo "$sum + $mult * 7"| bc -l)");;
			"C")sum=$(printf "%f" "$(echo "$sum + $mult * 6"| bc -l)");;
			"P")sum=$(printf "%f" "$(echo "$sum + $mult * 5"| bc -l)");;
			"F");;
			"FE");;
			"I");;
			*)roll=$i
		esac
		let count=count+1;
	done
	sum=$(printf "%.1f" "$(echo "$sum/23" | bc -l;)")
	echo "$roll $sum" >> S1SGPA.txt;
done

mapfile < S2.txt;
for j in `seq 0 122`;
do
        ARRAY=(${MAPFILE[$j]});
        sum=0;
	count=0;
	mult=0;
        for i in "${ARRAY[@]}";
        do
               case $count in
                        1)let mult=4;;
                        2)let mult=4;;
                        3)let mult=3;;
                        4)let mult=1;;
                        5)let mult=1;;
                        6)let mult=4;;
                        7)let mult=3;;
                        8)let mult=3;;
                        9)let mult=1;;
                esac
                case $i in
                        "O")sum=$(printf "%f" "$(echo "$sum + $mult * 10"| bc -l)");;
                        "A+")sum=$(printf "%f" "$(echo "$sum + $mult * 9"| bc -l)");;
                        "A")sum=$(printf "%f" "$(echo "$sum + $mult * 8.5"| bc -l)");;
                        "B+")sum=$(printf "%f" "$(echo "$sum + $mult * 8"| bc -l)");;
                        "B")sum=$(printf "%f" "$(echo "$sum + $mult * 7"| bc -l)");;
                        "C")sum=$(printf "%f" "$(echo "$sum + $mult * 6"| bc -l)");;
                        "P")sum=$(printf "%f" "$(echo "$sum + $mult * 5"| bc -l)");;
                        "F");;
                        "FE");;
			"I");;
                        *)roll=$i
                esac
                let count=count+1;
        done
        sum=$(printf "%.1f" "$(echo "$sum/24" | bc -l;)")
        echo "$roll $sum" >> S2SGPA.txt;
done

$(rm S1.txt)
$(rm S2.txt)


$(> TotalCGPA.txt)
#Calculate SGPA
paste S1SGPA.txt S2SGPA.txt | awk '{printf "%s %.1f\n",$1, ($2*23+$4*24)/47}' > TotalCGPA.txt
#Download student list
$(wget -q http://14.139.184.212/ask/c4b/c4b.txt -O c4b.txt)
#Join all 3 files
$(cut -f 4- c4b.txt > c4b1.txt)
$(join <(sort TotalCGPA.txt) <(sort S1SGPA.txt) | join - <(sort S2SGPA.txt) | join - <(sort c4b1.txt)  > tmpCGPA.txt )
$(mv tmpCGPA.txt TotalCGPA.txt)
$(rm c4b*.txt)
$(rm *SGPA*)
$(rm *.pdf)
