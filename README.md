# Python send mail use gmail \n

Use: Getting the command line input arguments. \n

{ from_to = sys.argv[1]
subject = sys.argv[2]
body = sys.argv[3] }

- Check null send mail default.

from_to = 'null'
   if from_to:
       from_to = "sangnv@osp.com.vn "
   else:
       from_to = from_to

   subject = 'null'
   if subject:
       subject = "Hey! Hello boy handsome"
   else:
       subject = subject
   
   body = 'null'
   if body:
       body = "I Love You"
   else:
       body = body

- Call with command line

Default: sentmail.py null null null
Custom : sentmail.py "sangnv@osp.com.vn" "Hey! Hello boy handsome" "See you again"

___END___
