Assignment - 1 :
- Download results of S1, S2
- Convert to text file
- Sort out CS results
- Calculate SGPA of S1, S2
- Calculate CGPA of both together

using shell scripting.

Approach :

- Downloaded results from https://ktu.edu.in/eu/res/viewExamResults.htm?examDefIdEnr=LpBmCci4xl%2BUU1ElM5Ta7ur7NwV9ySMu8tz0hktxfio%3D&type=33X30ZkQBhbZtfM52WojhuPuSdt1pxpni%2FaM98VfPH4%3D&publishId=pCMWMQ%2BL4VDY%2BvpE2LT5AZ7kbSeO3hZL1ABW%2BR64%2FbY%3D
- Converted downloaded PDF to text.
- Removed newlines, spaces, tabs, nulls etc.
- Added newlines to each substring 'MDL16CS'
- Removed first line with unnecessary information
- Removed last line with unnecessary information
- Removed each subject name leaving only grade of each subject in line with roll no
- Summed up grades and used bc for floating point division for average
- Wrote to file in format '$roll $cgpa'
- Downloaded C4B student list using wget from http://14.139.184.212/ask/c4b/c4b.txt
- Filtered out only Roll and Name & MDL roll numbers
- Joined both files to get CGPA of only C4B students
