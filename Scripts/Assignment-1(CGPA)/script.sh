#!/bin/bash

$(pdftotext -layout S1.pdf S1.txt)
$(pdftotext -layout S2.pdf S2.txt)

$(tr -d '\040\011\012\015\014'< S1.txt > S1tmp.txt)
$(sed -i 's/MDL16CS/\nMDL16CS/g' S1tmp.txt)
$(mv S1tmp.txt S1.txt)

$(grep -v "APJABDULKALAMTECHNOLOGICALUNIVERSITY" S1.txt > S1tmp.txt)
$(mv S1tmp.txt S1.txt)
$(grep -v "ELECTRONICSANDBIOMEDICALENGINEERINGCourse" S1.txt > S1tmp.txt)
$(mv S1tmp.txt S1.txt)
