# Repeat a Command Until It Runs Successfully

Often time I have to repeat task over and over - to do this it is very simple in Linux, you can achive that by running "for loop", for loop will run the task till you declare it to complete.

let try it together and understand how it works by looking at simple code below:

```
for i in Mon Tues Wed Thus Fri
do
echo "Day is : $i"
done
```

So, let's break it down of what is happening in code above -

The BASH way of using "for" loops is somewhat different to the way most other programming and scripting languages handle "for" loops. Let's break the script down...

In a BASH "for" loop all, the statements between do and done are performed once for every item in the list.

In the above example, the list is everything that comes after the word in (i.e. Mon Tues Wed Thus Fri).

Each time the loop iterates, the next value in the list is inserted into the variable specified after the word "for". In the above loop, the variable is called number.

The echo statement is used to displayed information to the screen.

Therefore, this example takes the numbers 1 through 5 and outputs them one by one to the screen:

```
Day is : Mon
Day is : Tues
Day is : Wed
Day is : Thus
Day is : Fri
```


Few more examples:

Now lets print numeric dates:

```
for d in Mon Tue Wed Thu Fri
do
     date +%Y%m%d -d "last $d"
done | sort
```

bit more complex code:

```
N=10
for i in $(seq $(($N + $N / 5 * 2)) -1 1)
do
    [ `date --date="-$i day" +%u` -le 5 ] &&
       date -d "-$i day" +"File date is : %Y%m%d"
done
```

### Challenge # 1 - generate 100 random number using "for loop"
### Challenge # 2 - generate 100 random files  create directory my_random_files under /tmp directory as part of program and write files to /tmp/my_random_files
