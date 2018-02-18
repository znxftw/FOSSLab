clear
sum=0
i="y"
echo "Enter first no."
read n1
echo "Enter second no."
read n2
while [ $i = "y" ]
do
	echo "1. Addition"
	echo "2. Subtraction"
	echo "3. Multiplication"
	echo "4. Division"
	read ch
	case $ch in
		1)	sum=`expr $n1 + $n2`
			echo "Sum :" $sum;;
		2)	diff=`expr $n1 - $n2`
			echo "Difference :" $diff;;
		3)	prod=`expr $n1 \* $n2`
			echo "Product : " $prod;;
		4)	div=`expr $n1 / $n2`
			echo "Quotient : " $div;;
		*)	echo "Unknown option";;
	esac
	echo "Go again? (y/n)"
	read i
	if [ $i != "y" ]
	then
		exit
	fi
done
