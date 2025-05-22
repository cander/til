#!/bin/sh
#
#
# From: allbery@ncoast.UUCP (allbery@ncoast.UUCP)
# Subject: bournebasic
# Newsgroups: comp.sources.misc
# Date: 1987-08-18 18:54:12 PST
#
# Here's a useful BASIC interpreter written in Bourne shell.
# There's no manual but this demo shows the most salient features:
#
# 10 print "Enter any number and I will double it for you ";
# 20 input x
# 30 y = 2*x
# 40 print "The answer is ";
# 50 print y
# 60 print "Enter -1 if you want to continue."
# 70 input c
# 80 if c = -1 then 10
# 90 print "Bye"
#
# Also, the commands 'load', 'save', 'list', 'run', and 'new'
# work as expected. Enjoy!
#

tfiles=/tmp/bas$$
export tfiles
trap "rm ${tfiles?Bug}*; exit" 2
> ${tfiles}
echo 'Hi there!'
while true
do
    echo -n '>'
    read com com2 || exit
    case $com in
        list)
            cat ${tfiles}
            ;;
        run)
            echo 0 > ${tfiles}.ln
            while true
            do
            while true
            do
                case `cat ${tfiles}.ln` in
                    0)
                        read lineno line || exit
                        ;;
                    *)
                        while true
                        do
                            read lineno line || exit
                            match=`cat ${tfiles}.ln`
                            case $lineno in
                                $match)
                                    break
                                    ;;
                                *)
                                    ;;
                            esac
                        done
                esac
                while true
                do

                    case $line in
                        print*)
                            expr=`echo $line | sed 's/print\ *//'`
                            case $expr in
                                \"*)
                                    echo -n `echo "$expr" | sed 's/^\"//
                                                               s/\".*$//'`
                                    case $line in
                                        *\;)
                                            ;;
                                        *)
                                            echo
                                            ;;
                                    esac
                                    ;;
                                *)
                                    > ${tfiles}.ex
                                    files=`echo ${tfiles}.?`
                                    case $files in
                                        ${tfiles}.\?)
                                            ;;
                                        *)
                                            for i in $files
                                     do
                                         cat $i >> ${tfiles}.ex
                                     done
                                     ;;
                                    esac
                             echo $expr >> ${tfiles}.ex
                                    bc < ${tfiles}.ex > ${tfiles}.res
                                    cat ${tfiles}.res
                                    ;;
                            esac
                            ;;
                        if*)
                            expr=`echo $line | sed '{
                                                    s/if\ */\(/
                                                    s/[#=]/\)-\(/
                                                    s/\ *then.*/\)/
                                                    }'`
                            target=`echo $line | sed 's/.*then\ *//'`
                            > ${tfiles}.ex
                            files=`echo ${tfiles}.?`
                            case $files in
                                ${tfiles}.\?)
                                    ;;
                                *)
                                    for i in $files
                             do
                                 cat $i >> ${tfiles}.ex
                             done
                             ;;
                     esac
                     echo $expr >>${tfiles}.ex
                            res=`bc < ${tfiles}.ex`
                            case $res in
                                0*)
                                    case $line in
                                        *=*)
                                            echo $target > ${tfiles}.ln
                                            exit
                                            ;;
                                        *)
                                            ;;
                                    esac
                                    ;;
                                *)
                                    case $line in
                                        *#*)
                                            echo $target > ${tfiles}.ln
                                            exit
                                            ;;
                                        *)
                                            ;;
                                    esac
                                    ;;
                            esac
                            ;;
                        end*)
                            echo 0 > ${tfiles}.ln
                            exit
                            ;;
                        goto*)
                            expr=`echo $line | sed 's/goto\ *//'`
                            echo $expr > ${tfiles}.ln
                            exit
                            ;;
                        input*)
                            var=`echo $line | sed 's/input\ *//'`
                            echo -n "?"
                            echo -n "$var=" > ${tfiles}.$var
                            while true
                            do
                                read val
                                echo $val
                                break
                            done < /dev/tty >> ${tfiles}.$var
                            ;;
                        *)
                            > ${tfiles}.ex
                            files=`echo ${tfiles}.?`
                            case $files in
                                ${tfiles}.\?)
                                    ;;
                                *)
                                    for i in $files
                             do
                                 cat $i >> ${tfiles}.ex
                             done
                             ;;
                     esac
                     echo $line >>${tfiles}.ex
                            var=`echo $line | sed 's/\ *=.*//'`
                            echo $var >> ${tfiles}.ex
                            bc < ${tfiles}.ex > ${tfiles}.res
                            echo -n $var= > ${tfiles}.$var
                            cat ${tfiles}.res >> ${tfiles}.$var
                            ;;
                    esac
                    read lineno line || exit
                done
            done < ${tfiles}
            case `cat ${tfiles}.ln` in
                0*)
                    break
                    ;;
                *)
                    ;;
            esac
            done
            ;;
        new)
            >${tfiles}
            ;;
        quit)
            echo 'Thank you for your patience.'
            rm ${tfiles?Bug}*
            exit
            ;;
        load)
            cp $com2 ${tfiles}
            ;;
        save)
            cp ${tfiles} $com2
            ;;
        [0-9]*)
            echo $com $com2 > ${tfiles}.nl
            grep -v "^$com" ${tfiles} >> ${tfiles}.nl
            sort -n ${tfiles}.nl > ${tfiles}
            ;;
 "")
     ;;
        *)
            echo 'Illegal command'
    esac
done
