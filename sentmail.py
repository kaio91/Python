#!/usr/bin/python
# SangNV

import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders
import os
import sys

from_user = "sangnv@osp.com.vn"
from_user_pass = "pass"

def sentmail(to, subject, text, attach=None):
   msg = MIMEMultipart()
   msg['From'] = from_user
   msg['To'] = to
   msg['Subject'] = subject
   msg.attach(MIMEText(text))
   if attach:
      part = MIMEBase('application', 'octet-stream')
      part.set_payload(open(attach, 'rb').read())
      Encoders.encode_base64(part)
      part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(attach))
      msg.attach(part)
   mailServer = smtplib.SMTP("smtp.gmail.com", 587)
   mailServer.ehlo()
   mailServer.starttls()
   mailServer.ehlo()
   mailServer.login(from_user, from_user_pass)
   mailServer.sendmail(from_user, to, msg.as_string())
   mailServer.close()
   
def main():
   from_to = sys.argv[1]
   subject = sys.argv[2]
   body = sys.argv[3]

   if from_to == "null":
       from_to = "sangnv@osp.com.vn"
   else:
       from_to = from_to

   if subject == "null":
       subject = "Hey! Hello boy handsome"
   else:
       subject = subject
   
   if body == "null":
       body = "I Love You"
   else:
       body = body
   
   sentmail(from_to, subject, body)
   
   
if __name__ == '__main__':	
try:
   main()
   print 'Email sent!'
except:  
   print 'Something went wrong...'   
