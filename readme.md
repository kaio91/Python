# Python send mail use gmail

Use: Getting the command line input arguments.

{ from_to = sys.argv[1]
subject = sys.argv[2]
body = sys.argv[3] }

- Check null send mail default.

from_to = 'null'
   if from_to:
       from_to = "admin@sangnv.net "
   else:
       from_to = from_to

   subject = 'null'
   if subject:
       subject = "Hey! Hello boy"
   else:
       subject = subject
   
   body = 'null'
   if body:
       body = "Welcom"
   else:
       body = body

- Call with command line

Default: sentmail.py null null null

Custom : sentmail.py "admin@sangnv.net" "Hey! Hello boy" "See you again"

___END___
